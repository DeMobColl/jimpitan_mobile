import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jimpitan/core/const/app_const.dart';
import 'package:jimpitan/core/const/prefs_key.dart';
import 'package:jimpitan/core/helpers/shared_prefs_helper.dart';
import 'package:jimpitan/domain/entities/input/input_nominal_response.dart';
import 'provider/input_notifier.dart';
import 'widgets/input_header.dart';
import 'widgets/input_text_field.dart';
import 'widgets/submit_button.dart';

class InputPage extends ConsumerStatefulWidget {
  final String? customerId;
  final String? customerName;
  final String? customerBlock;

  const InputPage({
    super.key,
    this.customerId,
    this.customerName,
    this.customerBlock,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InputPageState();
}

class _InputPageState extends ConsumerState<InputPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _blokController = TextEditingController();
  final _nominalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize data on page load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final prefsHelper = ref.read(sharedPrefsHelperProvider);
      final isLoggedIn = prefsHelper.getBool(PrefsKey.isLoggedIn) ?? false;

      if (!isLoggedIn) {
        context.go('/login');
        return;
      }

      // Initialize controllers with passed parameters
      _namaController.text = widget.customerName ?? '';
      _blokController.text = widget.customerBlock ?? '';
      _nominalController.text = '';
    });
  }

  @override
  void dispose() {
    _namaController.dispose();
    _blokController.dispose();
    _nominalController.dispose();
    super.dispose();
  }

  /// Show success dialog and navigate to home page
  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return _SuccessDialogContent(
          message: message,
          nama: _namaController.text,
          blok: _blokController.text,
          nominal: _nominalController.text,
          onNavigate: () {
            // Reset state
            ref.read(inputNominalControllerProvider.notifier).resetState();
            // Navigate to home page
            context.goNamed(AppConst.homeRouteName);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Check if user is logged in from shared preferences
    final prefsHelper = ref.watch(sharedPrefsHelperProvider);
    final isLoggedIn = prefsHelper.getBool(PrefsKey.isLoggedIn) ?? false;

    // Redirect if not authenticated
    if (!isLoggedIn) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/login');
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    ref.listen<AsyncValue<InputNominalResponse?>>(
      inputNominalControllerProvider,
      (previous, next) {
        next.when(
          data: (response) {
            log('[INPUT PAGE] Submission response: ${response?.toString()}');
            if (response != null && response.isSuccess) {
              // Show success dialog with information
              _showSuccessDialog(
                context,
                response.message ?? 'Data berhasil dikirim!',
              );
            } else if (response != null && !response.isSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(response.message ?? 'Submission failed'),
                  backgroundColor: Colors.orange,
                ),
              );
            }
          },
          loading: () {
            // Loading state is handled by the button
          },
          error: (error, stack) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: $error'),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Nominal Jimpitan'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const InputHeader(),
                  const SizedBox(height: 32),
                  InputTextField(
                    controller: _namaController,
                    label: 'Nama',
                    hintText: 'Nama pelanggan',
                    prefixIcon: Icons.person,
                    readOnly: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  InputTextField(
                    controller: _blokController,
                    label: 'Blok',
                    hintText: 'Blok pelanggan',
                    prefixIcon: Icons.home_work,
                    readOnly: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Blok tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  InputTextField(
                    controller: _nominalController,
                    label: 'Nominal (Rp)',
                    hintText: 'Masukkan nominal jimpitan',
                    prefixIcon: Icons.payments,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Nominal harus berupa angka';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),
                  SubmitButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        final prefsHelper = ref.read(sharedPrefsHelperProvider);

                        final mobileToken =
                            prefsHelper.getString(PrefsKey.authToken) ?? '';
                        final customerId = widget.customerId ?? '';

                        // log input data
                        log(
                          '[INPUT PAGE] Submitting data for customerId: $customerId, nama: ${_namaController.text}, blok: ${_blokController.text}, nominal: ${_nominalController.text}',
                        );

                        ref
                            .read(inputNominalControllerProvider.notifier)
                            .submitInputNominal(
                              mobileToken: mobileToken,
                              customerId: customerId,
                              id: _blokController.text,
                              nama: _namaController.text,
                              nominal:
                                  int.tryParse(_nominalController.text) ?? 0,
                            );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Success Dialog with auto-dismiss countdown
class _SuccessDialogContent extends StatefulWidget {
  final String message;
  final String nama;
  final String blok;
  final String nominal;
  final VoidCallback onNavigate;

  const _SuccessDialogContent({
    required this.message,
    required this.nama,
    required this.blok,
    required this.nominal,
    required this.onNavigate,
  });

  @override
  State<_SuccessDialogContent> createState() => _SuccessDialogContentState();
}

class _SuccessDialogContentState extends State<_SuccessDialogContent> {
  int _countdown = 3;
  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted && _countdown > 1) {
        setState(() => _countdown--);
        _startCountdown();
      } else if (mounted && _countdown == 1) {
        _navigateToHome();
      }
    });
  }

  void _navigateToHome() {
    if (_isNavigating) return;
    setState(() => _isNavigating = true);

    // Close dialog first
    Navigator.of(context).pop();
    // Then navigate
    widget.onNavigate();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Success Icon with countdown
          Stack(
            alignment: Alignment.center,
            children: [
              // Countdown circle indicator
              SizedBox(
                width: 96,
                height: 96,
                child: CircularProgressIndicator(
                  value: _countdown / 3,
                  strokeWidth: 3,
                  backgroundColor: Colors.green.shade100,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.green.shade300,
                  ),
                ),
              ),
              // Success Icon
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green.shade600,
                  size: 48,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Success Title
          const Text(
            'Input Berhasil!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          // Success Message
          Text(
            widget.message,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          // Customer Info
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow(Icons.person, 'Nama', widget.nama),
                const SizedBox(height: 4),
                _buildInfoRow(Icons.home_work, 'Blok', widget.blok),
                const SizedBox(height: 4),
                _buildInfoRow(
                  Icons.payments,
                  'Nominal',
                  'Rp ${widget.nominal}',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Countdown text
          Text(
            'Kembali ke beranda dalam $_countdown detik...',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          // Button to skip countdown
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isNavigating ? null : _navigateToHome,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Kembali Sekarang',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.blue.shade700),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
