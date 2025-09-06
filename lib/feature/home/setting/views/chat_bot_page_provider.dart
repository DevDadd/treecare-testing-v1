import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtree/cubit/chat_cubit.dart';
import 'package:testtree/di.dart';
import 'package:testtree/feature/home/setting/views/chat_bot_page.dart';

class ChatBotPageProvider extends StatelessWidget {
  const ChatBotPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatCubit chatCubit = getIt.get();
    return BlocProvider.value(value: chatCubit, child: ChatBotPage());
  }
}
