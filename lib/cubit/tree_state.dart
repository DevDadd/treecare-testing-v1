import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:testtree/model/tree.dart';

part 'tree_state.g.dart';

@CopyWith()
@JsonSerializable()
class TreeState extends Equatable {
  const TreeState({this.treeResult});
  final Tree? treeResult;
  @override
  List<Object?> get props => [treeResult];
}
