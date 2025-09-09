import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'theme_state.g.dart';

@CopyWith()
@JsonSerializable()
class ThemeState extends Equatable {
  const ThemeState({this.isDarkMode = true});
  @override
  final bool isDarkMode;
  List<Object> get props => [isDarkMode];
  factory ThemeState.fromJson(Map<String, dynamic> json) =>
      _$ThemeStateFromJson(json);

  Map<String, dynamic> toJson() => _$ThemeStateToJson(this);
}
