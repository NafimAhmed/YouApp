





import 'package:get/get.dart';
import 'package:you_app/login/controller/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<LoginController>(() => LoginController());
    // TODO: implement dependencies
  }

}