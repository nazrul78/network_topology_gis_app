// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appliances_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplianceModel _$ApplianceModelFromJson(Map<String, dynamic> json) =>
    ApplianceModel(
      id: json['id'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      priority: (json['priority'] as num?)?.toInt(),
      priorityName: json['priorityName'] as String?,
      potentialCustomers: (json['potentialCustomers'] as num?)?.toInt(),
      poleType: json['poleType'] as String?,
      pointType: json['pointType'] as String?,
      placeType: json['placeType'] as String?,
      powerSource: json['powerSource'] as String?,
      custodianName: json['custodianName'] as String?,
      custodianMobile: json['custodianMobile'] as String?,
      custodianAddress: json['custodianAddress'] as String?,
    );

Map<String, dynamic> _$ApplianceModelToJson(ApplianceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'priority': instance.priority,
      'priorityName': instance.priorityName,
      'potentialCustomers': instance.potentialCustomers,
      'poleType': instance.poleType,
      'pointType': instance.pointType,
      'placeType': instance.placeType,
      'powerSource': instance.powerSource,
      'custodianName': instance.custodianName,
      'custodianMobile': instance.custodianMobile,
      'custodianAddress': instance.custodianAddress,
    };
