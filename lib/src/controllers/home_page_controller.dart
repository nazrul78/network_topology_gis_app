import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:network_topology_gis/src/config/api_endpont.dart';
import 'package:network_topology_gis/src/config/env.dart';
import 'package:network_topology_gis/src/helpers/k_log.dart';
import 'package:network_topology_gis/src/models/appliances_model.dart';
import 'package:network_topology_gis/src/models/dropdown_model.dart';
import 'package:network_topology_gis/src/models/link_points_model.dart';
import 'package:network_topology_gis/src/models/links_model.dart';
import 'package:network_topology_gis/src/services/api_service.dart';

class HomePageController extends GetxController {
  final apiService = ApiService();
  final kMapController = MapController();
  //========== Used to show current location on map ==============
  final isCurrentLocationEnable = RxBool(false);

  final centerLatlng = Rx<LatLng?>(null);

  final districts = RxList<DropdownModel>([]);
  final unions = RxList<DropdownModel>([]);

  final selectedDistrict = Rx<DropdownModel?>(null);
  final selectedUnion = Rx<DropdownModel?>(null);

  /// Appliance Data
  final applianceMarkers = RxList<Marker>([]);

  /// Link Points Data
  final linkPointsMarkers = RxList<Marker>([]);

  final isSiteInfoUpdateLoading = RxBool(false);

  List<Marker> populateApplianceMarker(List<ApplianceModel> infoList) {
    List<Marker> markers = [];

    for (var item in infoList) {
      klog('Point Type: ${item.pointType}' + '@@@@@@@@@@@@@@@@@@@');
      markers.add(
        Marker(
          key: Key(item.id!),
          point: LatLng(item.latitude!, item.longitude!),
          width: 60,
          height: 60,
          child: GestureDetector(
            onTap: () {
              klog('Appliance Id: ${item.id}');

              // DialogHelper.showActionTypeSelectionDialog(
              //   title: 'Select an action type',
              //   buttonText1: 'Site details',
              //   buttonText2: 'Drag',
              //   buttonText3: 'Pole construction',
              //   buttonText4: 'Civil Works',
              //   buttonText5: 'Electricity',
              //   buttonText6: 'Solar',
              //   onPressed1: () {
              //     Get.back();

              //     DialogHelper.showSurveyorEditDialog(item);
              //   },
              //   onPressed2: () {
              //     Get.back();
              //     Base.homePageController.editSiteInfo(item.id!);
              //   },
              //   onPressed3: () {
              //     Get.back();
              //     DialogHelper.poleConstructionAndSupplyFixingDialog(item);
              //   },
              //   onPressed4: () {
              //     Get.back();
              //     DialogHelper.civilWorksDialog(item);
              //   },
              //   onPressed5: () {
              //     Get.back();
              //     DialogHelper.electricityDialog(item);
              //   },
              //   onPressed6: () {
              //     Get.back();
              //     DialogHelper.solarDialog(item);
              //   },
              // );
            },
            child: Icon(Icons.location_pin,
                size: 60,
                color: item.pointType == "Wifi Router"
                    ? Colors.green
                    : Colors.redAccent),
          ),
        ),
      );
    }

    return markers;
  }

  List<Marker> populateLinkPointsMarker(List<LinkPointsModel> infoList) {
    List<Marker> markers = [];

    for (var item in infoList) {
      // klog('Point Type: ${item.pointType}' + '@@@@@@@@@@@@@@@@@@@');
      markers.add(
        Marker(
          key: Key(item.id!),
          point: LatLng(item.latitude!, item.longitude!),
          width: 60,
          height: 60,
          child: GestureDetector(
            onTap: () {
              klog('Appliance Id: ${item.id}');

              // DialogHelper.showActionTypeSelectionDialog(
              //   title: 'Select an action type',
              //   buttonText1: 'Site details',
              //   buttonText2: 'Drag',
              //   buttonText3: 'Pole construction',
              //   buttonText4: 'Civil Works',
              //   buttonText5: 'Electricity',
              //   buttonText6: 'Solar',
              //   onPressed1: () {
              //     Get.back();

              //     DialogHelper.showSurveyorEditDialog(item);
              //   },
              //   onPressed2: () {
              //     Get.back();
              //     Base.homePageController.editSiteInfo(item.id!);
              //   },
              //   onPressed3: () {
              //     Get.back();
              //     DialogHelper.poleConstructionAndSupplyFixingDialog(item);
              //   },
              //   onPressed4: () {
              //     Get.back();
              //     DialogHelper.civilWorksDialog(item);
              //   },
              //   onPressed5: () {
              //     Get.back();
              //     DialogHelper.electricityDialog(item);
              //   },
              //   onPressed6: () {
              //     Get.back();
              //     DialogHelper.solarDialog(item);
              //   },
              // );
            },
            child: Icon(
              Icons.circle,
              size: 15,
              color: Colors.amber,
              // color: item.pointType == "Wifi Router"
              //     ? Colors.green
              //     : Colors.redAccent,
            ),
          ),
        ),
      );
    }

    return markers;
  }

