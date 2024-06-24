import 'package:json_annotation/json_annotation.dart';
part 'dropdown_model.g.dart';

@JsonSerializable()
class DropdownModel {
  int? id;
  String? name;
  String? code;
  DropdownModel({this.id, this.name, this.code});

  factory DropdownModel.fromJson(Map<String, dynamic> json) =>
      _$DropdownModelFromJson(json);
  Map<String, dynamic> toJson() => _$DropdownModelToJson(this);
}
