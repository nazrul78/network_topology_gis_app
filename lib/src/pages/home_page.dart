import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:network_topology_gis/src/base/base.dart';
import 'package:network_topology_gis/src/components/left_sidebar_component.dart';
import 'package:network_topology_gis/src/config/app_theme.dart';
import 'package:network_topology_gis/src/helpers/dialog_helper.dart';
import 'package:network_topology_gis/src/helpers/k_log.dart';
import 'package:network_topology_gis/src/helpers/k_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        drawer: const LeftSidebarComponent(),
        appBar: AppBar(
          foregroundColor: Colors.white,
          centerTitle: true,
          title: const KText(
            text: 'BTCL',
            // color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
          backgroundColor: AppTheme.appThemeColor,
        ),
        // body: const Center(
        //   child: Text('Home page'),
        // ),
        body: Stack(
          children: [
            FlutterMap(
              mapController: Base.homePageController.kMapController,
              options: MapOptions(
                initialCenter: Base.homePageController.centerLatlng.value ??
                    LatLng(22, 90),
                initialZoom: 10,
                onTap: (tapPosition, point) {
                  klog('$point');
                },
              ),
              children: [
                TileLayer(
                  ///======>> OSM Map=========
                  // urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',

                  ///======>> SAT Map=========
                  // urlTemplate:
                  //     'http://www.google.cn/maps/vt?lyrs=s@189&gl=cn&x={x}&y={y}&z={z}',

                  ///======>> Google Map=========
                  urlTemplate:
                      'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                  subdomains: const ['mt0', 'mt1', 'mt2', 'mt3'],
                  // userAgentPackageName: 'com.example.app',
                ),

                // if (Base.homePageController.editSiteInfoItem.value != null)
                //   DragMarkers(
                //     markers: [
                //       DragMarker(
                //         key: GlobalKey<DragMarkerWidgetState>(),
                //         point: LatLng(
                //             Base.homePageController.editSiteInfoItem.value!
                //                 .latitude!,
                //             Base.homePageController.editSiteInfoItem.value!
                //                 .longitude!),
                //         size: const Size.square(60),
                //         offset: const Offset(0, -20),
                //         builder: (_, pos, isDragging) {
                //           // klog(pos);
                //           if (isDragging) {
                //             return const Icon(
                //               Icons.edit_location,
                //               size: 75,
                //               color: Colors.blueGrey,
                //             );
                //           }
                //           return const Icon(
                //             Icons.location_pin,
                //             size: 60,
                //             color: Colors.blueGrey,
                //           );
                //         },
                //         onDragEnd: (details, point) {
                //           klog("End point $point");
                //           klog(
                //               "Prev point ${Base.homePageController.editSiteInfoItem.value!.latitude}, ${Base.homePageController.editSiteInfoItem.value!.longitude}");
                //           Base.homePageController.editSiteInfoItem.value!
                //               .latitude = point.latitude;
                //           Base.homePageController.editSiteInfoItem.value!
                //               .longitude = point.longitude;

                //           klog(
                //               "Current point ${Base.homePageController.editSiteInfoItem.value!.latitude}, ${Base.homePageController.editSiteInfoItem.value!.longitude}");
                //         },
                //       ),
                //     ],
                //   ),

                // MarkerLayer(
                //   markers: Base.homePageController.siteInfoMarkers,
                //   // markers: [
                //   //   Marker(
                //   //     point: LatLng(23.809957, 90.4037839),
                //   //     width: 60,
                //   //     height: 60,
                //   //     // child: FlutterLogo(),
                //   //     child: GestureDetector(
                //   //         onTap: () {
                //   //           DialogHelper.showActionTypeSelectionDialog(
                //   //             title: 'Select an action type',
                //   //             buttonText1: 'Edit',
                //   //             buttonText2: 'Drag',
                //   //             onPressed1: () {
                //   //               Get.back();

                //   //               log('Marker pressed>>>>>>>>>>>>>>>>>');

                //   //               //  DialogHelper.showRotationDialog(item.id!);
                //   //             },
                //   //             onPressed2: () {
                //   //               Get.back();
                //   //             },
                //   //           );
                //   //         },
                //   //         child: Icon(Icons.location_pin, size: 60)),
                //   //   ),
                //   //   Marker(
                //   //     point: LatLng(22.787467, 89.921511),
                //   //     width: 60,
                //   //     height: 60,
                //   //     // child: FlutterLogo(),
                //   //     child: Icon(Icons.location_pin, size: 60),
                //   //   ),
                //   // ],
                // ),

                if (Base.homePageController.isCurrentLocationEnable.value)
                  CircleLayer(
                    circles: [
                      CircleMarker(
                        point: Base.locationController.currentLoc.value!,
                        radius: 9,
                        useRadiusInMeter: false,
                        color: Colors.blue,
                        borderStrokeWidth: 3,
                        borderColor: Colors.white,
                      ),
                    ],
                  ),

                MarkerLayer(
                  markers: Base.homePageController.applianceMarkers,
                  // markers: [
                  //   Marker(
                  //     point: LatLng(23.809957, 90.4037839),
                  //     width: 60,
                  //     height: 60,
                  //     // child: FlutterLogo(),
                  //     child: GestureDetector(
                  //         onTap: () {
                  //           DialogHelper.showActionTypeSelectionDialog(
                  //             title: 'Select an action type',
                  //             buttonText1: 'Edit',
                  //             buttonText2: 'Drag',
                  //             onPressed1: () {
                  //               Get.back();

                  //               log('Marker pressed>>>>>>>>>>>>>>>>>');

                  //               //  DialogHelper.showRotationDialog(item.id!);
                  //             },
                  //             onPressed2: () {
                  //               Get.back();
                  //             },
                  //           );
                  //         },
                  //         child: Icon(Icons.location_pin, size: 60)),
                  //   ),
                  //   Marker(
                  //     point: LatLng(22.787467, 89.921511),
                  //     width: 60,
                  //     height: 60,
                  //     // child: FlutterLogo(),
                  //     child: Icon(Icons.location_pin, size: 60),
                  //   ),
                  // ],
                ),
                MarkerLayer(
                  markers: Base.homePageController.linkPointsMarkers,
                  // markers: [
                  //   Marker(
                  //     point: LatLng(23.809957, 90.4037839),
                  //     width: 60,
                  //     height: 60,
                  //     // child: FlutterLogo(),
                  //     child: GestureDetector(
                  //         onTap: () {
                  //           DialogHelper.showActionTypeSelectionDialog(
                  //             title: 'Select an action type',
                  //             buttonText1: 'Edit',
                  //             buttonText2: 'Drag',
                  //             onPressed1: () {
                  //               Get.back();

                  //               log('Marker pressed>>>>>>>>>>>>>>>>>');

                  //               //  DialogHelper.showRotationDialog(item.id!);
                  //             },
                  //             onPressed2: () {
                  //               Get.back();
                  //             },
                  //           );
                  //         },
                  //         child: Icon(Icons.location_pin, size: 60)),
                  //   ),
                  //   Marker(
                  //     point: LatLng(22.787467, 89.921511),
                  //     width: 60,
                  //     height: 60,
                  //     // child: FlutterLogo(),
                  //     child: Icon(Icons.location_pin, size: 60),
                  //   ),
                  // ],
                ),

                //            CircleMarker(
                //   point: currentLatLng,
                //   radius: 9,
                //   useRadiusInMeter: false,
                //   color: Colors.blue,
                //   borderStrokeWidth: 3,
                //   borderColor: Colors.white,
                // ),

                // PolylineLayer(
                //   polylines: [
                //     Polyline(
                //       points: [
                //         LatLng(23.112618, 90.065902),
                //         LatLng(22.787467, 89.921511)
                //       ],
                //       color: Colors.blue,
                //     ),
                //   ],
                // ),
              ],
            ),
            GestureDetector(
              onTap: () async {
                Base.homePageController.clearAllSelectedItem();

                Base.homePageController.getDistrict();

                DialogHelper.showDropdownDialog();
              },
              child: SingleChildScrollView(
                child: Container(
                    alignment: Alignment.center,
                    //height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                    decoration: BoxDecoration(
                        color: AppTheme.appThemeColor2,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: RichText(
                      text: TextSpan(
                        // ignore: unnecessary_null_comparison
                        text: Base.homePageController.selectedDistrict.value !=
                                null
                            ? Base
                                .homePageController.selectedDistrict.value!.name
                            : 'Please select a district & union.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Manrope Regular',
                            fontWeight: FontWeight.w600),
                        // style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: Base.homePageController.selectedUnion
                                          .value !=
                                      null
                                  ? ' > ${Base.homePageController.selectedUnion.value!.name}'
                                  : ''),
                          // TextSpan(text: ' > khagrachari 34'),
                        ],
                      ),
                    )
                    // child: RichText(
                    //   text: TextSpan(
                    //     text: 'khagrachari 1 ',
                    //     style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 15,
                    //         fontFamily: 'Manrope Regular',
                    //         fontWeight: FontWeight.w600),
                    //     // style: DefaultTextStyle.of(context).style,
                    //     children: const <TextSpan>[
                    //       TextSpan(
                    //           text: ' > khagrachari 2',
                    //           style: TextStyle(fontWeight: FontWeight.bold)),
                    //       TextSpan(text: ' > khagrachari 3'),
                    //       TextSpan(text: ' > khagrachari 34'),
                    //     ],
                    //   ),
                    // )

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: const [
                    //     // Text(
                    //     //   'khagrachari 1',
                    //     //   style: TextStyle(fontSize: 16),
                    //     // ),
                    //     KText(
                    //       text: 'khagrachari 1',
                    //       color: Colors.black,
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.w600,
                    //     ),

                    //     KText(
                    //       text: ' > khagrachari 2',
                    //       color: Colors.black,
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //     KText(
                    //       text: ' > khagrachari 3',
                    //       color: Colors.black,
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   ],
                    // ),
                    ),
              ),
            ),
            Positioned(
              bottom: 60,
              right: 15,
              child: GestureDetector(
                onTap: () {
                  if (Base.locationController.currentLoc.value != null) {
                    Base.homePageController.isCurrentLocationEnable.toggle();
                    if (Base.homePageController.isCurrentLocationEnable.value) {
                      Base.homePageController.kMapController
                          .move(Base.locationController.currentLoc.value!, 15);
                    }
                  }

                  // Base.homePageController.centerLatlng.value =
                  //     LatLng(23, 90);
                  // Base.homePageController.kMapController
                  //     .move(LatLng(23, 90), 10);

                  // Base.homePageController
                  //     .getSiteInfo(district: 'Bandarban');
                  // Base.homePageController.getAreas(
                  //     district: 'Bandarban', upozilla: 'Alikadam');
                },
                child: Icon(Icons.my_location,
                    size: 45,
                    color: Base.homePageController.isCurrentLocationEnable.value
                        ? Colors.black
                        : AppTheme.appThemeColor2),
              ),
            ),
            // if (Base.homePageController.editSiteInfoItem.value != null)
            //   Positioned(
            //     bottom: 5,
            //     right: 15,
            //     left: 15,
            //     child: Row(
            //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Expanded(
            //           child: TextButton(
            //             onPressed: () async {
            //               klog('Cancel prassed>>>>>>>>');
            //               Base.homePageController.editSiteInfoItem.value = null;

            //               if (Base.homePageController.selectedDistrict.value !=
            //                   '') {
            //                 await Base.homePageController.getSiteInfo(
            //                   district:
            //                       Base.homePageController.selectedDistrict.value,
            //                   upozilla: Base.homePageController.selectedUpozila
            //                               .value !=
            //                           ''
            //                       ? Base.homePageController.selectedUpozila.value
            //                       : null,
            //                   union: Base.homePageController.selectedUnion
            //                               .value !=
            //                           ''
            //                       ? Base.homePageController.selectedUnion.value
            //                       : null,
            //                 );
            //               }
            //             },
            //             style: TextButton.styleFrom(
            //                 // backgroundColor: AppTheme.appThemeColor2,
            //                 backgroundColor: Colors.red,

            //                 // Base.authController.isUsernameAndPassValid()
            //                 //     ? Base.authController.textFieldBgColor
            //                 //     : Colors.grey.withOpacity(.4),
            //                 // backgroundColor: Base.authController.textFieldBgColor,

            //                 // padding: const EdgeInsets.symmetric(
            //                 //   vertical: 10.0,
            //                 //   horizontal: 50,
            //                 // ),
            //                 shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(12.0))),
            //             child: KText(
            //               text: 'Cancel',
            //               fontSize: 18,
            //               bold: true,
            //               color: AppTheme.white,
            //             ),
            //           ),
            //         ),
            //         // SizedBox(width: 20),
            //         // Expanded(
            //         //   child: TextButton(
            //         //     onPressed: () async {
            //         //       klog('Update prassed>>>>>>>>');

            //         //       await Base.homePageController.updateSiteInfo(
            //         //           Base.homePageController.editSiteInfoItem.value!);
            //         //     },
            //         //     style: TextButton.styleFrom(
            //         //         // backgroundColor: AppTheme.appThemeColor2,
            //         //         backgroundColor: Colors.green,

            //         //         // Base.authController.isUsernameAndPassValid()
            //         //         //     ? Base.authController.textFieldBgColor
            //         //         //     : Colors.grey.withOpacity(.4),
            //         //         // backgroundColor: Base.authController.textFieldBgColor,

            //         //         // padding: const EdgeInsets.symmetric(
            //         //         //   vertical: 10.0,
            //         //         //   horizontal: 50,
            //         //         // ),
            //         //         shape: RoundedRectangleBorder(
            //         //             borderRadius: BorderRadius.circular(12.0))),
            //         //     child:
            //         //         Base.homePageController.isSiteInfoUpdateLoading.value
            //         //             ? CircularProgressIndicator()
            //         //             : KText(
            //         //                 text: 'Update',
            //         //                 fontSize: 18,
            //         //                 bold: true,
            //         //                 color: AppTheme.white,
            //         //               ),
            //         //   ),
            //         // ),
            //       ],
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
