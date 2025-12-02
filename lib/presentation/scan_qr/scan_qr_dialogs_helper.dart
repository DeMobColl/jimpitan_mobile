import 'package:flutter/material.dart';

class ScanQrDialogsHelper {
  /// Shows success dialog when attendance is submitted successfully
  static void showAttendanceSuccessDialog(BuildContext context) {
    if (!context.mounted) return;

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => PopScope(
            canPop: false,
            child: AlertDialog(
              backgroundColor: colorScheme.surface,
              icon: Icon(
                Icons.check_circle,
                color: _getSuccessColor(theme.brightness == Brightness.dark),
                size: 64,
              ),
              title: Text(
                'Absensi Berhasil',
                style: TextStyle(color: colorScheme.onSurface),
              ),
              content: Text(
                'Absensi Anda telah berhasil dikirim.',
                textAlign: TextAlign.center,
                style: TextStyle(color: colorScheme.onSurfaceVariant),
              ),
              actions: [
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                    Navigator.of(context).pop(); // Return to previous screen
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
    );
  }

  /// Shows error dialog when attendance submission fails
  static void showAttendanceErrorDialog(
    BuildContext context,
    String message,
    VoidCallback onRetry,
  ) {
    if (!context.mounted) return;

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: colorScheme.surface,
            icon: Icon(
              Icons.error,
              color: _getErrorColor(theme.brightness == Brightness.dark),
              size: 64,
            ),
            title: Text(
              'Absensi Gagal',
              style: TextStyle(color: colorScheme.onSurface),
            ),
            content: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: colorScheme.onSurfaceVariant),
            ),
            actions: [
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  onRetry();
                },
                child: const Text('Coba Lagi'),
              ),
            ],
          ),
    );
  }

  /// Shows loading dialog during attendance processing
  static void showLoadingDialog(BuildContext context, String message) {
    if (!context.mounted) return;

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => PopScope(
            canPop: false,
            child: AlertDialog(
              backgroundColor: colorScheme.surface,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(color: colorScheme.primary),
                  const SizedBox(height: 16),
                  Text(message, style: TextStyle(color: colorScheme.onSurface)),
                ],
              ),
            ),
          ),
    );
  }

  /// Shows dialog when user is outside attendance location range
  static void showLocationOutOfRangeDialog(
    BuildContext context, {
    required String locationArea,
    required String distance,
    required double maxDistance,
    required VoidCallback onRetry,
  }) {
    if (!context.mounted) return;

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDarkMode = theme.brightness == Brightness.dark;

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: colorScheme.surface,
            icon: Icon(
              Icons.location_off,
              color: _getErrorColor(isDarkMode),
              size: 64,
            ),
            title: Text(
              'Lokasi Terlalu Jauh',
              style: TextStyle(color: colorScheme.onSurface),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Location area badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getErrorBackgroundColor(isDarkMode),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: _getErrorBorderColor(isDarkMode)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.location_off,
                        size: 16,
                        color: _getErrorColor(isDarkMode),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        locationArea,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: _getErrorColor(isDarkMode),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Anda berada di luar jangkauan area absensi.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 12),
                Text(
                  'Jarak Anda: $distance',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Jarak maksimal: ${maxDistance.toInt()} meter',
                  style: TextStyle(
                    fontSize: 12,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            actions: [
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  onRetry();
                },
                child: const Text('Coba Lagi'),
              ),
            ],
          ),
    );
  }

  /// Shows dialog when QR code is invalid or expired
  static void showInvalidOrExpiredQRDialog(
    BuildContext context,
    VoidCallback onRetry,
  ) {
    if (!context.mounted) return;

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => PopScope(
            canPop: false,
            child: AlertDialog(
              backgroundColor: colorScheme.surface,
              icon: Icon(
                Icons.qr_code_scanner,
                color: _getWarningColor(theme.brightness == Brightness.dark),
                size: 64,
              ),
              title: Text(
                'QR Code Tidak Valid',
                style: TextStyle(color: colorScheme.onSurface),
              ),
              content: Text(
                'QR Code yang dipindai tidak valid atau sudah kedaluwarsa. Pastikan Anda memindai QR Code yang aktif dan benar.',
                textAlign: TextAlign.center,
                style: TextStyle(color: colorScheme.onSurfaceVariant),
              ),
              actions: [
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    onRetry();
                  },
                  child: const Text('Coba Lagi'),
                ),
              ],
            ),
          ),
    );
  }

  // Helper methods for consistent theme-aware colors
  static Color _getSuccessColor(bool isDarkMode) {
    return isDarkMode
        ? const Color(0xFF81C784) // Light green for dark mode
        : const Color(0xFF4CAF50); // Green for light mode
  }

  static Color _getErrorColor(bool isDarkMode) {
    return isDarkMode
        ? const Color(0xFFEF5350) // Light red for dark mode
        : const Color(0xFFF44336); // Red for light mode
  }

  static Color _getWarningColor(bool isDarkMode) {
    return isDarkMode
        ? const Color(0xFFFFB74D) // Light orange for dark mode
        : const Color(0xFFFF9800); // Orange for light mode
  }

  static Color _getErrorBackgroundColor(bool isDarkMode) {
    return isDarkMode
        ? const Color(0xFF5C1E1E).withValues(alpha: 0.3) // Dark red background
        : const Color(0xFFFFEBEE); // Light red background
  }

  static Color _getErrorBorderColor(bool isDarkMode) {
    return isDarkMode
        ? const Color(0xFFEF5350).withValues(
          alpha: 0.5,
        ) // Semi-transparent red border
        : const Color(
          0xFFF44336,
        ).withValues(alpha: 0.3); // Semi-transparent red border
  }
}
