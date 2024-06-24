import 'dart:developer';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_topology_gis/src/base/base.dart';
import 'package:network_topology_gis/src/config/api_endpont.dart';
import 'package:network_topology_gis/src/config/app_theme.dart';
import 'package:network_topology_gis/src/config/env.dart';
import 'package:network_topology_gis/src/helpers/k_log.dart';
import 'package:network_topology_gis/src/helpers/k_text.dart';
import 'package:network_topology_gis/src/helpers/navigations.dart';
import 'package:network_topology_gis/src/services/api_service.dart';

import '../pages/home_page.dart';

enum FormDataEnum {
  none,
  email,
  password,
}

class AuthController extends GetxController {
  final apiService = ApiService();

  Color enabledTextField = const Color.fromARGB(255, 63, 56, 89);

  Color enabledTextColor = Colors.white;

  Color disabledTextColor = Colors.grey;

  Color textFieldBgColor = const Color(0xFF1F1A30);

  final obscure = RxBool(true);

  final isLoading = RxBool(false);

  final selectedFild = Rx<FormDataEnum>(FormDataEnum.none);

  final username = RxString('');
  final password = RxString('');

  bool isUsernameAndPassValid() {
    bool value = false;
    if (username.value.length > 3 && password.value.length > 3) {
      value = true;
    }

    return value;
  }

  /// To check the user loggedin
  // bool isUserLoggedin() {
  //   bool value = false;

  //   final userData = SiteSurveySharedPreferences.getString(Constants.USER_INFO);
  //   final userName = SiteSurveySharedPreferences.getString(Constants.USER_NAME);
  //   final token = SiteSurveySharedPreferences.getString(Constants.TOKEN);

  //   if (userData != null && userName != null && token != null) {
  //     final userModel = UserModel.fromJson(jsonDecode(userData));

  //     Base.userController.userName.value = userName;
  //     Base.userController.currentUser.value = userModel;
  //     Base.userController.token.value = token;
  //     value = true;
  //   }

  //   return value;
  // }

  /// To add Username in login page
  // bool addUserNameInLoginPage() {
  //   bool value = false;

  //   final userName = SiteSurveySharedPreferences.getString(Constants.USER_NAME);

  //   if (userName != null) {
  //     Base.authController.username.value = userName;
  //     Base.authController.selectedFild.value = FormDataEnum.email;
  //   }

  //   return value;
  // }

  /// To clear all the data after logout.
  // void logout() {
  //   SiteSurveySharedPreferences.removeKey((Constants.USER_INFO));
  //   SiteSurveySharedPreferences.removeKey((Constants.TOKEN));

  //   Base.homePageController.districts.clear();
  //   Base.homePageController.upozilas.clear();
  //   Base.homePageController.unions.clear();

  //   Base.homePageController.selectedDistrict.value = '';
  //   Base.homePageController.selectedUpozila.value = '';
  //   Base.homePageController.selectedUnion.value = '';

  //   Base.homePageController.siteInfoList.clear();
  //   Base.homePageController.editSiteInfoItem.value = null;
  //   Base.homePageController.siteInfoMarkers.clear();
  // }

  /// To login
  Future<void> login() async {
    isLoading.value = true;
    try {
      final response = await apiService.post(
        baseUrl: ENV.baseUrl,
        path: ApiEndpoint.login,
        body: {
          'email': username.value,
          'password': password.value,
        },
      );

      var rawData = response.data;

      klog('rawData: ${response.data}');
      klog('Code: ${response.statusCode}');
      klog('statusMessage: ${response.statusMessage}');

      final statusCode = response.statusCode;
      //  final statusMessage = response.statusMessage;

      // klog(accessToken);
      // final statusCode = response.data['status'] as int;
      // klog('status: $statusCode');

      // final message = response.data['message'] as String;
      // klog('message: $message');

      // if (rawData != null && statusCode == 200) {
      if (rawData != null && statusCode == 200) {
        // final token = rawData['token'] as String;
        final accessToken = response.data['access_token'] as String;
        Base.userController.userName.value = username.value;
        Base.userController.token.value = accessToken;

        // final userInfo = rawData['userInfo'];

        // final encodedUserData = jsonEncode(userInfo);

        // final userModel = UserModel.fromJson(userInfo);

        // Base.userController.userName.value = userModel.username!;
        // Base.userController.currentUser.value = userModel;

        // SiteSurveySharedPreferences.setString(
        //     Constants.USER_NAME, userModel.username!);
        // SiteSurveySharedPreferences.setString(Constants.TOKEN, token);
        // SiteSurveySharedPreferences.setString(
        //     Constants.USER_INFO, encodedUserData);

        username.value = '';
        password.value = '';

        Base.authController.selectedFild.value = FormDataEnum.none;

        offAll(HomePage());
      } else {
        Get.defaultDialog(
          backgroundColor: Colors.white,
          title: '',
          content: SizedBox(
            height: 200,
            width: Get.width,
            child: Column(
              children: [
                Icon(
                  EvaIcons.alertTriangleOutline,
                  color: Colors.red.withOpacity(.6),
                  size: 60,
                ),
                SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: KText(
                    // text: statusMessage ?? 'Wrong username or password!',
                    text: 'Wrong username or password!',
                    fontSize: 17,
                    bold: false,
                    color: AppTheme.textColor,
                    maxLines: 3,
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                SizedBox(
                  width: Get.width / 2,
                  child: TextButton(
                    onPressed: () => Get.back(),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppTheme.appThemeColor2)),
                    child: KText(
                      text: 'OK',
                      bold: true,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    } catch (e) {
      log('Login not success', error: e.toString());
      Get.snackbar(
        'Something wrong!!',
        'Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> dataGet() async {
  //   // https://jsonplaceholder.typicode.com/posts
  //   final response = await apiService.get(
  //     baseUrl: 'https://jsonplaceholder.typicode.com',
  //     path: '/posts',
  //   );

  //   klog('Response: ${response!.data}');
  // }

  // TextEditingController emailController = new TextEditingController();

  // TextEditingController passwordController = new TextEditingController();
}
