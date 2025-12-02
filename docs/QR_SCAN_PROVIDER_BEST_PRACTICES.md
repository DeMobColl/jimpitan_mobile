# QR Scan Provider - Best Practices Implementation

## Overview

This is a **best-practice** implementation of a QR scan provider using Riverpod with code generation. It follows the principle of **separation of concerns**:

- ✅ **Provider**: Pure logic, no UI dependencies
- ✅ **UI Layer**: Handles dialogs, camera control, and presentation
- ✅ **AsyncValue**: Built-in Riverpod state management (loading/error/data)
- ✅ **No Freezed needed**: AsyncValue handles all state patterns
- ✅ **Simple & Clean**: Minimal code, maximum functionality

## Why This Approach is Better

### ❌ Bad Practice (Old Way)

```dart
// Provider has BuildContext
Future<void> scanQr(BuildContext context, ...) {
  showDialog(context, ...);  // ❌ Provider depends on UI
  Navigator.pop(context);    // ❌ Provider controls navigation
}
```

**Problems:**

- Provider is tightly coupled to UI
- Hard to test (needs BuildContext mock)
- Violates separation of concerns
- Can't reuse provider in different UI contexts

### ✅ Good Practice (New Way)

```dart
// Provider is pure logic
Future<void> scanQrCode(String qrHash) {
  state = const AsyncValue.loading();
  state = await AsyncValue.guard(() => usecase.call(request));
}
```

**Benefits:**

- Provider is pure and testable
- UI layer decides how to show state
- Can reuse provider anywhere
- Follows clean architecture principles

## Architecture

### Files Structure

```
lib/presentation/qr_scan_customer/
├── providers/
│   ├── qr_scan_provider.dart       # Pure provider (logic only)
│   └── qr_scan_provider.g.dart     # Generated code
└── qr_scan_page_example.dart       # UI implementation
```

### State Management

Uses Riverpod's **AsyncValue** which automatically provides:

- `loading` - When API call is in progress
- `data` - When API call succeeds
- `error` - When API call fails

No need for custom state classes or Freezed!

## Implementation Guide

### 1. Provider (Pure Logic)

```dart
@riverpod
class QrScanNotifier extends _$QrScanNotifier {
  @override
  AsyncValue<QrScanCustomerResponse?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> scanQrCode(String qrHash) async {
    state = const AsyncValue.loading();

    // Get token
    final token = ref.read(sharedPrefsHelperProvider).getString(PrefsKey.authToken);

    // Call API
    state = await AsyncValue.guard(() async {
      final usecase = ref.read(qrScanCustomerUsecaseProvider);
      return await usecase.call(request);
    });
  }
}
```

**Key Points:**

- ✅ No BuildContext parameter
- ✅ No dialog calls
- ✅ No camera control
- ✅ Just pure data logic

### 2. UI Layer (Presentation)

```dart
@override
void initState() {
  super.initState();

  // Listen to provider state changes
  ref.listenManual(
    qrScanNotifierProvider,
    (previous, next) {
      _handleStateChange(previous, next);
    },
  );
}

void _handleStateChange(previous, next) {
  next.when(
    loading: () {
      _controller.stop();  // Pause camera
      ScanQrDialogsHelper.showLoadingDialog(context, 'Processing...');
    },
    data: (response) {
      if (previous?.isLoading == true) Navigator.pop(context);  // Close loading
      if (response?.isSuccess == true) {
        ScanQrDialogsHelper.showSuccessDialog(context);
      } else {
        ScanQrDialogsHelper.showErrorDialog(context, message, _retry);
      }
    },
    error: (error, _) {
      if (previous?.isLoading == true) Navigator.pop(context);
      ScanQrDialogsHelper.showErrorDialog(context, error.toString(), _retry);
    },
  );
}
```

**Key Points:**

- ✅ UI decides when to show dialogs
- ✅ UI controls camera based on state
- ✅ UI handles navigation
- ✅ Easy to change UI without touching provider

### 3. Trigger Scan (Simple!)

```dart
void _onDetect(BarcodeCapture capture) {
  final scanState = ref.read(qrScanNotifierProvider);

  // Don't process if loading
  if (scanState.isLoading) return;

  final code = capture.barcodes.firstOrNull?.rawValue;
  if (code != null) {
    // Just call the provider method - that's it!
    ref.read(qrScanNotifierProvider.notifier).scanQrCode(code);
  }
}
```

## Complete Minimal Example

```dart
class QrScanPage extends ConsumerStatefulWidget {
  const QrScanPage({super.key});

  @override
  ConsumerState<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends ConsumerState<QrScanPage> {
  final _controller = MobileScannerController();

  @override
  void initState() {
    super.initState();

    // Listen for state changes
    ref.listenManual(qrScanNotifierProvider, (prev, next) {
      next.when(
        loading: () {
          _controller.stop();
          showDialog(context: context, builder: (_) => LoadingDialog());
        },
        data: (response) {
          if (prev?.isLoading == true) Navigator.pop(context);
          if (response?.isSuccess == true) {
            showDialog(context: context, builder: (_) => SuccessDialog());
          }
        },
        error: (error, _) {
          if (prev?.isLoading == true) Navigator.pop(context);
          showDialog(context: context, builder: (_) => ErrorDialog());
        },
      );
    });
  }

  void _onDetect(BarcodeCapture capture) {
    final state = ref.read(qrScanNotifierProvider);
    if (state.isLoading) return;

    final code = capture.barcodes.firstOrNull?.rawValue;
    if (code != null) {
      ref.read(qrScanNotifierProvider.notifier).scanQrCode(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        controller: _controller,
        onDetect: _onDetect,
      ),
    );
  }
}
```

