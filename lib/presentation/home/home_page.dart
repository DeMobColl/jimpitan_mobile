import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../auth/auth_controller.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/welcome_section.dart';
import 'widgets/home_action_button.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final user = authState.value;

    return Scaffold(
      appBar: user != null ? const HomeAppBar() : null,
      body: SafeArea(
        child: authState.when(
          data: (user) {
            if (user == null) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WelcomeSection(userName: null, userRole: null),
                      const SizedBox(height: 32),
                      HomeActionButton(
                        icon: Icons.login,
                        label: 'Login to Continue',
                        onPressed: () => context.go('/login'),
                      ),
                    ],
                  ),
                ),
              );
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    WelcomeSection(userName: user.name, userRole: user.role),
                    const SizedBox(height: 40),
                    HomeActionButton(
                      icon: Icons.add,
                      label: 'Add New Entry',
                      onPressed: () => context.go('/input'),
                    ),
                  ],
                ),
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 48, color: Colors.red[300]),
                const SizedBox(height: 16),
                Text(
                  'Error: $error',
                  style: TextStyle(color: Colors.red[300]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
