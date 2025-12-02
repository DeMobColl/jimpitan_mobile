import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PermissionDeniedWidget extends StatelessWidget {
  const PermissionDeniedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scan QR Presensi',
          style: TextStyle(color: colorScheme.onSurface),
        ),
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
      ),
      backgroundColor: colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.no_photography_rounded,
                size: 64,
                color: colorScheme.onSurfaceVariant,
              ),
              const SizedBox(height: 16),
              Text(
                'Izin Kamera Diperlukan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Untuk memindai QR Code, aplikasi membutuhkan izin untuk mengakses kamera.',
                textAlign: TextAlign.center,
                style: TextStyle(color: colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 24),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                ),
                onPressed: () {
                  Geolocator.openAppSettings();
                },
                child: const Text('Buka Pengaturan'),
              ),
              const SizedBox(height: 8),
              Text(
                'Silakan berikan izin kamera di pengaturan perangkat',
                style: TextStyle(
                  fontSize: 12,
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
