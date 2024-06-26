import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_topology_gis/src/base/base.dart';
import 'package:network_topology_gis/src/config/app_theme.dart';
import 'package:network_topology_gis/src/helpers/hex_color.dart';
import 'package:network_topology_gis/src/helpers/k_text.dart';
import 'package:network_topology_gis/src/helpers/navigations.dart';
import 'package:network_topology_gis/src/pages/login_page.dart';

class LeftSidebarComponent extends StatelessWidget {
  const LeftSidebarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    //color: hexToColor('#95C08B'),
                    color: AppTheme.appThemeColor,
                    width: Get.width,
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            //color: Colors.white,
                            borderRadius: BorderRadius.circular(45),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 5,
                                blurRadius: 9,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 45,
                            child: CircleAvatar(
                              backgroundColor: hexToColor('#95C08B'),
                              radius: 43,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: FlutterLogo(
                                    size: 80,
                                  )

                                  // userC.userProfileImage.value != null
                                  //     ? Image.memory(
                                  //         userC.userProfileImage.value!,
                                  //         fit: BoxFit.cover,
                                  //         cacheWidth: 100,
                                  //         cacheHeight: 100,
                                  //       )
                                  //     : RenderSvg(path: 'avatar_placeholder'),
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        KText(
                          text: 'Nazrul Islam',
                          // text: Base.userController.currentUser.value != null
                          //     ? Base.userController.currentUser.value!.fullName
                          //     : '',
                          bold: true,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        KText(
                          text: 'Araihazar, Narayenganj',
                          // text: Base.userController.currentUser.value != null
                          //     ? Base.userController.currentUser.value!.address
                          //     : '',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  CustomListTile(
                    Icon(Icons.person, size: 25, color: Colors.black54),
                    'Update My Profile',
                    () {
                      Get.snackbar(
                          'Attention!!', 'This feature is not available yet.',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.white,
                          colorText: Colors.redAccent);
                    },
                  ),
                  CustomListTile(
                    Icon(Icons.change_circle_outlined,
                        size: 25, color: Colors.black54),
                    'Change My Password',
                    () {
                      Get.snackbar(
                          'Attention!!', 'This feature is not available yet.',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.white,
                          colorText: Colors.redAccent);
                    },
                  ),
                  CustomListTile(
                    Icon(Icons.logout_outlined,
                        size: 25, color: Colors.black54),
                    'Logout',
                    () async {
                      offAll(LoginPage());
                      Base.homePageController.clearAllSelectedItem();
                      // Base.authController.logout();
                      // Get.offAll(() => LoginPage());
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            flex: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: KText(
                text: 'Version 1.0.0',
                bold: true,
              ),
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final Widget menuIcon;
  final String text;
  final void Function() onTap;

  const CustomListTile(this.menuIcon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
          splashColor: hexToColor('#95C08B').withOpacity(.7),
          borderRadius: BorderRadius.circular(5),
          onTap: onTap,
          child: SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // Icon(icon),
                    menuIcon,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),
                    KText(
                      text: text,
                      fontSize: 16,
                      bold: true,
                    )
                  ],
                ),
                //Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
