import 'package:get/get.dart';
import 'package:network_topology_gis/src/base/base.dart';
import 'package:network_topology_gis/src/helpers/navigations.dart';
import 'package:network_topology_gis/src/pages/home_page.dart';
import 'package:network_topology_gis/src/pages/login_page.dart';

class ConfigController extends GetxController {
  @override
  void onInit() async {
    await initAppConfig();
    super.onInit();
  }

  @override
  void onReady() async {
    await 2.delay();

    offAll(LoginPage());

    await Base.locationController.enableLocationService();
    await Base.locationController.enableLocationPermission();
    await Base.locationController.locationListener();

    // if (Base.authController.isUserLoggedin()) {
    //   offAll(HomePage());
    // } else {
    //   offAll(LoginPage());
    // }

    super.onReady();
  }

  Future<void> initAppConfig() async {
    /// ====> Initilize Hive, Isar and others config <===

    /// To initialize the Shared Preferences
    //SiteSurveySharedPreferences.initializePrefs();
  }
}
