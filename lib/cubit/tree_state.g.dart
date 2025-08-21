// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TreeStateCWProxy {
  TreeState treeResult(Tree? treeResult);

  TreeState treeHistory(List<Tree> treeHistory);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `TreeState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// TreeState(...).copyWith(id: 12, name: "My name")
  /// ```
  TreeState call({Tree? treeResult, List<Tree> treeHistory});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfTreeState.copyWith(...)` or call `instanceOfTreeState.copyWith.fieldName(value)` for a single field.
class _$TreeStateCWProxyImpl implements _$TreeStateCWProxy {
  const _$TreeStateCWProxyImpl(this._value);

  final TreeState _value;

  @override
  TreeState treeResult(Tree? treeResult) => call(treeResult: treeResult);

  @override
  TreeState treeHistory(List<Tree> treeHistory) =>
      call(treeHistory: treeHistory);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `TreeState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// TreeState(...).copyWith(id: 12, name: "My name")
  /// ```
  TreeState call({
    Object? treeResult = const $CopyWithPlaceholder(),
    Object? treeHistory = const $CopyWithPlaceholder(),
  }) {
    return TreeState(
      treeResult: treeResult == const $CopyWithPlaceholder()
          ? _value.treeResult
          // ignore: cast_nullable_to_non_nullable
          : treeResult as Tree?,
      treeHistory:
          treeHistory == const $CopyWithPlaceholder() || treeHistory == null
          ? _value.treeHistory
          // ignore: cast_nullable_to_non_nullable
          : treeHistory as List<Tree>,
    );
  }
}

extension $TreeStateCopyWith on TreeState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfTreeState.copyWith(...)` or `instanceOfTreeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TreeStateCWProxy get copyWith => _$TreeStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreeState _$TreeStateFromJson(Map<String, dynamic> json) => TreeState(
  treeResult: json['treeResult'] == null
      ? null
      : Tree.fromJson(json['treeResult'] as Map<String, dynamic>),
  treeHistory:
      (json['treeHistory'] as List<dynamic>?)
          ?.map((e) => Tree.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$TreeStateToJson(TreeState instance) => <String, dynamic>{
  'treeResult': instance.treeResult,
  'treeHistory': instance.treeHistory,
};
