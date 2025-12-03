import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jimpitan/core/const/prefs_key.dart';
import 'package:jimpitan/core/helpers/shared_prefs_helper.dart';
import 'package:jimpitan/presentation/qr_scan_customer/providers/qr_scan_provider.dart';
import 'input_controller.dart';
import 'widgets/input_header.dart';
import 'widgets/input_text_field.dart';
import 'widgets/submit_button.dart';

class InputPage extends ConsumerStatefulWidget {
  const InputPage({super.key});

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


      // Get QR scan data
      final qrScanState = ref.read(qrScanNotifierProvider);
      final qrData = qrScanState.value?.data;

      // Initialize controllers
      _namaController.text = qrData?.name ?? '';
      _blokController.text = qrData?.block ?? '';
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

    ref.listen<InputNominalState>(inputNominalControllerProvider, (
      previous,
      next,
    ) {
      if (next.isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data berhasil dikirim!'),
            backgroundColor: Colors.green,
          ),
        );
        // Clear only nominal field, keep customer data
        _nominalController.clear();
        // Keep nama, blok, petugas, and username

        // Reset state after showing success
        Future.delayed(const Duration(seconds: 1), () {
          ref.read(inputNominalControllerProvider.notifier).resetState();
        });
      } else if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${next.error}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
                  SubmitButton(onPressed: () {},),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
