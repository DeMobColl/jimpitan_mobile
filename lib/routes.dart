import 'package:go_router/go_router.dart';
import 'package:jimpitan/core/const/app_const.dart';
import 'package:jimpitan/presentation/qr_scan_customer/qr_scan_customer_page.dart';
import 'presentation/splash/splash_page.dart';
import 'presentation/home/home_page.dart';
import 'presentation/input/input_page.dart';
import 'presentation/auth/login_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppConst.splashRoute,
  routes: [
    GoRoute(
      path: AppConst.splashRoute,
      name: AppConst.splashRouteName,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppConst.loginRoute,
      name: AppConst.loginRouteName,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppConst.homeRoute,
      name: AppConst.homeRouteName,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppConst.inputRoute,
      name: AppConst.inputRouteName,
      builder: (context, state) => const InputPage(),
    ),
    GoRoute(
      path: AppConst.scanQrRoute,
      name: AppConst.scanQrRouteName,
      builder: (context, state) => const QrScanCustomerPage(),
    ),
  ],
);