  // DropdownModel findItemById(List<DropdownModel> items, String id) {
  //   final item = items.singleWhere((element) => id == element.id);
  //   return item;
  // }

  // SiteInfoModel findSiteInfoItemById(List<SiteInfoModel> items, String id) {
  //   final item = items.singleWhere((element) => id == element.id);
  //   return item;
  // }

  /// Edit site info
  // void editSiteInfo(String id) {
  //   final item = findSiteInfoItemById(siteInfoList, id);
  //   editSiteInfoItem.value = item;

  //   ///==========>> Remove item <<=============
  //   siteInfoList.remove(item);

  //   ///==========>> Remove marker <<===========
  //   siteInfoMarkers.removeWhere(
  //       (element) => id == (element.key as ValueKey<String>).value);
  // }

  // void clearAllSelectedId() {
  //   selectedDistrictId.value = '';
  //   selectedUpozila.value = '';
  //   selectedUnion.value = '';
  // }

  void clearAllSelectedItem() {
    selectedDistrict.value = null;
    districts.clear();

    selectedUnion.value = null;
    unions.clear();
  }

  Future<void> getDistrict({String? district, String? upozilla}) async {
    final response = await apiService.get(
      baseUrl: ENV.baseUrl,
      path: ApiEndpoint.getDistrict,
      // queryParameters: {
      //   'district': district,
      //   'upozilla': upozilla,
      // }
    );

    var rawData = response!.data;
    klog('rawData: $rawData');

    final statusCode = response.statusCode;
    klog('statusCode: $statusCode');

    if (rawData != null && statusCode == 200) {
      ///=============>> District list <<=================

      final districData = rawData as List;

      if (districData.isNotEmpty) {
        final listOfDistricts = districData
            .map((value) =>
                DropdownModel.fromJson(value as Map<String, dynamic>))
            .toList();

        klog('${listOfDistricts[0].name}');

        klog(districts.length);

        districts.addAll(listOfDistricts);
      }

      // final districtList = rawData['district'].cast<String>();

      // districts.value = districtList;

      // klog('districts: ${districts[0]}');

      ///=============>> Upozilla list <<=================
      // if (rawData['upozilla'] != null && district != null && upozilla == null) {
      //   final upozillaList = rawData['upozilla'].cast<String>();

      //   upozilas.value = upozillaList;

      //   klog('upozilas: ${upozillaList[0]}');
      // }

      ///=============>> union list <<=================
      // if (rawData['siteUnion'] != null &&
      //     district != null &&
      //     upozilla != null) {
      //   final siteUnionList = rawData['siteUnion'].cast<String>();

      //   unions.value = siteUnionList;

      //   klog('unions: ${siteUnionList[0]}');
      // }
    }
  }

  Future<void> getUnions({required int districtId}) async {
    final response = await apiService.get(
      baseUrl: ENV.baseUrl,
      path: '${ApiEndpoint.getUnion}/$districtId/unions',
      // queryParameters: {
      //   'district': district,
      //   'upozilla': upozilla,
      // }
    );

    var rawData = response!.data;
    klog('rawData: $rawData');

    final statusCode = response.statusCode;
    klog('statusCode: $statusCode');

    if (rawData != null && statusCode == 200) {
      ///=============>> District list <<=================

      final unionData = rawData as List;

      if (unionData.isNotEmpty) {
        final listOfUnions = unionData
            .map((value) =>
                DropdownModel.fromJson(value as Map<String, dynamic>))
            .toList();

        klog('${listOfUnions[0].name}');

        klog(unions.length);

        unions.addAll(listOfUnions);
      }
    }
  }

