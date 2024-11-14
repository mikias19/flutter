import 'package:bloc/bloc.dart';

class Message {
  final String text;
  final bool isSentByUser;
  final String senderId;

  Message(
      {required this.text, required this.isSentByUser, required this.senderId});
}

class MessageCubit extends Cubit<List<Message>> {
  MessageCubit() : super([]);
  void sendMessage(String message,
      {required senderId, bool isSentByUser = true}) {
    if (message.isNotEmpty) {
      final updatedMessages = List<Message>.from(state);
      updatedMessages.insert(
          0,
          Message(
              text: message, senderId: senderId, isSentByUser: isSentByUser));
      // Debugging line
      print("entered message $message");
      emit(updatedMessages);
    }
  }
}
