// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dropdown_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DropdownModel _$DropdownModelFromJson(Map<String, dynamic> json) =>
    DropdownModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$DropdownModelToJson(DropdownModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };
