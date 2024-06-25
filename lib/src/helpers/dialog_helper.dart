import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_topology_gis/src/base/base.dart';
import 'package:network_topology_gis/src/config/app_theme.dart';
import 'package:network_topology_gis/src/helpers/hex_color.dart';
import 'package:network_topology_gis/src/helpers/k_text.dart';

enum RadioSelectedVal { yes, no }

class DialogHelper {
  /// To show Dropdown Dialog
  static void showDropdownDialog() {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: hexToColor('#FFFFFF'),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Obx(
              () => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      KText(
                        text: 'District: ',
                        bold: true,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: Text(
                              Base.homePageController.districts.isNotEmpty
                                  ? 'Select District'
                                  : 'Empty',
                              style: TextStyle(
                                fontFamily: 'Manrope Regular',
                                fontSize: 14.0,
                                color: AppTheme.appTextColor2,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Manrope Regular',
                              fontSize: 14.0,
                              color: AppTheme.appTextColor2,
                              fontWeight: FontWeight.w400,
                            ),

                            // icon: Icon(Icons.keyboard_arrow_down,
                            //     color: AppTheme.appThemeColor2, size: 30.0),
                            items: Base.homePageController.districts
                                .map(
                                  (item) => DropdownMenuItem<int>(
                                    onTap: () {
                                      Base.homePageController.selectedDistrict
                                          .value = item;
                                    },
                                    value: item.id,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0.0),
                                      child: Text(
                                        item.name!,
                                        style: TextStyle(
                                          fontFamily: 'Manrope Regular',
                                          fontSize: 14.0,
                                          color: AppTheme.appTextColor2,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            // dropdownElevation: 8,
                            alignment: AlignmentDirectional.centerStart,
                            // dropdownDecoration: BoxDecoration(
                            //   borderRadius: BorderRadius.only(
                            //     bottomLeft: Radius.circular(5.0),
                            //     bottomRight: Radius.circular(5.0),
                            //   ),
                            // ),

                            // ignore: prefer_null_aware_operators
                            value: Base.homePageController.selectedDistrict
                                        .value !=
                                    null
                                ? Base.homePageController.selectedDistrict
                                    .value!.id
                                : null,

                            onChanged: (item) {
                              log('$item' + 'KKKKKKKKK');
                              // Base.homePageController.selectedDistrict.value =
                              //     item!;

                              // Base.homePageController.selectedUpozila.value =
                              //     '';
                              // Base.homePageController.selectedUnion.value = '';

                              // Base.homePageController.getAreas(district: item);
                            },
                            isExpanded: true,
                            // buttonHeight: 27,
                            // itemHeight: 35.0,
                            // itemPadding:
                            //     const EdgeInsets.symmetric(horizontal: 0.0),
                            // dropdownPadding:
                            //     EdgeInsets.symmetric(horizontal: 0.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: const [
                  //     KText(
                  //       text: 'Upozila: ',
                  //       bold: true,
                  //       fontSize: 16,
                  //     ),
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       flex: 1,
                  //       child: DropdownButtonHideUnderline(
                  //         child: DropdownButton2(
                  //           hint: Text(
                  //             Base.homePageController.upozilas.isNotEmpty
                  //                 ? 'Select Upozila'
                  //                 : 'Empty',
                  //             style: TextStyle(
                  //               fontFamily: 'Manrope Regular',
                  //               fontSize: 14.0,
                  //               color: AppTheme.appTextColor2,
                  //               fontWeight: FontWeight.w400,
                  //             ),
                  //           ),
                  //           style: TextStyle(
                  //             fontFamily: 'Manrope Regular',
                  //             fontSize: 14.0,
                  //             color: AppTheme.appTextColor2,
                  //             fontWeight: FontWeight.w400,
                  //           ),
                  //           icon: Icon(Icons.keyboard_arrow_down,
                  //               color: AppTheme.appThemeColor2, size: 30.0),
                  //           items: Base.homePageController.upozilas
                  //               .map(
                  //                 (item) => DropdownMenuItem<String>(
                  //                   value: item,
                  //                   child: Padding(
                  //                     padding: const EdgeInsets.symmetric(
                  //                         horizontal: 0.0),
                  //                     child: Text(
                  //                       item,
                  //                       style: TextStyle(
                  //                         fontFamily: 'Manrope Regular',
                  //                         fontSize: 14.0,
                  //                         color: AppTheme.appTextColor2,
                  //                         fontWeight: FontWeight.w400,
                  //                       ),
                  //                       overflow: TextOverflow.ellipsis,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               )
                  //               .toList(),
                  //           dropdownElevation: 8,
                  //           alignment: AlignmentDirectional.centerStart,
                  //           dropdownDecoration: BoxDecoration(
                  //             borderRadius: BorderRadius.only(
                  //               bottomLeft: Radius.circular(5.0),
                  //               bottomRight: Radius.circular(5.0),
                  //             ),
                  //           ),
                  //           value: Base.homePageController.selectedUpozila
                  //                       .value !=
                  //                   ''
                  //               ? Base.homePageController.selectedUpozila.value
                  //               : null,
                  //           onChanged: (item) {
                  //             log('$item' + 'KKKKKKKKK');
                  //             // Base.homePageController.selectedUpozila.value =
                  //             //     item!;

                  //             // Base.homePageController.selectedUnion.value = '';

                  //             // Base.homePageController.getAreas(
                  //             //     district: Base.homePageController
                  //             //         .selectedDistrict.value,
                  //             //     upozilla: item);
                  //           },
                  //           isExpanded: true,
                  //           buttonHeight: 27,
                  //           itemHeight: 35.0,
                  //           itemPadding:
                  //               const EdgeInsets.symmetric(horizontal: 0.0),
                  //           dropdownPadding:
                  //               EdgeInsets.symmetric(horizontal: 0.0),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  // SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      KText(
                        text: 'Union: ',
                        bold: true,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: Text(
                              Base.homePageController.districts.isNotEmpty
                                  ? 'Select District'
                                  : 'Empty',
                              style: TextStyle(
                                fontFamily: 'Manrope Regular',
                                fontSize: 14.0,
                                color: AppTheme.appTextColor2,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Manrope Regular',
                              fontSize: 14.0,
                              color: AppTheme.appTextColor2,
                              fontWeight: FontWeight.w400,
                            ),

                            // icon: Icon(Icons.keyboard_arrow_down,
                            //     color: AppTheme.appThemeColor2, size: 30.0),
                            items: Base.homePageController.districts
                                .map(
                                  (item) => DropdownMenuItem<int>(
                                    onTap: () {
                                      Base.homePageController.selectedDistrict
                                          .value = item;
                                    },
                                    value: item.id,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0.0),
                                      child: Text(
                                        item.name!,
                                        style: TextStyle(
                                          fontFamily: 'Manrope Regular',
                                          fontSize: 14.0,
                                          color: AppTheme.appTextColor2,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            // dropdownElevation: 8,
                            alignment: AlignmentDirectional.centerStart,
                            // dropdownDecoration: BoxDecoration(
                            //   borderRadius: BorderRadius.only(
                            //     bottomLeft: Radius.circular(5.0),
                            //     bottomRight: Radius.circular(5.0),
                            //   ),
                            // ),

                            // ignore: prefer_null_aware_operators
                            value: Base.homePageController.selectedDistrict
                                        .value !=
                                    null
                                ? Base.homePageController.selectedDistrict
                                    .value!.id
                                : null,

                            onChanged: (item) {
                              log('$item' + 'KKKKKKKKK');
                              // Base.homePageController.selectedDistrict.value =
                              //     item!;

                              // Base.homePageController.selectedUpozila.value =
                              //     '';
                              // Base.homePageController.selectedUnion.value = '';

                              // Base.homePageController.getAreas(district: item);
                            },
                            isExpanded: true,
                            // buttonHeight: 27,
                            // itemHeight: 35.0,
                            // itemPadding:
                            //     const EdgeInsets.symmetric(horizontal: 0.0),
                            // dropdownPadding:
                            //     EdgeInsets.symmetric(horizontal: 0.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       flex: 1,
                  //       child: DropdownButtonHideUnderline(
                  //         child: DropdownButton2(
                  //           hint: Text(
                  //             Base.homePageController.unions.isNotEmpty
                  //                 ? 'Select Union'
                  //                 : 'Empty',
                  //             style: TextStyle(
                  //               fontFamily: 'Manrope Regular',
                  //               fontSize: 14.0,
                  //               color: AppTheme.appTextColor2,
                  //               fontWeight: FontWeight.w400,
                  //             ),
                  //           ),
                  //           style: TextStyle(
                  //             fontFamily: 'Manrope Regular',
                  //             fontSize: 14.0,
                  //             color: AppTheme.appTextColor2,
                  //             fontWeight: FontWeight.w400,
                  //           ),
                  //           icon: Icon(Icons.keyboard_arrow_down,
                  //               color: AppTheme.appThemeColor2, size: 30.0),
                  //           items: Base.homePageController.unions
                  //               .map(
                  //                 (item) => DropdownMenuItem<String>(
                  //                   value: item,
                  //                   onTap: () async {
                  //                     Base.homePageController.selectedUnion
                  //                         .value = item;
                  //                   },
                  //                   child: Padding(
                  //                     padding: const EdgeInsets.symmetric(
                  //                         horizontal: 0.0),
                  //                     child: Text(
                  //                       item,
                  //                       style: TextStyle(
                  //                         fontFamily: 'Manrope Regular',
                  //                         fontSize: 14.0,
                  //                         color: AppTheme.appTextColor2,
                  //                         fontWeight: FontWeight.w400,
                  //                       ),
                  //                       overflow: TextOverflow.ellipsis,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               )
                  //               .toList(),
                  //           dropdownElevation: 8,
                  //           alignment: AlignmentDirectional.centerStart,
                  //           dropdownDecoration: BoxDecoration(
                  //             borderRadius: BorderRadius.only(
                  //               bottomLeft: Radius.circular(5.0),
                  //               bottomRight: Radius.circular(5.0),
                  //             ),
                  //           ),
                  //           value: Base.homePageController.selectedUnion
                  //                       .value !=
                  //                   ''
                  //               ? Base.homePageController.selectedUnion.value
                  //               : null,
                  //           onChanged: (item) {
                  //             log('$item' + 'KKKKKKKKK');
                  //             Base.homePageController.selectedUnion.value =
                  //                 item!;
                  //           },
                  //           isExpanded: true,
                  //           buttonHeight: 27,
                  //           itemHeight: 35.0,
                  //           itemPadding:
                  //               const EdgeInsets.symmetric(horizontal: 0.0),
                  //           dropdownPadding:
                  //               EdgeInsets.symmetric(horizontal: 0.0),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                          // if (Base.homePageController.selectedDistrict.value !=
                          //     '') {
                          //   Base.homePageController.getSiteInfo(
                          //     district: Base
                          //         .homePageController.selectedDistrict.value,
                          //     upozilla: Base.homePageController.selectedUpozila
                          //                 .value !=
                          //             ''
                          //         ? Base
                          //             .homePageController.selectedUpozila.value
                          //         : null,
                          //     union: Base.homePageController.selectedUnion
                          //                 .value !=
                          //             ''
                          //         ? Base.homePageController.selectedUnion.value
                          //         : null,
                          //   );
                          // }

                          // if (Base.homePageController.selectedDistrictId.value !=
                          //     '') {
                          //   Base.homePageController.selectedDistrict.value =
                          //       Base.homePageController.findItemById(
                          //           Base.homePageController.districts,
                          //           Base.homePageController.selectedDistrictId
                          //               .value);
                          // }

                          // if (Base.homePageController.selectedUpozilaId.value !=
                          //     '') {
                          //   Base.homePageController.selectedUpozila.value =
                          //       Base.homePageController.findItemById(
                          //           Base.homePageController.upozilas,
                          //           Base.homePageController.selectedUpozilaId
                          //               .value);
                          // }

                          // if (Base.homePageController.selectedUnionId.value !=
                          //     '') {
                          //   Base.homePageController.selectedUnion.value =
                          //       Base.homePageController.findItemById(
                          //           Base.homePageController.unions,
                          //           Base.homePageController.selectedUnionId
                          //               .value);
                          //   log('${Base.homePageController.selectedUnion.value!.name}' +
                          //       'test');
                          // }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppTheme.appThemeColor2,
                          padding: EdgeInsets.all(0),
                          side: BorderSide(
                              width: 1, color: AppTheme.appThemeColor2),
                        ),
                        child: KText(
                          text: ' Ok ',
                          color: Colors.white,
                          bold: true,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ).then((value) {
      //Base.homePageController.clearAllSelectedId();
    });
  }

  /// To select an action type
  static void showActionTypeSelectionDialog({
    required String title,
    required String buttonText1,
    required String buttonText2,
    required Function() onPressed1,
    required Function() onPressed2,
  }) {
    Get.defaultDialog(
      titleStyle: TextStyle(fontSize: 18, fontFamily: 'Manrope Bold'),
      backgroundColor: Colors.white,
      title: title,
      titlePadding: EdgeInsets.only(top: 10, bottom: 5),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      content: SizedBox(
        height: 70,
        width: Get.width,
        child: Column(
          children: [
            GestureDetector(
              onTap: onPressed1,
              child: Container(
                width: Get.width,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppTheme.appThemeColor2,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: KText(
                  text: buttonText1,
                  fontSize: 16,
                  color: AppTheme.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: onPressed2,
              child: Container(
                width: Get.width,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppTheme.appThemeColor2,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: KText(
                  text: buttonText2,
                  fontSize: 16,
                  color: AppTheme.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// To view the site information
  // static void showSiteInfoDialog(SiteInfoModel siteInfo) {
  //   Base.homePageController.remote.value = siteInfo.remote! ? 'yes' : 'no';
  //   Base.homePageController.syThreat.value = siteInfo.syThreat! ? 'yes' : 'no';
  //   Base.homePageController.syReqr.value = siteInfo.syReqr! ? 'yes' : 'no';
  //   Get.dialog(
  //     barrierDismissible: false,
  //     Dialog(
  //       child: SingleChildScrollView(
  //         physics: BouncingScrollPhysics(),
  //         child: Container(
  //           padding: EdgeInsets.all(0),
  //           decoration: BoxDecoration(
  //             color: hexToColor('#FFFFFF'),
  //             borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(5),
  //               topRight: Radius.circular(5),
  //               bottomLeft: Radius.circular(5),
  //               bottomRight: Radius.circular(5),
  //             ),
  //           ),
  //           child: Obx(
  //             () => Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Container(
  //                   alignment: Alignment.center,
  //                   //height: 40,
  //                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //                   //  margin: EdgeInsets.only(top: 5, left: 5, right: 5),
  //                   decoration: BoxDecoration(
  //                     color: AppTheme.appThemeColor2,
  //                     borderRadius: BorderRadius.only(
  //                       topLeft: Radius.circular(5),
  //                       topRight: Radius.circular(5),
  //                     ),
  //                   ),
  //                   child: RichText(
  //                     text: TextSpan(
  //                       text: siteInfo.district,
  //                       style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 15,
  //                         fontFamily: 'Manrope Regular',
  //                         fontWeight: FontWeight.w600,
  //                       ),
  //                       // style: DefaultTextStyle.of(context).style,
  //                       children: <TextSpan>[
  //                         TextSpan(
  //                           text: ' > ${siteInfo.upozilla}',
  //                           style: TextStyle(
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                         TextSpan(text: ' > ${siteInfo.siteUnion}'),
  //                         // TextSpan(text: ' > khagrachari 34'),
  //                       ],
  //                     ),
  //                   ),
  //                 ),

  //                 Padding(
  //                   padding: EdgeInsets.symmetric(
  //                     horizontal: 10,
  //                     vertical: 10,
  //                   ),
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       RichText(
  //                         text: TextSpan(
  //                           text: 'Site ID: ',
  //                           style: TextStyle(
  //                             color: AppTheme.textColor,
  //                             fontSize: 14,
  //                             fontFamily: 'Manrope Regular',
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                           // style: DefaultTextStyle.of(context).style,
  //                           children: <TextSpan>[
  //                             TextSpan(
  //                               text: siteInfo.siteId,
  //                               style: TextStyle(
  //                                 fontWeight: FontWeight.w300,
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       // Divider(
  //                       //   height: 0,
  //                       // ),
  //                       RichText(
  //                         text: TextSpan(
  //                           text: 'Lat, Lon: ',
  //                           style: TextStyle(
  //                             color: AppTheme.textColor,
  //                             fontSize: 14,
  //                             fontFamily: 'Manrope Regular',
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                           // style: DefaultTextStyle.of(context).style,
  //                           children: <TextSpan>[
  //                             TextSpan(
  //                               text:
  //                                   '${siteInfo.latitude}, ${siteInfo.longitude}',
  //                               style: TextStyle(
  //                                 fontWeight: FontWeight.w300,
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       // Divider(
  //                       //   height: 0,
  //                       // ),

  //                       // KText(
  //                       //   text: 'Zone/Camp: ',
  //                       //   bold: true,
  //                       //   fontSize: 14,
  //                       // ),

  //                       TextFormField(
  //                         initialValue: siteInfo.zoneCamp,
  //                         onChanged: Base.homePageController.zoneCamp,
  //                         decoration: InputDecoration(
  //                           // errorText: validateUsername(authC.username.value),
  //                           label: KText(
  //                             text: 'Zone/Camp',
  //                             color: hexToColor('#80939D'),
  //                             //color: AppTheme.textColor,
  //                             fontSize: 15,
  //                           ),
  //                           // hintText: 'Enter your username',
  //                           enabledBorder: UnderlineInputBorder(
  //                             borderSide: BorderSide(
  //                                 color: AppTheme.appThemeColor2, width: 1.0),
  //                           ),
  //                           focusedBorder: UnderlineInputBorder(
  //                             borderSide: BorderSide(
  //                                 color: AppTheme.appThemeColor2, width: 1.0),
  //                           ),

  //                           // prefixIcon: Icon(
  //                           //   Icons.person_outline,
  //                           //   color: AppTheme.color3,
  //                           // ),
  //                         ),
  //                       ),

  //                       TextFormField(
  //                         initialValue: siteInfo.distanceFromZoneCamp,
  //                         onChanged:
  //                             Base.homePageController.distanceFromZoneCamp,
  //                         decoration: InputDecoration(
  //                           // errorText: validateUsername(authC.username.value),
  //                           label: KText(
  //                             text: 'Distance from Zone/Camp',
  //                             color: hexToColor('#80939D'),
  //                             //color: AppTheme.textColor,
  //                             fontSize: 15,
  //                           ),
  //                           // hintText: 'Enter your username',
  //                           enabledBorder: UnderlineInputBorder(
  //                             borderSide: BorderSide(
  //                                 color: AppTheme.appThemeColor2, width: 1.0),
  //                           ),
  //                           focusedBorder: UnderlineInputBorder(
  //                             borderSide: BorderSide(
  //                                 color: AppTheme.appThemeColor2, width: 1.0),
  //                           ),

  //                           // prefixIcon: Icon(
  //                           //   Icons.person_outline,
  //                           //   color: AppTheme.color3,
  //                           // ),
  //                         ),
  //                       ),

  //                       SizedBox(
  //                         height: 10,
  //                       ),

  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         children: [
  //                           KText(
  //                             text: 'Remote: ',
  //                             bold: true,
  //                             fontSize: 14,
  //                           ),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           Radio<String>(
  //                             visualDensity: VisualDensity(
  //                                 horizontal: VisualDensity.minimumDensity,
  //                                 vertical: VisualDensity.minimumDensity),
  //                             fillColor: MaterialStateColor.resolveWith(
  //                               (states) => AppTheme.appThemeColor2,
  //                             ),
  //                             materialTapTargetSize:
  //                                 MaterialTapTargetSize.shrinkWrap,
  //                             value: Base.homePageController.remote.value,
  //                             onChanged: (v) {
  //                               Base.homePageController.remote.value =
  //                                   RadioSelectedVal.yes.name;
  //                             },
  //                             groupValue: RadioSelectedVal.yes.name,
  //                           ),
  //                           SizedBox(
  //                             width: 5,
  //                           ),
  //                           GestureDetector(
  //                             onTap: () {
  //                               Base.homePageController.remote.value =
  //                                   RadioSelectedVal.yes.name;
  //                             },
  //                             child: KText(
  //                               text: 'Yes',
  //                               color: AppTheme.appTextColor2,
  //                               fontSize: 16,
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           Radio<String>(
  //                             visualDensity: VisualDensity(
  //                                 horizontal: VisualDensity.minimumDensity,
  //                                 vertical: VisualDensity.minimumDensity),
  //                             fillColor: MaterialStateColor.resolveWith(
  //                               (states) => AppTheme.appThemeColor2,
  //                             ),
  //                             value: Base.homePageController.remote.value,
  //                             onChanged: (v) {
  //                               Base.homePageController.remote.value =
  //                                   RadioSelectedVal.no.name;
  //                             },
  //                             groupValue: RadioSelectedVal.no.name,
  //                           ),
  //                           GestureDetector(
  //                             onTap: () {
  //                               Base.homePageController.remote.value =
  //                                   RadioSelectedVal.no.name;
  //                             },
  //                             child: KText(
  //                               text: 'No',
  //                               color: AppTheme.appTextColor2,
  //                               fontSize: 16,
  //                             ),
  //                           ),
  //                         ],
  //                       ),

  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         children: [
  //                           KText(
  //                             text: 'Sy Threat: ',
  //                             bold: true,
  //                             fontSize: 14,
  //                           ),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           Radio<String>(
  //                             visualDensity: VisualDensity(
  //                                 horizontal: VisualDensity.minimumDensity,
  //                                 vertical: VisualDensity.minimumDensity),
  //                             fillColor: MaterialStateColor.resolveWith(
  //                               (states) => AppTheme.appThemeColor2,
  //                             ),
  //                             materialTapTargetSize:
  //                                 MaterialTapTargetSize.shrinkWrap,
  //                             value: Base.homePageController.syThreat.value,
  //                             onChanged: (v) {
  //                               Base.homePageController.syThreat.value =
  //                                   RadioSelectedVal.yes.name;
  //                             },
  //                             groupValue: RadioSelectedVal.yes.name,
  //                           ),
  //                           SizedBox(
  //                             width: 5,
  //                           ),
  //                           GestureDetector(
  //                             onTap: () {
  //                               Base.homePageController.syThreat.value =
  //                                   RadioSelectedVal.yes.name;
  //                             },
  //                             child: KText(
  //                               text: 'Yes',
  //                               color: AppTheme.appTextColor2,
  //                               fontSize: 16,
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           Radio<String>(
  //                             visualDensity: VisualDensity(
  //                                 horizontal: VisualDensity.minimumDensity,
  //                                 vertical: VisualDensity.minimumDensity),
  //                             fillColor: MaterialStateColor.resolveWith(
  //                               (states) => AppTheme.appThemeColor2,
  //                             ),
  //                             value: Base.homePageController.syThreat.value,
  //                             onChanged: (v) {
  //                               Base.homePageController.syThreat.value =
  //                                   RadioSelectedVal.no.name;
  //                             },
  //                             groupValue: RadioSelectedVal.no.name,
  //                           ),
  //                           GestureDetector(
  //                             onTap: () {
  //                               Base.homePageController.syThreat.value =
  //                                   RadioSelectedVal.no.name;
  //                             },
  //                             child: KText(
  //                               text: 'No',
  //                               color: AppTheme.appTextColor2,
  //                               fontSize: 16,
  //                             ),
  //                           ),
  //                         ],
  //                       ),

  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         children: [
  //                           KText(
  //                             text: 'Sy reqr: ',
  //                             bold: true,
  //                             fontSize: 14,
  //                           ),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           Radio<String>(
  //                             visualDensity: VisualDensity(
  //                                 horizontal: VisualDensity.minimumDensity,
  //                                 vertical: VisualDensity.minimumDensity),
  //                             fillColor: MaterialStateColor.resolveWith(
  //                               (states) => AppTheme.appThemeColor2,
  //                             ),
  //                             materialTapTargetSize:
  //                                 MaterialTapTargetSize.shrinkWrap,
  //                             value: Base.homePageController.syReqr.value,
  //                             onChanged: (v) {
  //                               Base.homePageController.syReqr.value =
  //                                   RadioSelectedVal.yes.name;
  //                             },
  //                             groupValue: RadioSelectedVal.yes.name,
  //                           ),
  //                           SizedBox(
  //                             width: 5,
  //                           ),
  //                           GestureDetector(
  //                             onTap: () {
  //                               Base.homePageController.syReqr.value =
  //                                   RadioSelectedVal.yes.name;
  //                             },
  //                             child: KText(
  //                               text: 'Yes',
  //                               color: AppTheme.appTextColor2,
  //                               fontSize: 16,
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           Radio<String>(
  //                             visualDensity: VisualDensity(
  //                                 horizontal: VisualDensity.minimumDensity,
  //                                 vertical: VisualDensity.minimumDensity),
  //                             fillColor: MaterialStateColor.resolveWith(
  //                               (states) => AppTheme.appThemeColor2,
  //                             ),
  //                             value: Base.homePageController.syReqr.value,
  //                             onChanged: (v) {
  //                               Base.homePageController.syReqr.value =
  //                                   RadioSelectedVal.no.name;
  //                             },
  //                             groupValue: RadioSelectedVal.no.name,
  //                           ),
  //                           GestureDetector(
  //                             onTap: () {
  //                               Base.homePageController.syReqr.value =
  //                                   RadioSelectedVal.no.name;
  //                             },
  //                             child: KText(
  //                               text: 'No',
  //                               color: AppTheme.appTextColor2,
  //                               fontSize: 16,
  //                             ),
  //                           ),
  //                         ],
  //                       ),

  //                       TextFormField(
  //                         initialValue: siteInfo.exceptionalTptReqr,
  //                         onChanged: Base.homePageController.exceptionalTptReqr,
  //                         decoration: InputDecoration(
  //                           // errorText: validateUsername(authC.username.value),
  //                           label: KText(
  //                             text: 'Exceptional tpt reqr',
  //                             color: hexToColor('#80939D'),
  //                             //color: AppTheme.textColor,
  //                             fontSize: 15,
  //                           ),
  //                           // hintText: 'Enter your username',
  //                           enabledBorder: UnderlineInputBorder(
  //                             borderSide: BorderSide(
  //                                 color: AppTheme.appThemeColor2, width: 1.0),
  //                           ),
  //                           focusedBorder: UnderlineInputBorder(
  //                             borderSide: BorderSide(
  //                                 color: AppTheme.appThemeColor2, width: 1.0),
  //                           ),

  //                           // prefixIcon: Icon(
  //                           //   Icons.person_outline,
  //                           //   color: AppTheme.color3,
  //                           // ),
  //                         ),
  //                       ),

  //                       TextFormField(
  //                         initialValue: siteInfo.anyOthersRemarks,
  //                         onChanged: Base.homePageController.anyOthersRemarks,
  //                         decoration: InputDecoration(
  //                           // errorText: validateUsername(authC.username.value),
  //                           label: KText(
  //                             text: 'Any others rmks',
  //                             color: hexToColor('#80939D'),
  //                             //color: AppTheme.textColor,
  //                             fontSize: 15,
  //                           ),
  //                           // hintText: 'Enter your username',
  //                           enabledBorder: UnderlineInputBorder(
  //                             borderSide: BorderSide(
  //                                 color: AppTheme.appThemeColor2, width: 1.0),
  //                           ),
  //                           focusedBorder: UnderlineInputBorder(
  //                             borderSide: BorderSide(
  //                                 color: AppTheme.appThemeColor2, width: 1.0),
  //                           ),

  //                           // prefixIcon: Icon(
  //                           //   Icons.person_outline,
  //                           //   color: AppTheme.color3,
  //                           // ),
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         height: 10,
  //                       ),

  //                       // Row(
  //                       //   mainAxisAlignment: MainAxisAlignment.center,
  //                       //   children: [
  //                       //     Divider(),
  //                       //     KText(
  //                       //       text: 'Details of land owner',
  //                       //       bold: true,
  //                       //       fontSize: 16,
  //                       //     ),
  //                       //     Divider(),
  //                       //   ],
  //                       // )
  //                     ],
  //                   ),
  //                 ),

  //                 Padding(
  //                   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
  //                   child: InputDecorator(
  //                     decoration: InputDecoration(
  //                       labelText: 'Details of land owner',
  //                       labelStyle: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 20,
  //                       ),
  //                       border: OutlineInputBorder(),
  //                     ),
  //                     child: Column(
  //                       children: [
  //                         TextFormField(
  //                           // initialValue: siteInfo.distanceFromZoneCamp,
  //                           onChanged: null,
  //                           decoration: InputDecoration(
  //                             // errorText: validateUsername(authC.username.value),
  //                             label: KText(
  //                               text: 'Name',
  //                               color: hexToColor('#80939D'),
  //                               //color: AppTheme.textColor,
  //                               fontSize: 15,
  //                             ),
  //                             // hintText: 'Enter your username',
  //                             enabledBorder: UnderlineInputBorder(
  //                               borderSide: BorderSide(
  //                                   color: AppTheme.appThemeColor2, width: 1.0),
  //                             ),
  //                             focusedBorder: UnderlineInputBorder(
  //                               borderSide: BorderSide(
  //                                   color: AppTheme.appThemeColor2, width: 1.0),
  //                             ),

  //                             // prefixIcon: Icon(
  //                             //   Icons.person_outline,
  //                             //   color: AppTheme.color3,
  //                             // ),
  //                           ),
  //                         ),
  //                         TextFormField(
  //                           // initialValue: siteInfo.distanceFromZoneCamp,
  //                           onChanged: null,
  //                           decoration: InputDecoration(
  //                             // errorText: validateUsername(authC.username.value),
  //                             label: KText(
  //                               text: 'Address',
  //                               color: hexToColor('#80939D'),
  //                               //color: AppTheme.textColor,
  //                               fontSize: 15,
  //                             ),
  //                             // hintText: 'Enter your username',
  //                             enabledBorder: UnderlineInputBorder(
  //                               borderSide: BorderSide(
  //                                   color: AppTheme.appThemeColor2, width: 1.0),
  //                             ),
  //                             focusedBorder: UnderlineInputBorder(
  //                               borderSide: BorderSide(
  //                                   color: AppTheme.appThemeColor2, width: 1.0),
  //                             ),

  //                             // prefixIcon: Icon(
  //                             //   Icons.person_outline,
  //                             //   color: AppTheme.color3,
  //                             // ),
  //                           ),
  //                         ),
  //                         TextFormField(
  //                           // initialValue: siteInfo.distanceFromZoneCamp,
  //                           onChanged: null,
  //                           decoration: InputDecoration(
  //                             // errorText: validateUsername(authC.username.value),
  //                             label: KText(
  //                               text: 'NID Number',
  //                               color: hexToColor('#80939D'),
  //                               //color: AppTheme.textColor,
  //                               fontSize: 15,
  //                             ),
  //                             // hintText: 'Enter your username',
  //                             enabledBorder: UnderlineInputBorder(
  //                               borderSide: BorderSide(
  //                                   color: AppTheme.appThemeColor2, width: 1.0),
  //                             ),
  //                             focusedBorder: UnderlineInputBorder(
  //                               borderSide: BorderSide(
  //                                   color: AppTheme.appThemeColor2, width: 1.0),
  //                             ),

  //                             // prefixIcon: Icon(
  //                             //   Icons.person_outline,
  //                             //   color: AppTheme.color3,
  //                             // ),
  //                           ),
  //                         ),
  //                         TextFormField(
  //                           // initialValue: siteInfo.distanceFromZoneCamp,
  //                           onChanged: null,
  //                           decoration: InputDecoration(
  //                             // errorText: validateUsername(authC.username.value),
  //                             label: KText(
  //                               text: 'Mobile Number',
  //                               color: hexToColor('#80939D'),
  //                               //color: AppTheme.textColor,
  //                               fontSize: 15,
  //                             ),
  //                             // hintText: 'Enter your username',
  //                             enabledBorder: UnderlineInputBorder(
  //                               borderSide: BorderSide(
  //                                   color: AppTheme.appThemeColor2, width: 1.0),
  //                             ),
  //                             focusedBorder: UnderlineInputBorder(
  //                               borderSide: BorderSide(
  //                                   color: AppTheme.appThemeColor2, width: 1.0),
  //                             ),

  //                             // prefixIcon: Icon(
  //                             //   Icons.person_outline,
  //                             //   color: AppTheme.color3,
  //                             // ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),

  //                 // Row(
  //                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 //   children: [
  //                 //     KText(
  //                 //       text: 'Upozilla: ${siteInfo.upozilla}',
  //                 //       bold: true,
  //                 //       fontSize: 16,
  //                 //     ),
  //                 //   ],
  //                 // ),
  //                 // Row(
  //                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 //   children: [
  //                 //     KText(
  //                 //       text: 'Union: ${siteInfo.siteUnion}',
  //                 //       bold: true,
  //                 //       fontSize: 16,
  //                 //     ),
  //                 //   ],
  //                 // ),

  //                 Padding(
  //                   padding: EdgeInsets.symmetric(horizontal: 10),
  //                   child: Column(
  //                     children: [
  //                       Row(
  //                         children: [
  //                           KText(
  //                             text: 'Type of site: ',
  //                             bold: true,
  //                             fontSize: 14,
  //                           ),
  //                           SizedBox(
  //                             width: 5,
  //                           ),
  //                           Expanded(
  //                             flex: 1,
  //                             child: DropdownButtonHideUnderline(
  //                               child: DropdownButton2(
  //                                 hint: Text(
  //                                   'Select type',
  //                                   style: TextStyle(
  //                                     fontFamily: 'Manrope Regular',
  //                                     fontSize: 14.0,
  //                                     color: AppTheme.appTextColor2,
  //                                     fontWeight: FontWeight.w400,
  //                                   ),
  //                                 ),
  //                                 style: TextStyle(
  //                                   fontFamily: 'Manrope Regular',
  //                                   fontSize: 14.0,
  //                                   color: AppTheme.appTextColor2,
  //                                   fontWeight: FontWeight.w400,
  //                                 ),
  //                                 icon: Icon(Icons.keyboard_arrow_down,
  //                                     color: AppTheme.appThemeColor2,
  //                                     size: 30.0),
  //                                 items: Base.homePageController.typesOfSite
  //                                     .map(
  //                                       (item) => DropdownMenuItem<String>(
  //                                         value: item,
  //                                         child: Padding(
  //                                           padding: const EdgeInsets.symmetric(
  //                                               horizontal: 0.0),
  //                                           child: Text(
  //                                             item,
  //                                             style: TextStyle(
  //                                               fontFamily: 'Manrope Regular',
  //                                               fontSize: 14.0,
  //                                               color: AppTheme.appTextColor2,
  //                                               fontWeight: FontWeight.w400,
  //                                             ),
  //                                             overflow: TextOverflow.ellipsis,
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     )
  //                                     .toList(),
  //                                 dropdownElevation: 8,
  //                                 alignment: AlignmentDirectional.centerStart,
  //                                 dropdownDecoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.only(
  //                                     bottomLeft: Radius.circular(5.0),
  //                                     bottomRight: Radius.circular(5.0),
  //                                   ),
  //                                 ),
  //                                 value: Base.homePageController
  //                                             .selectedTypeOfSite.value !=
  //                                         ''
  //                                     ? Base.homePageController
  //                                         .selectedTypeOfSite.value
  //                                     : null,
  //                                 onChanged: (item) {
  //                                   log('$item' + 'KKKKKKKKK');
  //                                   Base.homePageController.selectedTypeOfSite
  //                                       .value = item!;
  //                                 },
  //                                 isExpanded: true,
  //                                 buttonHeight: 27,
  //                                 itemHeight: 35.0,
  //                                 itemPadding: const EdgeInsets.symmetric(
  //                                     horizontal: 0.0),
  //                                 dropdownPadding:
  //                                     EdgeInsets.symmetric(horizontal: 0.0),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         children: [
  //                           KText(
  //                             text: 'Electricity: ',
  //                             bold: true,
  //                             fontSize: 14,
  //                           ),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           Radio<String>(
  //                             visualDensity: VisualDensity(
  //                                 horizontal: VisualDensity.minimumDensity,
  //                                 vertical: VisualDensity.minimumDensity),
  //                             fillColor: MaterialStateColor.resolveWith(
  //                               (states) => AppTheme.appThemeColor2,
  //                             ),
  //                             materialTapTargetSize:
  //                                 MaterialTapTargetSize.shrinkWrap,
  //                             value: Base.homePageController.electricity.value,
  //                             onChanged: (v) {
  //                               Base.homePageController.electricity.value =
  //                                   RadioSelectedVal.yes.name;
  //                             },
  //                             groupValue: RadioSelectedVal.yes.name,
  //                           ),
  //                           SizedBox(
  //                             width: 5,
  //                           ),
  //                           GestureDetector(
  //                             onTap: () {
  //                               Base.homePageController.electricity.value =
  //                                   RadioSelectedVal.yes.name;
  //                             },
  //                             child: KText(
  //                               text: 'Yes',
  //                               color: AppTheme.appTextColor2,
  //                               fontSize: 16,
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           Radio<String>(
  //                             visualDensity: VisualDensity(
  //                                 horizontal: VisualDensity.minimumDensity,
  //                                 vertical: VisualDensity.minimumDensity),
  //                             fillColor: MaterialStateColor.resolveWith(
  //                               (states) => AppTheme.appThemeColor2,
  //                             ),
  //                             value: Base.homePageController.electricity.value,
  //                             onChanged: (v) {
  //                               Base.homePageController.electricity.value =
  //                                   RadioSelectedVal.no.name;
  //                             },
  //                             groupValue: RadioSelectedVal.no.name,
  //                           ),
  //                           GestureDetector(
  //                             onTap: () {
  //                               Base.homePageController.electricity.value =
  //                                   RadioSelectedVal.no.name;
  //                             },
  //                             child: KText(
  //                               text: 'No',
  //                               color: AppTheme.appTextColor2,
  //                               fontSize: 16,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         children: [
  //                           KText(
  //                             text: 'Solar: ',
  //                             bold: true,
  //                             fontSize: 14,
  //                           ),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           Radio<String>(
  //                             visualDensity: VisualDensity(
  //                                 horizontal: VisualDensity.minimumDensity,
  //                                 vertical: VisualDensity.minimumDensity),
  //                             fillColor: MaterialStateColor.resolveWith(
  //                               (states) => AppTheme.appThemeColor2,
  //                             ),
  //                             materialTapTargetSize:
  //                                 MaterialTapTargetSize.shrinkWrap,
  //                             value: Base.homePageController.solar.value,
  //                             onChanged: (v) {
  //                               Base.homePageController.solar.value =
  //                                   RadioSelectedVal.yes.name;
  //                             },
  //                             groupValue: RadioSelectedVal.yes.name,
  //                           ),
  //                           SizedBox(
  //                             width: 5,
  //                           ),
  //                           GestureDetector(
  //                             onTap: () {
  //                               Base.homePageController.solar.value =
  //                                   RadioSelectedVal.yes.name;
  //                             },
  //                             child: KText(
  //                               text: 'Yes',
  //                               color: AppTheme.appTextColor2,
  //                               fontSize: 16,
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           Radio<String>(
  //                             visualDensity: VisualDensity(
  //                                 horizontal: VisualDensity.minimumDensity,
  //                                 vertical: VisualDensity.minimumDensity),
  //                             fillColor: MaterialStateColor.resolveWith(
  //                               (states) => AppTheme.appThemeColor2,
  //                             ),
  //                             value: Base.homePageController.solar.value,
  //                             onChanged: (v) {
  //                               Base.homePageController.solar.value =
  //                                   RadioSelectedVal.no.name;
  //                             },
  //                             groupValue: RadioSelectedVal.no.name,
  //                           ),
  //                           GestureDetector(
  //                             onTap: () {
  //                               Base.homePageController.solar.value =
  //                                   RadioSelectedVal.no.name;
  //                             },
  //                             child: KText(
  //                               text: 'No',
  //                               color: AppTheme.appTextColor2,
  //                               fontSize: 16,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         children: [
  //                           KText(
  //                             text: 'Earthing: ',
  //                             bold: true,
  //                             fontSize: 14,
  //                           ),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           Radio<String>(
  //                             visualDensity: VisualDensity(
  //                                 horizontal: VisualDensity.minimumDensity,
  //                                 vertical: VisualDensity.minimumDensity),
  //                             fillColor: MaterialStateColor.resolveWith(
  //                               (states) => AppTheme.appThemeColor2,
  //                             ),
  //                             materialTapTargetSize:
  //                                 MaterialTapTargetSize.shrinkWrap,
  //                             value: Base.homePageController.earthing.value,
  //                             onChanged: (v) {
  //                               Base.homePageController.earthing.value =
  //                                   RadioSelectedVal.yes.name;
  //                             },
  //                             groupValue: RadioSelectedVal.yes.name,
  //                           ),
  //                           SizedBox(
  //                             width: 5,
  //                           ),
  //                           GestureDetector(
  //                             onTap: () {
  //                               Base.homePageController.earthing.value =
  //                                   RadioSelectedVal.yes.name;
  //                             },
  //                             child: KText(
  //                               text: 'Yes',
  //                               color: AppTheme.appTextColor2,
  //                               fontSize: 16,
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           Radio<String>(
  //                             visualDensity: VisualDensity(
  //                                 horizontal: VisualDensity.minimumDensity,
  //                                 vertical: VisualDensity.minimumDensity),
  //                             fillColor: MaterialStateColor.resolveWith(
  //                               (states) => AppTheme.appThemeColor2,
  //                             ),
  //                             value: Base.homePageController.earthing.value,
  //                             onChanged: (v) {
  //                               Base.homePageController.earthing.value =
  //                                   RadioSelectedVal.no.name;
  //                             },
  //                             groupValue: RadioSelectedVal.no.name,
  //                           ),
  //                           GestureDetector(
  //                             onTap: () {
  //                               Base.homePageController.earthing.value =
  //                                   RadioSelectedVal.no.name;
  //                             },
  //                             child: KText(
  //                               text: 'No',
  //                               color: AppTheme.appTextColor2,
  //                               fontSize: 16,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Row(
  //                         children: [
  //                           KText(
  //                             text: 'Resistance: ',
  //                             bold: true,
  //                             fontSize: 14,
  //                           ),
  //                           SizedBox(
  //                             width: 5,
  //                           ),
  //                           Expanded(
  //                             flex: 1,
  //                             child: DropdownButtonHideUnderline(
  //                               child: DropdownButton2(
  //                                 hint: Text(
  //                                   'Select type',
  //                                   style: TextStyle(
  //                                     fontFamily: 'Manrope Regular',
  //                                     fontSize: 14.0,
  //                                     color: AppTheme.appTextColor2,
  //                                     fontWeight: FontWeight.w400,
  //                                   ),
  //                                 ),
  //                                 style: TextStyle(
  //                                   fontFamily: 'Manrope Regular',
  //                                   fontSize: 14.0,
  //                                   color: AppTheme.appTextColor2,
  //                                   fontWeight: FontWeight.w400,
  //                                 ),
  //                                 icon: Icon(Icons.keyboard_arrow_down,
  //                                     color: AppTheme.appThemeColor2,
  //                                     size: 30.0),
  //                                 items: Base.homePageController.resistances
  //                                     .map(
  //                                       (item) => DropdownMenuItem<String>(
  //                                         value: item,
  //                                         child: Padding(
  //                                           padding: const EdgeInsets.symmetric(
  //                                               horizontal: 0.0),
  //                                           child: Text(
  //                                             item,
  //                                             style: TextStyle(
  //                                               fontFamily: 'Manrope Regular',
  //                                               fontSize: 14.0,
  //                                               color: AppTheme.appTextColor2,
  //                                               fontWeight: FontWeight.w400,
  //                                             ),
  //                                             overflow: TextOverflow.ellipsis,
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     )
  //                                     .toList(),
  //                                 dropdownElevation: 8,
  //                                 alignment: AlignmentDirectional.centerStart,
  //                                 dropdownDecoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.only(
  //                                     bottomLeft: Radius.circular(5.0),
  //                                     bottomRight: Radius.circular(5.0),
  //                                   ),
  //                                 ),
  //                                 value: Base.homePageController
  //                                             .selectedResistances.value !=
  //                                         ''
  //                                     ? Base.homePageController
  //                                         .selectedResistances.value
  //                                     : null,
  //                                 onChanged: (item) {
  //                                   log('$item' + 'KKKKKKKKK');
  //                                   Base.homePageController.selectedResistances
  //                                       .value = item!;
  //                                 },
  //                                 isExpanded: true,
  //                                 buttonHeight: 27,
  //                                 itemHeight: 35.0,
  //                                 itemPadding: const EdgeInsets.symmetric(
  //                                     horizontal: 0.0),
  //                                 dropdownPadding:
  //                                     EdgeInsets.symmetric(horizontal: 0.0),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),

  //                 SizedBox(height: 30),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     ElevatedButton(
  //                       onPressed: () {
  //                         Get.back();
  //                       },
  //                       style: TextButton.styleFrom(
  //                         backgroundColor: AppTheme.appThemeColor2,
  //                         padding: EdgeInsets.all(0),
  //                         side: BorderSide(
  //                             width: 1, color: AppTheme.appThemeColor2),
  //                       ),
  //                       child: KText(
  //                         text: ' Ok ',
  //                         color: Colors.white,
  //                         bold: true,
  //                         fontSize: 16,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   ).then((value) {
  //     //Base.homePageController.clearAllSelectedId();
  //   });
  // }
}
