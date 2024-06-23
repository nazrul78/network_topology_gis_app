import 'package:get/get.dart';
import 'package:network_topology_gis/src/controllers/auth_controller.dart';
import 'package:network_topology_gis/src/controllers/config_controllers.dart';
import 'package:network_topology_gis/src/controllers/home_page_controller.dart';
import 'package:network_topology_gis/src/controllers/location_controller.dart';
import 'package:network_topology_gis/src/controllers/user_controller.dart';

class Base {
  Base._();
  static final configController = Get.find<ConfigController>();
  static final authController = Get.find<AuthController>();
  static final homePageController = Get.find<HomePageController>();
  static final locationController = Get.find<LocationController>();
  static final userController = Get.find<UserController>();
}
