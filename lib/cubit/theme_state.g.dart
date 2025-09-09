// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ThemeStateCWProxy {
  ThemeState isDarkMode(bool isDarkMode);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ThemeState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ThemeState(...).copyWith(id: 12, name: "My name")
  /// ```
  ThemeState call({bool isDarkMode});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfThemeState.copyWith(...)` or call `instanceOfThemeState.copyWith.fieldName(value)` for a single field.
class _$ThemeStateCWProxyImpl implements _$ThemeStateCWProxy {
  const _$ThemeStateCWProxyImpl(this._value);

  final ThemeState _value;

  @override
  ThemeState isDarkMode(bool isDarkMode) => call(isDarkMode: isDarkMode);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ThemeState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ThemeState(...).copyWith(id: 12, name: "My name")
  /// ```
  ThemeState call({Object? isDarkMode = const $CopyWithPlaceholder()}) {
    return ThemeState(
      isDarkMode:
          isDarkMode == const $CopyWithPlaceholder() || isDarkMode == null
          ? _value.isDarkMode
          // ignore: cast_nullable_to_non_nullable
          : isDarkMode as bool,
    );
  }
}

extension $ThemeStateCopyWith on ThemeState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfThemeState.copyWith(...)` or `instanceOfThemeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ThemeStateCWProxy get copyWith => _$ThemeStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThemeState _$ThemeStateFromJson(Map<String, dynamic> json) =>
    ThemeState(isDarkMode: json['isDarkMode'] as bool? ?? true);

Map<String, dynamic> _$ThemeStateToJson(ThemeState instance) =>
    <String, dynamic>{'isDarkMode': instance.isDarkMode};