  Future<void> getNetworkData({required String areaLevelFullCode}) async {
    applianceMarkers.clear();
    linkPointsMarkers.clear();
    final response = await apiService.post(
      baseUrl: ENV.baseUrl,
      path: ApiEndpoint.getNetwork,
      body: {
        'areaLevelFullCode': areaLevelFullCode,
      },
    );

    var rawData = response.data;
    //  klog('rawData: $rawData');

    final statusCode = response.statusCode;
    klog('statusCode: $statusCode');

    if (rawData != null && statusCode == 200) {
      ///=============>> Appliances list <<=================

      final appliances = rawData['appliances'] as List;

      // klog('appliances: $appliances');

      if (appliances.isNotEmpty) {
        final listOfAppliance = appliances
            .map((value) =>
                ApplianceModel.fromJson(value as Map<String, dynamic>))
            .toList();

        klog('${listOfAppliance[0].poleType}');

        klog(listOfAppliance.length);

        if (listOfAppliance.length > 1) {
          final bounds =
              LatLngBounds.fromPoints(getPoints(infoList: listOfAppliance));
          kMapController.fitCamera(
            CameraFit.bounds(
              bounds: bounds,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            ),
          );
        } else {
          kMapController.move(
            LatLng(listOfAppliance[0].latitude!, listOfAppliance[0].longitude!),
            15,
          );
        }

        final applianceMarkerList = populateApplianceMarker(listOfAppliance);
        applianceMarkers.addAll(applianceMarkerList);
        klog('Markers length: ${applianceMarkers.length}');
      }

      ///=============>> Appliances list <<=================

      final links = rawData['links'] as List;

      if (links.isNotEmpty) {
        final listOfLinks = links
            .map((value) => LinksModel.fromJson(value as Map<String, dynamic>))
            .toList();

        klog('Links count${listOfLinks.length}');

        // klog(listOfAppliance.length);

        final List<LinkPointsModel> listOfLinkPoints = [];

        for (var element in listOfLinks) {
          listOfLinkPoints
              .addAll(element.linkPoints as Iterable<LinkPointsModel>);
        }

        klog('Linkpoints count${listOfLinkPoints.length}');

        // if (listOfAppliance.length > 1) {
        //   final bounds =
        //       LatLngBounds.fromPoints(getPoints(infoList: listOfAppliance));
        //   kMapController.fitCamera(
        //     CameraFit.bounds(
        //       bounds: bounds,
        //       padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        //     ),
        //   );
        // } else {
        //   kMapController.move(
        //     LatLng(listOfAppliance[0].latitude!, listOfAppliance[0].longitude!),
        //     15,
        //   );
        // }

        final linkPointsMarkerList = populateLinkPointsMarker(listOfLinkPoints);
        linkPointsMarkers.addAll(linkPointsMarkerList);
        klog('Link Points Markers length: ${linkPointsMarkerList.length}');
      }

      klog('links: $links');
    }
  }

  // Future<void> getAreas({String? district, String? upozilla}) async {
  //   final response = await apiService.get(
  //       baseUrl: ENV.baseUrl,
  //       path: ApiEndpoint.getAreas,
  //       queryParameters: {
  //         'district': district,
  //         'upozilla': upozilla,
  //       });

  //   var rawData = response!.data['data'];

  //   final statusCode = response.data['status'] as int;
  //   klog('status: $statusCode');

  //   if (rawData != null && statusCode == 200) {
  //     ///=============>> District list <<=================
  //     if (rawData['district'] != null && district == null && upozilla == null) {
  //       final districtList = rawData['district'].cast<String>();

  //       districts.value = districtList;

  //       klog('districts: ${districts[0]}');
  //     }

  //     ///=============>> Upozilla list <<=================
  //     if (rawData['upozilla'] != null && district != null && upozilla == null) {
  //       final upozillaList = rawData['upozilla'].cast<String>();

  //       upozilas.value = upozillaList;

  //       klog('upozilas: ${upozillaList[0]}');
  //     }

  //     ///=============>> union list <<=================
  //     if (rawData['siteUnion'] != null &&
  //         district != null &&
  //         upozilla != null) {
  //       final siteUnionList = rawData['siteUnion'].cast<String>();

  //       unions.value = siteUnionList;

