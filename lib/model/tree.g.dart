// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tree _$TreeFromJson(Map<String, dynamic> json) => Tree(
  status: json['status'] as String?,
  treeId: (json['tree_id'] as num?)?.toInt(),
  species: json['species'] as String?,
  disease: json['disease'] as String?,
  result: json['result'] as String?,
  imageUrl: json['image_url'] as String?,
);

Map<String, dynamic> _$TreeToJson(Tree instance) => <String, dynamic>{
  'status': instance.status,
  'tree_id': instance.treeId,
  'species': instance.species,
  'disease': instance.disease,
  'result': instance.result,
  'image_url': instance.imageUrl,
};
