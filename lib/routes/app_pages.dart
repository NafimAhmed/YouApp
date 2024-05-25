


import 'package:get/get.dart';
import 'package:you_app/home/bindings/bindings.dart';
import 'package:you_app/home/views/Home_view.dart';
import 'package:you_app/login/bindings/bindings.dart';
import 'package:you_app/login/views/login_view.dart';
import 'package:you_app/registration/views/registration_view.dart';

import '../home/views/interest_page.dart';
import '../registration/bindings/bindings.dart';

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
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => const RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTEREST_PAGE,
      page: () => const InterestPage(),
      binding: HomeBinding(),
    ),

  ];
}
