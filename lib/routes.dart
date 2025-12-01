import 'package:go_router/go_router.dart';
import 'package:jimpitan/presentation/scan_qr/scan_qr_page.dart';
import 'presentation/splash/splash_page.dart';
import 'presentation/home/home_page.dart';
import 'presentation/input/input_page.dart';
import 'presentation/auth/login_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/input',
      name: 'input',
      builder: (context, state) => const InputPage(),
    ),
    GoRoute(
      path: '/scanQr',
      name: 'scanQr',
      builder: (context, state) => const ScanQrPage(),
    ),
  ],
);
