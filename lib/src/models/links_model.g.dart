// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinksModel _$LinksModelFromJson(Map<String, dynamic> json) => LinksModel(
      id: json['id'] as String?,
      linkCode: json['linkCode'] as String?,
      linkName: json['linkName'] as String?,
      linkType: json['linkType'] as String?,
      mediaType: json['mediaType'] as String?,
      linkPoints: (json['linkPoints'] as List<dynamic>?)
          ?.map((e) => LinkPointsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LinksModelToJson(LinksModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'linkCode': instance.linkCode,
      'linkName': instance.linkName,
      'linkType': instance.linkType,
      'mediaType': instance.mediaType,
      'linkPoints': instance.linkPoints,
    };
