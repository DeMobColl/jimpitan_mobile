import 'package:go_router/go_router.dart';
import 'presentation/home/home_page.dart';
import 'presentation/input/input_page.dart';
import 'presentation/auth/login_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
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
  ],
);
