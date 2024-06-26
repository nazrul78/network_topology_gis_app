import 'package:json_annotation/json_annotation.dart';

part 'appliances_model.g.dart';

@JsonSerializable()
class ApplianceModel {
  String? id;
  double? latitude;
  double? longitude;
  int? priority;
  String? priorityName;
  int? potentialCustomers;
  String? poleType;
  String? pointType;
  String? placeType;
  String? powerSource;
  String? custodianName;
  String? custodianMobile;
  String? custodianAddress;

  ApplianceModel(
      {this.id,
      this.latitude,
      this.longitude,
      this.priority,
      this.priorityName,
      this.potentialCustomers,
      this.poleType,
      this.pointType,
      this.placeType,
      this.powerSource,
      this.custodianName,
      this.custodianMobile,
      this.custodianAddress});

  factory ApplianceModel.fromJson(Map<String, dynamic> json) =>
      _$ApplianceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApplianceModelToJson(this);
}
