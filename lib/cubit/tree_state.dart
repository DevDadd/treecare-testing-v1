import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:testtree/model/tree.dart';

part 'tree_state.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class TreeState extends Equatable {
  const TreeState({
    this.treeResult,
    this.treeHistory = const [],
  });

  final Tree? treeResult;
  final List<Tree> treeHistory;

  factory TreeState.fromJson(Map<String, dynamic> json) =>
      _$TreeStateFromJson(json);

  Map<String, dynamic> toJson() => _$TreeStateToJson(this);

  @override
  List<Object?> get props => [treeResult, treeHistory];
}
