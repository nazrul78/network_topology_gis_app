import 'package:json_annotation/json_annotation.dart';
import 'package:network_topology_gis/src/models/link_points_model.dart';
part 'links_model.g.dart';

@JsonSerializable()
class LinksModel {
  String? id;
  String? linkCode;
  String? linkName;
  String? linkType;
  String? mediaType;
  List<LinkPointsModel>? linkPoints;

  LinksModel({
    this.id,
    this.linkCode,
    this.linkName,
    this.linkType,
    this.mediaType,
    this.linkPoints,
  });

  factory LinksModel.fromJson(Map<String, dynamic> json) =>
      _$LinksModelFromJson(json);
  Map<String, dynamic> toJson() => _$LinksModelToJson(this);
}
