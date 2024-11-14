import 'package:block_training/cubit/auth_cubit.dart';
import 'package:block_training/repository/auth_repository.dart';
import 'package:block_training/screens/login_screen.dart';
import 'package:block_training/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:block_training/providers/message_cubit.dart";
import 'package:block_training/providers/user_cubit.dart';
import 'package:block_training/screens/user_list_page.dart';
import "package:firebase_core/firebase_core.dart";
import "package:block_training/screens/main_screen.dart";
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// final kColorScheme =
//     ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 131, 57, 0));
// final theme = ThemeData(colorScheme: kColorScheme);

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AuthCubit(
//         authRepository: AuthRepository(),
//       ),
//       child: MaterialApp(
//         theme: theme,
//         home: SignUpScreen(),
//       ),
//     );
//   }
// }
final kColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 131, 57, 0));
final theme = ThemeData(colorScheme: kColorScheme);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    BlocProvider(
      create: (context) => AuthCubit(authRepository: AuthRepository()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/main': (context) => MainScreen(userEmail: ""),
      },
    );
  }
}
