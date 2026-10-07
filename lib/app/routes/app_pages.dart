import 'package:get/get.dart';
import 'package:techinacltest/presentation/features/dashboard/bindings/dashboard_binding.dart';
import 'package:techinacltest/presentation/features/dashboard/view/view_dashboard.dart';
import 'package:techinacltest/presentation/features/login/bindings/login_binding.dart';
import 'package:techinacltest/presentation/features/login/views/login_view.dart';

import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.login;
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
