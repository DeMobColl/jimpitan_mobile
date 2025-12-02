import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/usecases/auth/check_auth_status_usecase.dart';

part 'splash_notifier.g.dart';

enum SplashState { initial, checking, authenticated, unauthenticated }

@riverpod
class SplashNotifier extends _$SplashNotifier {
  @override
  SplashState build() => SplashState.initial;

  Future<void> checkAuthStatus() async {
    state = SplashState.checking;

    // Simulate minimum splash screen display time for better UX
    await Future.delayed(const Duration(seconds: 2));

    final checkAuthUseCase = ref.read(checkAuthStatusUseCaseProvider);
    final isLoggedIn = checkAuthUseCase();

    state = isLoggedIn
        ? SplashState.authenticated
        : SplashState.unauthenticated;
  }
}