  //       klog('unions: ${siteUnionList[0]}');
  //     }
  //   }
  // }

  /// To get the points from info list
  List<LatLng> getPoints({required List<ApplianceModel> infoList}) {
    List<LatLng> points = [];

    for (var item in infoList) {
      points.add(LatLng(item.latitude!, item.longitude!));
    }

    return points;
  }

  // Future<void> getSiteInfo(
  //     {String? district, String? upozilla, String? union}) async {
  //   siteInfoMarkers.clear();
  //   siteInfoList.clear();

  //   final response = await apiService.get(
  //       baseUrl: ENV.baseUrl,
  //       path: ApiEndpoint.getSiteInfo,
  //       queryParameters: {
  //         'district': district,
  //         'upozilla': upozilla,
  //         'union': union,
  //       });

  //   var rawData = response!.data['data'];

  //   final statusCode = response.data['status'] as int;

  //   if (rawData != null && statusCode == 200) {
  //     final List<SiteInfoModel> siteInfoData = rawData
  //         .map((value) => SiteInfoModel.fromJson(value as Map<String, dynamic>))
  //         .toList()
  //         .cast<SiteInfoModel>();

  //     if (siteInfoData.isNotEmpty) {
  //       siteInfoList.value = siteInfoData;
  //       final markers = populateSiteInfoMarker(siteInfoData);
  //       siteInfoMarkers.addAll(markers);

  //       if (siteInfoData.length > 1) {
  //         final bounds =
  //             LatLngBounds.fromPoints(getPoints(infoList: siteInfoData));
  //         kMapController.fitCamera(
  //           CameraFit.bounds(
  //             bounds: bounds,
  //             padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
  //           ),
  //         );
  //       } else {
  //         kMapController.move(
  //           LatLng(siteInfoData[0].latitude!, siteInfoData[0].longitude!),
  //           15,
  //         );
  //       }
  //     }
  //   }
  // }

  /// To populate Surveyor Data To Update
  // SiteInfoModel populateSurveyorDataToUpdate(SiteInfoModel siteInfo) {
  //   final siteInfoModel = SiteInfoModel(
  //     id: siteInfo.id,
  //     district: siteInfo.district,
  //     upozilla: siteInfo.upozilla,
  //     siteUnion: siteInfo.siteUnion,
  //     siteId: siteInfo.siteId,
  //     latitude: siteInfo.latitude,
  //     longitude: siteInfo.longitude,
  //     zoneCamp: zoneCamp.value,
  //     distanceFromZoneCamp: distanceFromZoneCamp.value,
  //     remote: remote.value == 'yes' ? true : false,
  //     syThreat: syThreat.value == 'yes' ? true : false,
  //     syReqr: syReqr.value == 'yes' ? true : false,
  //     exceptionalTptReqr: exceptionalTptReqr.value,
  //     anyOthersRemarks: anyOthersRemarks.value,
  //     landOwnerName: landOwnerName.value,
  //     landOwnerAddress: landOwnerAddress.value,
  //     landOwnerNid: landOwnerNid.value,
  //     landOwnerMobile: landOwnerMobile.value,

  //     ///===========>> Pole constraction <<===========
  //     constrSampleCollection:
  //         constrSampleCollection.value == 'yes' ? true : false,
  //     constrSampleCollectionDate: constrSampleCollectionDate.value,
  //     constrReportOnSoilTest: constrReportOnSoilTest.value,
  //     constrColumnDepth: constrColumnDepth.value,

  //     ///===========>> Civil works <<===========
  //     civilMobilization: civilMobilization.value == 'yes' ? true : false,
  //     civilDate: civilDate.value,
  //     civilWorkStarted: civilWorkStarted.value == 'yes' ? true : false,
  //     civilWorkStartDate: civilWorkStartDate.value,
  //     civilWorkProgress: civilWorkProgress.value,
  //     civilIndoorWorkProgress: civilIndoorWorkProgress.value,
  //     civilWorkCompletionDate: civilWorkCompletionDate.value,
  //     civilHandoverDate: civilHandoverDate.value,
  //     civilToHomeName: civilToHomeName.value,
  //     civilToHomeMobile: civilToHomeMobile.value,

