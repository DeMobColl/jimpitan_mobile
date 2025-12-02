# QR Scan Provider - Quick Reference

## ✅ Best Practice Implementation

This provider follows Riverpod best practices:

- **Provider = Pure Logic** (no UI dependencies)
- **UI Layer = Presentation** (dialogs, camera, navigation)
- **AsyncValue = State Management** (no Freezed needed!)

## Usage in 3 Steps

### 1. Listen to State Changes

```dart
@override
void initState() {
  super.initState();

  ref.listenManual(qrScanNotifierProvider, (previous, next) {
    next.when(
      loading: () {
        // Pause camera
        _controller.stop();
        // Show loading dialog
        ScanQrDialogsHelper.showLoadingDialog(context, 'Processing...');
      },
      data: (response) {
        // Close loading dialog
        if (previous?.isLoading == true) Navigator.pop(context);

        // Handle success/error
        if (response?.isSuccess == true) {
          ScanQrDialogsHelper.showAttendanceSuccessDialog(context);
        } else {
          ScanQrDialogsHelper.showAttendanceErrorDialog(
            context,
            'Error message',
            _restartCamera,
          );
        }
      },
      error: (error, _) {
        // Close loading dialog
        if (previous?.isLoading == true) Navigator.pop(context);
        // Show error
        ScanQrDialogsHelper.showAttendanceErrorDialog(
          context,
          error.toString(),
          _restartCamera,
        );
      },
    );
  });
}
```

### 2. Trigger Scan on QR Detection

```dart
void _onDetect(BarcodeCapture capture) {
  final scanState = ref.read(qrScanNotifierProvider);

  // Prevent multiple scans
  if (scanState.isLoading) return;

  final code = capture.barcodes.firstOrNull?.rawValue;
  if (code != null) {
    // Simple! Just call scanQrCode
    ref.read(qrScanNotifierProvider.notifier).scanQrCode(code);
  }
}
```

### 3. Handle Retry

```dart
void _restartCamera() async {
  // Reset provider state
  ref.read(qrScanNotifierProvider.notifier).reset();
  // Restart camera
  await _controller.start();
}
```

## What Happens Automatically

✅ Camera pauses when scanning starts
✅ Loading dialog shows
✅ API call executes
✅ Loading dialog closes
✅ Success/Error dialog shows
✅ State management handled by AsyncValue

## AsyncValue Quick Reference

```dart
final state = ref.watch(qrScanNotifierProvider);

// Check state
state.isLoading    // true when API call in progress
state.hasValue     // true when data available
state.hasError     // true when error occurred
state.value        // get data (or null)
state.error        // get error (or null)

// Pattern match
state.when(
  loading: () => Widget,
  data: (data) => Widget,
  error: (error, stack) => Widget,
);

// Optional pattern match
state.maybeWhen(
  data: (data) => Widget,
  orElse: () => Widget,
);
```

## Complete Minimal Code

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

    // Listen to provider
    ref.listenManual(qrScanNotifierProvider, (prev, next) {
      next.when(
        loading: () {
          _controller.stop();
          ScanQrDialogsHelper.showLoadingDialog(context, 'Processing...');
        },
        data: (response) {
          if (prev?.isLoading == true) Navigator.pop(context);
          if (response?.isSuccess == true) {
            ScanQrDialogsHelper.showAttendanceSuccessDialog(context);
          }
        },
        error: (error, _) {
          if (prev?.isLoading == true) Navigator.pop(context);
          ScanQrDialogsHelper.showAttendanceErrorDialog(
            context,
            error.toString(),
            () {
              ref.read(qrScanNotifierProvider.notifier).reset();
              _controller.start();
            },
          );
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
```

## Key Benefits

| Feature | Benefit |
|---------|---------|
| **No BuildContext in Provider** | Pure, testable logic |
| **AsyncValue State** | No Freezed boilerplate |
| **UI Handles Dialogs** | Flexible presentation |
| **Simple Code** | ~50 lines vs ~200 lines |
| **Easy Testing** | No mocking BuildContext |
| **Separation of Concerns** | Clean architecture |

## Why This is Better

### ❌ Before (Bad)

```dart
// Provider with UI dependencies
Future<void> scan(BuildContext context, ...) {
  showDialog(context, ...);  // ❌ Bad!
  Navigator.pop(context);    // ❌ Bad!
}
```

### ✅ After (Good)

```dart
// Pure provider
Future<void> scanQrCode(String hash) {
  state = await AsyncValue.guard(() => api.call(hash));
}

// UI handles presentation
ref.listenManual(provider, (prev, next) {
  next.when(...);  // ✅ Good!
});
```

## Testing Made Easy

```dart
test('should scan QR successfully', () async {
  final container = ProviderContainer(
    overrides: [
      qrScanCustomerUsecaseProvider.overrideWithValue(mockUsecase),
    ],
  );

  // No BuildContext needed!
  await container.read(qrScanNotifierProvider.notifier).scanQrCode('hash');

  final state = container.read(qrScanNotifierProvider);
  expect(state.hasValue, true);
  expect(state.value?.isSuccess, true);
});
```

## Common Patterns

### Show Loading on Screen (Optional)

```dart
@override
Widget build(BuildContext context) {
  final state = ref.watch(qrScanNotifierProvider);

  return Stack(
    children: [
      MobileScanner(...),
      if (state.isLoading)
        Center(child: CircularProgressIndicator()),
    ],
  );
}
```

### Handle Multiple Error Types

```dart
error: (error, _) {
  String message;
  if (error is NetworkException) {
    message = 'Tidak ada koneksi internet';
  } else if (error is TimeoutException) {
    message = 'Request timeout';
  } else {
    message = error.toString();
  }
  ScanQrDialogsHelper.showAttendanceErrorDialog(context, message, _retry);
},
```

### Debounce Scans

```dart
DateTime? _lastScanTime;

void _onDetect(BarcodeCapture capture) {
  final now = DateTime.now();
  if (_lastScanTime != null &&
      now.difference(_lastScanTime!) < Duration(seconds: 2)) {
    return;  // Ignore scans within 2 seconds
  }

  _lastScanTime = now;
  // ... rest of code
}
```

## Checklist

- [x] Provider has no BuildContext
- [x] Provider doesn't show dialogs
- [x] Provider doesn't control camera
- [x] Uses AsyncValue for state
- [x] UI layer handles presentation
- [x] Easy to test
- [x] Simple and clean
- [x] Follows best practices

That's it! Simple, clean, and following Riverpod best practices. 🚀
