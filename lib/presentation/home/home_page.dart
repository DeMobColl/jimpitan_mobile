import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jimpitan/core/const/prefs_key.dart';
import 'package:jimpitan/core/helpers/shared_prefs_helper.dart';
import 'package:jimpitan/presentation/auth/provider/auth_notifier.dart';
import 'provider/auth_refresh_notifier.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/welcome_section.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  initState() {
    super.initState();
    final prefs = ref.read(sharedPrefsHelperProvider);
    log(
      '[HomePage] username -> ${prefs.getString(PrefsKey.username)} \n '
      'password -> ${prefs.getString(PrefsKey.password)}',
    );

    // Trigger silent auth refresh in background
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authRefreshNotifierProvider.notifier).silentRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final user = authState.value;

    // Listen to auth refresh state
    ref.listen<AuthRefreshState>(authRefreshNotifierProvider, (previous, next) {
      if (next == AuthRefreshState.failed ||
          next == AuthRefreshState.sessionExpired) {
        // Show session expired dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text('Session Expired'),
            content: const Text(
              'Your session has expired. Please login again.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  ref.read(authNotifierProvider.notifier).logout();
                  context.go('/login');
                },
                child: const Text('Login'),
              ),
            ],
          ),
        );
      } else if (next == AuthRefreshState.success) {
        log('[HomePage] Auth refreshed successfully');
      }
    });

    return Scaffold(
      appBar: user != null ? const HomeAppBar() : null,
      floatingActionButton: user != null
          ? FloatingActionButton(
              onPressed: () => context.go('/input'),
              child: const Icon(Icons.add),
            )
          : null,
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
                      ElevatedButton.icon(
                        icon: const Icon(Icons.login),
                        label: const Text('Login to Continue'),
                        onPressed: () => context.go('/login'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WelcomeSection(userName: user.name, userRole: user.role),
                    ],
                  ),
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
