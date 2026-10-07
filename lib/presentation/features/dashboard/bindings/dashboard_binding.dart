import 'package:get/instance_manager.dart';
import 'package:techinacltest/presentation/features/dashboard/controllers/dashboard_controllers.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DashboardControllers>((() => DashboardControllers()));
  }
}
