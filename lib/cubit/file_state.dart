import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'file_state.g.dart';

@CopyWith()
@JsonSerializable()
class FileState extends Equatable {
  const FileState({
    this.file,
    this.isUploaded = false,
    this.captureImage,
    this.uploadFile,
  });
  final PlatformFile? file;
  final bool isUploaded;
  final XFile? captureImage;
  final XFile? uploadFile;
  @override
  List<Object?> get props => [file, isUploaded, captureImage, uploadFile];
}
