// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_points_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkPointsModel _$LinkPointsModelFromJson(Map<String, dynamic> json) =>
    LinkPointsModel(
      id: json['id'] as String?,
      linkId: json['linkId'] as String?,
      linkCode: json['linkCode'] as String?,
      linkName: json['linkName'] as String?,
      linkType: json['linkType'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LinkPointsModelToJson(LinkPointsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'linkId': instance.linkId,
      'linkCode': instance.linkCode,
      'linkName': instance.linkName,
      'linkType': instance.linkType,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
