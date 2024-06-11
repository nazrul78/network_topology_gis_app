import 'package:flutter/material.dart';
import 'package:network_topology_gis/src/config/app_theme.dart';

class AppConfig {
  AppConfig._();

  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    primaryColor: AppTheme.appThemeColor,
  );
}
