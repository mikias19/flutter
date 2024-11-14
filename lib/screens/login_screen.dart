import 'package:block_training/cubit/auth_cubit.dart';
import 'package:block_training/cubit/auth_state.dart';
import 'package:block_training/widgets/custom_error_dialog.dart';
import 'package:block_training/widgets/reuseable_button.dart';
import 'package:block_training/widgets/reuseable_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:block_training/screens/signup_screen.dart";
import "package:block_training/screens/main_screen.dart";
import 'package:google_fonts/google_fonts.dart';
import "package:block_training/model/get_friendly_error_text.dart";

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainScreen(userEmail: state.userEmail!),
              ),
            );
          } else if (state is AuthError) {
            showDialog(
              context: context,
              builder: (context) {
                return CustomErrorDialog(
                  title: "Login Failed",
                  message: getFriendlyErrorMessage(state.message),
                  onRetry: () {
                    Navigator.of(context).pop();
                  },
                );
              },
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Image.asset(
                    "assets/login.jpg",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Welcome Back!",
                    style: GoogleFonts.lato(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Login to continue",
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ReuseableTextField(
                    controller: emailController,
                    hintText: "Email",
                  ),
                  const SizedBox(height: 20),
                  ReuseableTextField(
                    controller: passwordController,
                    hintText: "Password",
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ReuseableButton(
                    text: 'Login',
                    onPressed: () {
                      context
                          .read<AuthCubit>()
                          .logIn(emailController.text, passwordController.text);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don\t have an account?",
                        style: GoogleFonts.lato(),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          " Sign up",
                          style: GoogleFonts.lato(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  //  TextButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => BlocProvider(
                  //             create: (context) =>
                  //                 AuthCubit(authRepository: AuthRepository()),
                  //             child: SignUpScreen()),
                  //       ),
                  //     );
                  //   },
                  //   child: Text("Don\t have an account ?Sign up"),
                  // )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
