import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testtree/cubit/chat_cubit.dart';
import 'package:testtree/cubit/chat_state.dart';

class ChatBotPage extends StatelessWidget {
  const ChatBotPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();
    return BlocProvider(
      create: (_) => ChatCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "AI Personal Assistant",
            style: GoogleFonts.cairo(
              color: Colors.green,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: Colors.green,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ChatCubit, ChatState>(
                  builder: (context, state) {
                    return DashChat(
                      currentUser: cubit.currentUser,
                      onSend: (ChatMessage msg) {
                        context.read<ChatCubit>().sendMessages(msg.text);
                      },
                      messages: state.messages,
                      messageOptions: const MessageOptions(
                        currentUserContainerColor: Colors.grey,
                        currentUserTextColor: Colors.white,

                        // ✅ Fix: set time colors here
                        timeTextColor: Colors.white,
                        currentUserTimeTextColor: Colors.white,
                      ),
                      inputOptions: InputOptions(
                        alwaysShowSend: true,
                        sendButtonBuilder: (VoidCallback send) {
                          return IconButton(
                            onPressed: send,
                            icon: const Icon(Icons.send, color: Colors.white),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),

              BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
