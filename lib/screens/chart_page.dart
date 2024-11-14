import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:block_training/model/user.dart';
import "package:block_training/providers/message_cubit.dart";

class ChatPage extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final User selectedUser;

  ChatPage({required this.selectedUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${selectedUser.name}'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<MessageCubit, List<Message>>(
              builder: (context, messages) {
                if (messages.isEmpty) {
                  return const Center(
                    child:
                        Text('No messages yet', style: TextStyle(fontSize: 16)),
                  );
                }

                return ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isCurrentUser = message.isSentByUser &&
                        message.senderId == selectedUser.id;
                    return Align(
                      alignment: isCurrentUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isCurrentUser
                              ? Colors.blue[100]
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          message.text,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blueAccent),
                  onPressed: () {
                    final message = _messageController.text.trim();
                    if (message.isNotEmpty) {
                      context.read<MessageCubit>().sendMessage(message,
                          senderId: selectedUser.id,
                          isSentByUser: int.parse(selectedUser.id) % 2 == 0
                              ? false
                              : true);
                      _messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
