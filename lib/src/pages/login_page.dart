import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_topology_gis/src/base/base.dart';
import 'package:network_topology_gis/src/config/app_theme.dart';
import 'package:network_topology_gis/src/controllers/auth_controller.dart';
import 'package:network_topology_gis/src/helpers/k_text.dart';
import 'package:network_topology_gis/src/helpers/navigations.dart';
import 'package:network_topology_gis/src/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Base.authController.addUserNameInLoginPage();
    final userName =
        TextEditingController(text: Base.authController.username.value);

    return Scaffold(
      backgroundColor: AppTheme.appThemeColor,
      body: Obx(
        () => Center(
          child: Card(
            elevation: 5,
            // color: const Color.fromARGB(255, 171, 211, 250).withOpacity(0.3),
            color: AppTheme.appThemeColor2,
            child: Container(
              margin: EdgeInsets.all(15),
              height: 400,
              width: Get.width,
              decoration: BoxDecoration(
                // color: AppTheme.white,
                // gradient: LinearGradient(
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                //   stops: const [0.1, 0.4, 0.7, 0.9],
                //   colors: [
                //     // HexColor("#4b4293").withOpacity(0.8),
                //     // HexColor("#4b4293"),
                //     // HexColor("#08418e"),
                //     // HexColor("#08418e"),
                //     hexToColor('#4b4293').withOpacity(0.8),
                //     hexToColor('#4b4293'),
                //     hexToColor('#08418e'),
                //     hexToColor('#08418e')
                //   ],
                // ),
                //color: AppTheme.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.asset(
                      'assets/img/app_logo.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  KText(
                    // text: 'Teletalk Hilly Area',
                    text: 'BD Army',
                    color: AppTheme.white,
                    // color: Base.authController.textFieldBgColor,
                    fontSize: 18,
                    bold: true,
                    //fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Base.authController.selectedFild.value ==
                              FormDataEnum.email
                          ? Base.authController.enabledTextField
                          : Base.authController.textFieldBgColor,
                    ),
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      // onChanged: Base.authController.username,
                      controller: userName,
                      onChanged: (value) => Base.authController.username.value =
                          value.removeAllWhitespace.toLowerCase(),
                      onTap: () {
                        Base.authController.selectedFild.value =
                            FormDataEnum.email;
                      },
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        // errorText: 'Enter valid username',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Base.authController.selectedFild.value ==
                                  FormDataEnum.email
                              ? Base.authController.enabledTextColor
                              : Base.authController.disabledTextColor,
                          size: 20,
                        ),
                        hintText: 'Username',
                        hintStyle: TextStyle(
                          color: Base.authController.selectedFild.value ==
                                  FormDataEnum.email
                              ? Base.authController.enabledTextColor
                              : Base.authController.disabledTextColor,
                          fontSize: 12,
                        ),
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(
                          color: Base.authController.selectedFild.value ==
                                  FormDataEnum.email
                              ? Base.authController.enabledTextColor
                              : Base.authController.disabledTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Base.authController.selectedFild.value ==
                                FormDataEnum.password
                            ? Base.authController.enabledTextField
                            : Base.authController.textFieldBgColor),
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      onChanged: Base.authController.password,
                      onTap: () {
                        Base.authController.selectedFild.value =
                            FormDataEnum.password;
                      },
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock_open_outlined,
                            color: Base.authController.selectedFild.value ==
                                    FormDataEnum.password
                                ? Base.authController.enabledTextColor
                                : Base.authController.disabledTextColor,
                            size: 20,
                          ),
                          suffixIcon: IconButton(
                              icon: Base.authController.obscure.value
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Base.authController.selectedFild
                                                  .value ==
                                              FormDataEnum.password
                                          ? Base.authController.enabledTextColor
                                          : Base
                                              .authController.disabledTextColor,
                                      size: 20,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: Base.authController.selectedFild
                                                  .value ==
                                              FormDataEnum.password
                                          ? Base.authController.enabledTextColor
                                          : Base
                                              .authController.disabledTextColor,
                                      size: 20,
                                    ),
                              onPressed: () => Base.authController.obscure
                                  .value = !Base.authController.obscure.value),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              color: Base.authController.selectedFild.value ==
                                      FormDataEnum.password
                                  ? Base.authController.enabledTextColor
                                  : Base.authController.disabledTextColor,
                              fontSize: 12)),
                      obscureText: Base.authController.obscure.value,
                      textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(
                          color: Base.authController.selectedFild.value ==
                                  FormDataEnum.password
                              ? Base.authController.enabledTextColor
                              : Base.authController.disabledTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () async {
                      if (Base.authController.isUsernameAndPassValid()) {
                        log('UserName: ${Base.authController.username.value}');
                        log('PassWord: ${Base.authController.password.value}');

                        await Base.authController.login();
                        // offAll(HomePage());
                      }
                    },
                    style: TextButton.styleFrom(
                        backgroundColor:
                            Base.authController.isUsernameAndPassValid()
                                ? Base.authController.textFieldBgColor
                                : Colors.grey.withOpacity(.4),
                        // backgroundColor: Base.authController.textFieldBgColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: 14.0,
                          horizontal: 50,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                    child: Base.authController.isLoading.value
                        ? CircularProgressIndicator()
                        : KText(
                            text: 'Login',
                            fontSize: 18,
                            bold: true,
                            color: AppTheme.white,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