  //     ///===========>> Electricity & Earthing <<===========
  //     /// Electricity
  //     elecElectricityAvailable:
  //         elecElectricityAvailable.value == 'yes' ? true : false,
  //     elecDistanceOfNearestElecPole: elecDistanceOfNearestElecPole.value,
  //     elecTransformerRequired:
  //         elecTransformerRequired.value == 'yes' ? true : false,
  //     elecElectricConnectionComplete:
  //         elecElectricConnectionComplete.value == 'yes' ? true : false,
  //     elecElectricConnectionCompletionDate:
  //         elecElectricConnectionCompletionDate.value,

  //     /// Earthing
  //     earthingBoringType:
  //         earthingBoringType.value.isNotEmpty ? earthingBoringType.value : null,
  //     earthingMeter: earthingMeter.value,
  //     earthingResistance: earthingResistance.value,
  //     earthingResistanceDuringPat: earthingResistanceDuringPat.value,

  //     ///===========>> Solar <<===========
  //     solarBasementComplete:
  //         solarBasementComplete.value == 'yes' ? true : false,

  //     solarPanelFrameComplete:
  //         solarPanelFrameComplete.value == 'yes' ? true : false,

  //     solarPanelInstallationComplete:
  //         solarPanelInstallationComplete.value == 'yes' ? true : false,

  //     solarChargeControllerConnected:
  //         solarChargeControllerConnected.value == 'yes' ? true : false,

  //     solarOutputVoltage: solarOutputVoltage.value,
  //   );
  //   return siteInfoModel;
  // }

  // void clearSurveyorData() {
  //   zoneCamp.value = '';
  //   distanceFromZoneCamp.value = '';
  //   exceptionalTptReqr.value = '';
  //   anyOthersRemarks.value = '';

  //   landOwnerName.value = '';
  //   landOwnerAddress.value = '';
  //   landOwnerNid.value = '';
  //   landOwnerMobile.value = '';

  //   ///===========>> Pole constraction <<===========

  //   constrSampleCollection.value == 'no';
  //   constrSampleCollectionDate.value = '';
  //   constrReportOnSoilTest.value = '';
  //   constrColumnDepth.value = '';

  //   ///===========>> Civil works <<===========
  //   civilMobilization.value = 'no';
  //   civilDate.value = '';
  //   civilWorkStarted.value = 'no';
  //   civilWorkStartDate.value = '';
  //   civilWorkProgress.value = 0;
  //   civilIndoorWorkProgress.value = 0;
  //   civilWorkCompletionDate.value = '';
  //   civilHandoverDate.value = '';
  //   civilToHomeName.value = '';
  //   civilToHomeMobile.value = '';

  //   /// Dropdown
  //   selectedCivilWorkProgress.value = '';
  //   selectedCivilIndoorWorkProgress.value = '';

  //   ///===========>> Electricity & Earthing <<===========
  //   /// Electricity
  //   elecElectricityAvailable.value = 'no';
  //   elecDistanceOfNearestElecPole.value = '';
  //   elecTransformerRequired.value = 'no';
  //   elecElectricConnectionComplete.value = 'no';
  //   elecElectricConnectionCompletionDate.value = '';

  //   /// Earthing
  //   earthingBoringType.value = '';
  //   earthingMeter.value = '';
  //   earthingResistance.value = '';
  //   earthingResistanceDuringPat.value = '';

  //   /// Dropdown
  //   selectedEarthingBoringType.value = '';

  //   ///===========>> Solar <<===========
  //   solarBasementComplete.value = 'no';

  //   solarPanelFrameComplete.value = 'no';

  //   solarPanelInstallationComplete.value = 'no';

  //   solarChargeControllerConnected.value = 'no';

  //   solarOutputVoltage.value = '';
  // }

  // /// To load site info in modal
  // void loadSiteInfoInModal(SiteInfoModel siteInfo) {
  //   remote.value = siteInfo.remote! ? 'yes' : 'no';
  //   syThreat.value = siteInfo.syThreat! ? 'yes' : 'no';
  //   syReqr.value = siteInfo.syReqr! ? 'yes' : 'no';

  //   zoneCamp.value = siteInfo.zoneCamp ?? '';
  //   distanceFromZoneCamp.value = siteInfo.distanceFromZoneCamp ?? '';
  //   exceptionalTptReqr.value = siteInfo.exceptionalTptReqr ?? '';
  //   anyOthersRemarks.value = siteInfo.anyOthersRemarks ?? '';

