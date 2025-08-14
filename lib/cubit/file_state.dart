import 'dart:io';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file_state.g.dart';

@CopyWith()
@JsonSerializable()
class FileState extends Equatable {
  const FileState({this.file, this.isUploaded = false});
  final PlatformFile? file;
  final bool isUploaded;
  @override
  List<Object?> get props => [file, isUploaded];
}
