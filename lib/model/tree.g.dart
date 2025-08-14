// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tree _$TreeFromJson(Map<String, dynamic> json) => Tree(
  status: json['status'] as String?,
  treeId: (json['treeId'] as num?)?.toInt(),
  filename: json['filename'] as String?,
  species: json['species'] as String?,
  disease: json['disease'] as String?,
  imageUrl: json['imageUrl'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$TreeToJson(Tree instance) => <String, dynamic>{
  'status': instance.status,
  'treeId': instance.treeId,
  'filename': instance.filename,
  'species': instance.species,
  'disease': instance.disease,
  'imageUrl': instance.imageUrl,
  'message': instance.message,
};
