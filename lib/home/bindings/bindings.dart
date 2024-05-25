





import 'package:get/get.dart';
import 'package:you_app/login/controller/login_controller.dart';

import '../controller/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<HomeController>(() => HomeController());
    // TODO: implement dependencies
  }

}