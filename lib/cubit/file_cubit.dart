import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:logger/web.dart';
import 'package:testtree/cubit/file_state.dart';

class FileCubit extends Cubit<FileState> {
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
        emit(state.copyWith(file: result.files.first, isUploaded: false));
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
