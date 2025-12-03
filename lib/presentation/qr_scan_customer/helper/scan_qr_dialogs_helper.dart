import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jimpitan/core/const/app_const.dart';

class QRScanDialogsHelper {
  /// Shows success dialog when attendance is submitted successfully
  static void showSuccessDialog(BuildContext context) {
    if (!context.mounted) return;

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: AlertDialog(
          backgroundColor: colorScheme.surface,
          icon: Icon(
            Icons.check_circle,
            color: _getSuccessColor(theme.brightness == Brightness.dark),
            size: 64,
          ),
          title: Text(
            'Mendapatkan data jimpitan',
            style: TextStyle(color: colorScheme.onSurface),
          ),
          content: Text(
            'Anda akan dibawa ke halaman input jimpitan.',
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
                context.goNamed(AppConst.inputRouteName);
                // Navigator.of(context).pop(); // Return to previous screen
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }

  /// Shows error dialog when attendance submission fails
  static void showErrorDialog(
    BuildContext context,
    String message,
    VoidCallback onRetry,
  ) {
    if (!context.mounted) return;

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: colorScheme.surface,
        icon: Icon(
          Icons.error,
          color: _getErrorColor(theme.brightness == Brightness.dark),
          size: 64,
        ),
        title: Text(
          'Gagal Mengirim Data Jimpitan',
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
      builder: (context) => PopScope(
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
      builder: (context) => PopScope(
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
}
