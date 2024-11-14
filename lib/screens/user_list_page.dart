import 'package:block_training/main.dart';
import 'package:block_training/providers/message_cubit.dart';
import 'package:block_training/providers/user_cubit.dart';
import 'package:flutter/material.dart';
import "package:block_training/model/user.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:block_training/screens/chart_page.dart";

class UserListPage extends StatelessWidget {
  final List<User> users = [
    User(
        id: '1',
        name: 'Alice',
        avatarUrl:
            'https://imgs.mongabay.com/wp-content/uploads/sites/20/2022/10/13165209/52310765570_f6eb262e44_k-768x512.jpg'),
    User(
        id: '2',
        name: 'Bob',
        avatarUrl:
            'https://www.ifad.org/documents/d/new-ifad.org/actionareas-indigenous-woman-75675?imagePreview=1'),
    User(
      id: '3',
      name: 'Charlie',
      avatarUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfpStIHT62rXJuALXjuS6gsjb5VK_MxNbsPR7XANXPiWJ0CM2QwC2TuyXFW7F-bwt2OFE&usqp=CAU',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.avatarUrl),
            ),
            title: Text(user.name),
            onTap: () {
              context.read<UserCubit>().selectedUser(user);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider(
                      create: (context) => MessageCubit(),
                      child: ChatPage(selectedUser: user))));
            },
          );
        },
      ),
    );
  }
}
