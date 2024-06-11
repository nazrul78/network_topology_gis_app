import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_topology_gis/src/base/BaseBindings.dart';
import 'package:network_topology_gis/src/config/app_config.dart';
import 'package:network_topology_gis/src/pages/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppConfig.themeData,
      smartManagement: SmartManagement.onlyBuilder,
      initialBinding: BaseBindings(),
      home: const SplashPage(),
    );
  }
}
