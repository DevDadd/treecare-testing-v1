import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtree/cubit/chat_state.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatUser currentUser;
  final ChatUser geminiUser;

  ChatCubit()
    : currentUser = ChatUser(id: "1", firstName: "Dev", lastName: "Dad"),
      geminiUser = ChatUser(
        id: "2",
        firstName: "TreeCare",
        lastName: "Support",
        profileImage: "https://i.postimg.cc/BvW7kD7f/avatar.jpg",
      ),
      super(ChatState());

  Future<void> sendMessages(String text) async {
    final userMessage = ChatMessage(
      text: text,
      user: currentUser,
      createdAt: DateTime.now(),
    );

    emit(
      state.copyWith(
        messages: [userMessage, ...state.messages],
        isLoading: true,
      ),
    );
    try {
      final response = await Gemini.instance.text(text);
      final botMessage = ChatMessage(
        text: response?.output ?? "Sorry, I dont understands",
        user: geminiUser,
        createdAt: DateTime.now(),
      );
      emit(
        state.copyWith(
          messages: [botMessage, ...state.messages],
          isLoading: false,
        ),
      );
    } catch (e) {
      final errorMessages = ChatMessage(
        user: geminiUser,
        createdAt: DateTime.now(),
        text: "Error $e",
      );
      emit(
        state.copyWith(
          messages: [errorMessages, ...state.messages],
          isLoading: false,
        ),
      );
    }
  }
}