## AsyncValue Methods

### Check State

```dart
final state = ref.watch(qrScanNotifierProvider);

state.isLoading    // true when loading
state.hasValue     // true when has data
state.hasError     // true when has error
state.value        // get data (or null)
state.error        // get error (or null)
```

### Pattern Match

```dart
state.when(
  loading: () => CircularProgressIndicator(),
  data: (data) => Text('Success: $data'),
  error: (error, stack) => Text('Error: $error'),
);
```

### Map State

```dart
state.maybeWhen(
  data: (data) => Text('Data: $data'),
  orElse: () => SizedBox(),
);
```

## Benefits Summary

### 1. Testability

```dart
test('should scan QR successfully', () async {
  final container = ProviderContainer(
    overrides: [
      qrScanCustomerUsecaseProvider.overrideWithValue(mockUsecase),
    ],
  );

  // No need for BuildContext!
  await container.read(qrScanNotifierProvider.notifier).scanQrCode('hash');

  final state = container.read(qrScanNotifierProvider);
  expect(state.hasValue, true);
});
```

### 2. Reusability

```dart
// Can use same provider in different UIs
// Example 1: With dialog
// Example 2: With bottom sheet
// Example 3: With snackbar
// Same provider, different presentations!
```

### 3. Maintainability

- Want to change dialog style? → Change UI layer only
- Want to change API logic? → Change provider only
- Want to add loading indicator? → Change UI layer only
- Clear separation of concerns!

### 4. Simplicity

- No Freezed boilerplate
- No custom state classes
- No complex state management
- Just AsyncValue!

## Comparison

| Feature | Old Approach | New Approach |
|---------|-------------|--------------|
| State Management | Custom Freezed class | Built-in AsyncValue |
| Dialog Handling | In Provider ❌ | In UI Layer ✅ |
| Camera Control | In Provider ❌ | In UI Layer ✅ |
| Testability | Hard (needs context) ❌ | Easy (pure logic) ✅ |
| Lines of Code | ~200 lines | ~50 lines |
| Dependencies | Freezed + Riverpod | Riverpod only |
| Complexity | High | Low |

## Best Practices Checklist

- [x] Provider has no BuildContext parameter
- [x] Provider doesn't call showDialog
- [x] Provider doesn't control camera
- [x] Provider doesn't navigate
- [x] UI layer handles all presentation
- [x] Uses AsyncValue for state
- [x] Easy to test
- [x] Easy to maintain
- [x] Follows clean architecture
- [x] Simple and readable

## Common Patterns

### Pattern 1: Basic Dialog Handling

```dart
ref.listenManual(provider, (prev, next) {
  next.when(
    loading: () => showLoadingDialog(),
    data: (data) => showSuccessDialog(),
    error: (error, _) => showErrorDialog(),
  );
});
```

### Pattern 2: With Camera Control

```dart
next.when(
  loading: () {
    controller.stop();  // Pause camera
    showDialog(...);
  },
  data: (_) {
    // Don't restart camera - navigate away
  },
  error: (_) {
    controller.start();  // Resume camera
  },
);
```

### Pattern 3: With Loading Indicator

```dart
@override
Widget build(BuildContext context) {
  final state = ref.watch(provider);

  return Stack(
    children: [
      MobileScanner(...),
      if (state.isLoading)
        Center(child: CircularProgressIndicator()),
    ],
  );
}
```

## Migration from Old Code

**Before:**

```dart
// Complex state class
class QrScanState {
  final bool isLoading;
  final bool isProcessing;
  final bool isCameraPaused;
  final Response? response;
  final String? error;
}

// Provider with BuildContext
Future<void> scan(BuildContext context, ...) {
  showDialog(context, ...);
  // ...
}
```

**After:**

```dart
// Simple AsyncValue
AsyncValue<Response?> build() => const AsyncValue.data(null);

// Pure provider
Future<void> scanQrCode(String hash) {
  state = await AsyncValue.guard(() => api.call(hash));
}

// UI handles dialogs
ref.listenManual(provider, (prev, next) {
  next.when(...);
});
```

## Conclusion

This implementation follows **Riverpod best practices**:

1. ✅ Keep providers pure (no UI dependencies)
2. ✅ Use AsyncValue for state management
3. ✅ Let UI layer handle presentation
4. ✅ Keep it simple and testable

No need for Freezed, custom state classes, or complex state management. AsyncValue + separation of concerns = clean, maintainable code! 🚀
