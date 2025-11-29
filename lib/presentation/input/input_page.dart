import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jimpitan/presentation/auth/provider/auth_notifier.dart';
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
  final _nominalController = TextEditingController();
  final _petugasController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Check authentication on page load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authState = ref.read(authNotifierProvider);
      final user = authState.value;

      if (user == null) {
        context.go('/login');
        return;
      }

      // Initialize controllers with user data
      _namaController.text = 'Firman';
      _nominalController.text = '';
      _petugasController.text = user.name;
      _usernameController.text = user.username;
    });
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nominalController.dispose();
    _petugasController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final user = authState.value;

    // Redirect if not authenticated
    if (user == null) {
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
        // Clear form
        _namaController.clear();
        _nominalController.clear();
        // Keep petugas and username as they are from logged in user

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
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => context.go('/'),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Center(
              child: Text(
                user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
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
                    hintText: 'Enter name',
                    prefixIcon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  InputTextField(
                    controller: _nominalController,
                    label: 'Nominal (Rp)',
                    hintText: 'Enter amount',
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
                  const SizedBox(height: 20),
                  InputTextField(
                    controller: _petugasController,
                    label: 'Petugas',
                    prefixIcon: Icons.admin_panel_settings,
                    readOnly: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Petugas tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  InputTextField(
                    controller: _usernameController,
                    label: 'Username',
                    prefixIcon: Icons.account_circle,
                    readOnly: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),
                  SubmitButton(onPressed: _submitForm),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(inputNominalControllerProvider.notifier)
          .submitInputNominal(
            nama: _namaController.text,
            nominal: _nominalController.text,
            petugas: _petugasController.text,
            username: _usernameController.text,
          );
    }
  }
}
