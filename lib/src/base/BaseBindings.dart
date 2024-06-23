import 'package:get/get.dart';
import 'package:network_topology_gis/src/controllers/auth_controller.dart';
import 'package:network_topology_gis/src/controllers/config_controllers.dart';
import 'package:network_topology_gis/src/controllers/home_page_controller.dart';
import 'package:network_topology_gis/src/controllers/location_controller.dart';
import 'package:network_topology_gis/src/controllers/user_controller.dart';

class BaseBindings implements Bindings {
  @override
  void dependencies() {
    // ***Controllers***
    Get.lazyPut(() => ConfigController());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => LocationController());
    Get.lazyPut(() => UserController());
  }
}
