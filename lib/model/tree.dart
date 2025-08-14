import 'package:json_annotation/json_annotation.dart';

part 'tree.g.dart';
@JsonSerializable()
class Tree {
    String? status;
    int? treeId;
    String? filename;
    String? species;
    String? disease;
    String? imageUrl;
    String? message;

    Tree({
        this.status,
        @JsonKey(name: 'tree_id')
        this.treeId,
        @JsonKey(name: 'file_name')
        this.filename,
        this.species,
        this.disease,
        @JsonKey(name: 'image_url')
        this.imageUrl,
        this.message,
    });
      factory Tree.fromJson(Map<String, dynamic> json) =>
      _$TreeFromJson(json);

  Map<String, dynamic> toJson() => _$TreeToJson(this);
}
