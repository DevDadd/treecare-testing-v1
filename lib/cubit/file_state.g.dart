// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FileStateCWProxy {
  FileState file(PlatformFile? file);

  FileState isUploaded(bool isUploaded);

  FileState captureImage(XFile? captureImage);

  FileState uploadFile(XFile? uploadFile);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FileState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FileState(...).copyWith(id: 12, name: "My name")
  /// ```
  FileState call({
    PlatformFile? file,
    bool isUploaded,
    XFile? captureImage,
    XFile? uploadFile,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFileState.copyWith(...)` or call `instanceOfFileState.copyWith.fieldName(value)` for a single field.
class _$FileStateCWProxyImpl implements _$FileStateCWProxy {
  const _$FileStateCWProxyImpl(this._value);

  final FileState _value;

  @override
  FileState file(PlatformFile? file) => call(file: file);

  @override
  FileState isUploaded(bool isUploaded) => call(isUploaded: isUploaded);

  @override
  FileState captureImage(XFile? captureImage) =>
      call(captureImage: captureImage);

  @override
  FileState uploadFile(XFile? uploadFile) => call(uploadFile: uploadFile);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FileState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FileState(...).copyWith(id: 12, name: "My name")
  /// ```
  FileState call({
    Object? file = const $CopyWithPlaceholder(),
    Object? isUploaded = const $CopyWithPlaceholder(),
    Object? captureImage = const $CopyWithPlaceholder(),
    Object? uploadFile = const $CopyWithPlaceholder(),
  }) {
    return FileState(
      file: file == const $CopyWithPlaceholder()
          ? _value.file
          // ignore: cast_nullable_to_non_nullable
          : file as PlatformFile?,
      isUploaded:
          isUploaded == const $CopyWithPlaceholder() || isUploaded == null
          ? _value.isUploaded
          // ignore: cast_nullable_to_non_nullable
          : isUploaded as bool,
      captureImage: captureImage == const $CopyWithPlaceholder()
          ? _value.captureImage
          // ignore: cast_nullable_to_non_nullable
          : captureImage as XFile?,
      uploadFile: uploadFile == const $CopyWithPlaceholder()
          ? _value.uploadFile
          // ignore: cast_nullable_to_non_nullable
          : uploadFile as XFile?,
    );
  }
}

extension $FileStateCopyWith on FileState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFileState.copyWith(...)` or `instanceOfFileState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FileStateCWProxy get copyWith => _$FileStateCWProxyImpl(this);
}
