// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_scan_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$qrScanNotifierHash() => r'ca516356e764c55c6362787348652d44b88b6b5a';

/// Provider to scan QR code and fetch customer data
/// Returns AsyncValue<QrScanCustomerResponse> for automatic loading/error/data state
///
/// Copied from [QrScanNotifier].
@ProviderFor(QrScanNotifier)
final qrScanNotifierProvider =
    AutoDisposeNotifierProvider<
      QrScanNotifier,
      AsyncValue<QrScanCustomerResponse?>
    >.internal(
      QrScanNotifier.new,
      name: r'qrScanNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$qrScanNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$QrScanNotifier =
    AutoDisposeNotifier<AsyncValue<QrScanCustomerResponse?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
