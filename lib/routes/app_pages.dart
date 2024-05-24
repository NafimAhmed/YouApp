


import 'package:get/get.dart';
import 'package:you_app/login/bindings/bindings.dart';
import 'package:you_app/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),

  ];
}
