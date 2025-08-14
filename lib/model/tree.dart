import 'package:json_annotation/json_annotation.dart';

part 'tree.g.dart';

@JsonSerializable()
class Tree {
  String? status;

  @JsonKey(name: 'tree_id')
  int? treeId;
  String? species;
  String? disease;
  String? result;

  @JsonKey(name: 'image_url')
  String? imageUrl;

  Tree({
    this.status,
    this.treeId,
    this.species,
    this.disease,
    this.result,
    this.imageUrl,
  });

  factory Tree.fromJson(Map<String, dynamic> json) => _$TreeFromJson(json);
  Map<String, dynamic> toJson() => _$TreeToJson(this);
}
