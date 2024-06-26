import 'package:json_annotation/json_annotation.dart';

part 'link_points_model.g.dart';

@JsonSerializable()
class LinkPointsModel {
  String? id;
  String? linkId;
  String? linkCode;
  String? linkName;
  String? linkType;
  double? latitude;
  double? longitude;

  LinkPointsModel({
    this.id,
    this.linkId,
    this.linkCode,
    this.linkName,
    this.linkType,
    this.latitude,
    this.longitude,
  });

  factory LinkPointsModel.fromJson(Map<String, dynamic> json) =>
      _$LinkPointsModelFromJson(json);
  Map<String, dynamic> toJson() => _$LinkPointsModelToJson(this);
}
