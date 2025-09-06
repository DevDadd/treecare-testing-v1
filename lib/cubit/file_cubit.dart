import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/web.dart';
import 'package:testtree/cubit/file_state.dart';
import 'package:image_cropper/image_cropper.dart';

class FileCubit extends Cubit<FileState> {
  final ImagePicker imagePicker = ImagePicker();
  FileCubit() : super(FileState());
  final Logger logger = Logger();

  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'jpg',
          'jpeg',
          'png',
          'gif',
          'bmp',
          'tiff',
          'tif',
          'webp',
          'heif',
          'heic',
          'svg',
        ],
        allowMultiple: false,
      );
      if (result != null && result.files.isNotEmpty) {
        final filePath = result.files.first.path;
        if (filePath != null) {
          final CroppedFile? croppedFile = await ImageCropper().cropImage(
            sourcePath: filePath,
            aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
            uiSettings: [
              AndroidUiSettings(
                toolbarTitle: 'Image Cropper',
                toolbarColor: Colors.green,
                toolbarWidgetColor: Colors.white,
              ),
              IOSUiSettings(title: 'Image Cropper'),
            ],
          );
          if (croppedFile != null) {
            final file = File(croppedFile.path);
            final platformFile = PlatformFile(
              name: croppedFile.path.split('/').last,
              path: croppedFile.path,
              size: await file.length(),
            );
            emit(state.copyWith(file: platformFile, isUploaded: false));
          }
        }
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> takePicture() async {
    final XFile? pickedFile = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      final CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Image Cropper',
            toolbarColor: Colors.green,
            toolbarWidgetColor: Colors.white,
          ),
          IOSUiSettings(title: "Image Cropper"),
        ],
      );

      if (croppedFile != null) {
        final file = File(croppedFile.path);
        final platformFile = PlatformFile(
          name: croppedFile.path.split('/').last,
          path: croppedFile.path,
          size: await file.length(),
        );
        emit(state.copyWith(file: platformFile, isUploaded: false));
      }
    }
  }
}