  //   landOwnerName.value = siteInfo.landOwnerName ?? '';
  //   landOwnerAddress.value = siteInfo.landOwnerAddress ?? '';
  //   landOwnerNid.value = siteInfo.landOwnerNid ?? '';
  //   landOwnerMobile.value = siteInfo.landOwnerMobile ?? '';

  //   ///===========>> Pole constraction <<===========
  //   constrSampleCollection.value =
  //       siteInfo.constrSampleCollection! ? 'yes' : 'no';

  //   constrSampleCollectionDate.value =
  //       siteInfo.constrSampleCollectionDate ?? '';
  //   constrReportOnSoilTest.value = siteInfo.constrReportOnSoilTest ?? '';
  //   constrColumnDepth.value = siteInfo.constrColumnDepth ?? '';

  //   ///===========>> Civil works <<===========
  //   civilMobilization.value = siteInfo.civilMobilization! ? 'yes' : 'no';
  //   civilDate.value = siteInfo.civilDate ?? '';
  //   civilWorkStarted.value = siteInfo.civilWorkStarted! ? 'yes' : 'no';
  //   civilWorkStartDate.value = siteInfo.civilWorkStartDate ?? '';
  //   civilWorkProgress.value = siteInfo.civilWorkProgress ?? 0;
  //   civilIndoorWorkProgress.value = siteInfo.civilIndoorWorkProgress ?? 0;
  //   civilWorkCompletionDate.value = siteInfo.civilWorkCompletionDate ?? '';
  //   civilHandoverDate.value = siteInfo.civilHandoverDate ?? '';
  //   civilToHomeName.value = siteInfo.civilToHomeName ?? '';
  //   civilToHomeMobile.value = siteInfo.civilToHomeMobile ?? '';

  //   ///===========>> Electricity & Earthing <<===========
  //   /// Electricity
  //   elecElectricityAvailable.value =
  //       siteInfo.elecElectricityAvailable! ? 'yes' : 'no';
  //   elecDistanceOfNearestElecPole.value =
  //       siteInfo.elecDistanceOfNearestElecPole ?? '';
  //   elecTransformerRequired.value =
  //       siteInfo.elecTransformerRequired! ? 'yes' : 'no';
  //   elecElectricConnectionComplete.value =
  //       siteInfo.elecElectricConnectionComplete! ? 'yes' : 'no';
  //   elecElectricConnectionCompletionDate.value =
  //       siteInfo.elecElectricConnectionCompletionDate ?? '';

  //   /// Earthing
  //   earthingBoringType.value = siteInfo.earthingBoringType ?? '';
  //   earthingMeter.value = siteInfo.earthingMeter ?? '';
  //   earthingResistance.value = siteInfo.earthingResistance ?? '';
  //   earthingResistanceDuringPat.value =
  //       siteInfo.earthingResistanceDuringPat ?? '';

  //   /// Dropdown
  //   selectedEarthingBoringType.value = siteInfo.earthingBoringType ?? '';

  //   ///===========>> Solar <<===========
  //   solarBasementComplete.value =
  //       siteInfo.solarBasementComplete! ? 'yes' : 'no';

  //   solarPanelFrameComplete.value =
  //       siteInfo.solarPanelFrameComplete! ? 'yes' : 'no';

  //   solarPanelInstallationComplete.value =
  //       siteInfo.solarPanelInstallationComplete! ? 'yes' : 'no';

  //   solarChargeControllerConnected.value =
  //       siteInfo.solarChargeControllerConnected! ? 'yes' : 'no';

  //   solarOutputVoltage.value = siteInfo.solarOutputVoltage ?? '';
  // }

  // Future<void> updateSiteInfo(SiteInfoModel siteInfo) async {
  //   isSiteInfoUpdateLoading.value = true;
  //   try {
  //     final response = await apiService.put(
  //       baseUrl: ENV.baseUrl,
  //       path: '${ApiEndpoint.updateSiteInfo}/${siteInfo.id}',
  //       body: {
  //         "district": siteInfo.district,
  //         "upozilla": siteInfo.upozilla,
  //         "siteUnion": siteInfo.siteUnion,
  //         "latitude": siteInfo.latitude,
  //         "longitude": siteInfo.longitude,
  //         "zoneCamp": siteInfo.zoneCamp,
  //         "distanceFromZoneCamp": siteInfo.distanceFromZoneCamp,
  //         "remote": siteInfo.remote,
  //         "syThreat": siteInfo.syThreat,
  //         "syReqr": siteInfo.syReqr,
  //         "exceptionalTptReqr": siteInfo.exceptionalTptReqr,
  //         "anyOthersRemarks": siteInfo.anyOthersRemarks,
  //         'landOwnerName': siteInfo.landOwnerName,
  //         'landOwnerAddress': siteInfo.landOwnerAddress,
  //         'landOwnerNid': siteInfo.landOwnerNid,
  //         'landOwnerMobile': siteInfo.landOwnerMobile,

