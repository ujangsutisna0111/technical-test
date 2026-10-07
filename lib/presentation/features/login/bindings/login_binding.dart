import 'package:get/get.dart';
import 'package:techinacltest/presentation/features/login/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Logincontroller>(() => Logincontroller());
  }
}
