import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_state.g.dart';

@JsonSerializable()
@CopyWith()
class ChatState extends Equatable {
  ChatState({this.messages = const [], this.isLoading = false});
  List<ChatMessage> messages;
  bool isLoading;
  @override
  List<Object?> get props => [messages, isLoading];
}