  //         ///===========>> Pole constraction <<===========
  //         'constrSampleCollection': siteInfo.constrSampleCollection,
  //         'constrSampleCollectionDate': siteInfo.constrSampleCollectionDate,
  //         'constrReportOnSoilTest': siteInfo.constrReportOnSoilTest,
  //         'constrColumnDepth': siteInfo.constrColumnDepth,

  //         ///===========>> Civil works <<===========

  //         'civilMobilization': siteInfo.civilMobilization,
  //         'civilDate': siteInfo.civilDate,
  //         'civilWorkStarted': siteInfo.civilWorkStarted,
  //         'civilWorkStartDate': siteInfo.civilWorkStartDate,
  //         'civilWorkProgress': siteInfo.civilWorkProgress,
  //         'civilIndoorWorkProgress': siteInfo.civilIndoorWorkProgress,
  //         'civilWorkCompletionDate': siteInfo.civilWorkCompletionDate,
  //         'civilHandoverDate': siteInfo.civilHandoverDate,
  //         'civilToHomeName': siteInfo.civilToHomeName,
  //         'civilToHomeMobile': siteInfo.civilToHomeMobile,

  //         ///===========>> Electricity & Earthing <<===========
  //         /// Electricity
  //         'elecElectricityAvailable': siteInfo.elecElectricityAvailable,
  //         'elecDistanceOfNearestElecPole':
  //             siteInfo.elecDistanceOfNearestElecPole,
  //         'elecTransformerRequired': siteInfo.elecTransformerRequired,
  //         'elecElectricConnectionComplete':
  //             siteInfo.elecElectricConnectionComplete,
  //         'elecElectricConnectionCompletionDate':
  //             siteInfo.elecElectricConnectionCompletionDate,

  //         /// Earthing
  //         'earthingBoringType': siteInfo.earthingBoringType,
  //         'earthingMeter': siteInfo.earthingMeter,
  //         'earthingResistance': siteInfo.earthingResistance,
  //         'earthingResistanceDuringPat': siteInfo.earthingResistanceDuringPat,

  //         ///===========>> Solar <<===========
  //         'solarBasementComplete': siteInfo.solarBasementComplete,

  //         'solarPanelFrameComplete': siteInfo.solarPanelFrameComplete,

  //         'solarPanelInstallationComplete':
  //             siteInfo.solarPanelInstallationComplete,

  //         'solarChargeControllerConnected':
  //             siteInfo.solarChargeControllerConnected,

  //         'solarOutputVoltage': siteInfo.solarOutputVoltage,
  //       },
  //     );

  //     var rawData = response.data['data'];

  //     klog('rawData: ${response.data}');

  //     final statusCode = response.data['status'] as int;
  //     klog('status: $statusCode');

  //     final message = response.data['message'] as String;
  //     klog('message: $message');

  //     if (rawData != null && statusCode == 200) {
  //       editSiteInfoItem.value = null;

  //       /// =====> Reload the site info <<=====
  //       await getSiteInfo(
  //         district: selectedDistrict.value,
  //         upozilla: selectedUpozila.value != '' ? selectedUpozila.value : null,
  //         union: selectedUnion.value != '' ? selectedUnion.value : null,
  //       );
  //     } else {
  //       Get.snackbar(
  //         'Something wrong!!',
  //         'Please try again.',
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.white,
  //       );
  //     }
  //   } catch (e) {
  //     log('Site info not update.', error: e.toString());
  //     Get.snackbar(
  //       'Something wrong!!',
  //       'Please try again.',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.white,
  //     );
  //   } finally {
  //     isSiteInfoUpdateLoading.value = false;
  //   }
  // }
}
