import 'package:block_training/cubit/auth_cubit.dart';
import 'package:block_training/cubit/auth_state.dart';
import 'package:block_training/repository/auth_repository.dart';
import 'package:block_training/widgets/reuseable_button.dart';
import 'package:block_training/widgets/reuseable_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:block_training/widgets/custom_error_dialog.dart";
import "package:block_training/model/get_friendly_error_text.dart";
import "package:bloc/bloc.dart";

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.pop(context);
        } else if (state is AuthError) {
          showDialog(
            context: context,
            builder: (context) {
              return CustomErrorDialog(
                title: "Signup Failed",
                message: getFriendlyErrorMessage(state.message),
                onRetry: () {
                  Navigator.of(context).pop();
                },
              );
            },
          );
          context.read<AuthCubit>().emit(AuthInitial());
        }
      }, builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    "assets/signup.jpg",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Create Account',
                    style: GoogleFonts.lato(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Sign up to get started',
                    style:
                        GoogleFonts.lato(fontSize: 18, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 20),
                  ReuseableTextField(
                    controller: emailController,
                    hintText: "Email",
                  ),
                  const SizedBox(height: 20),
                  ReuseableTextField(
                    controller: passwordController,
                    hintText: "password",
                    isPassword: true,
                  ),
                  const SizedBox(height: 30),
                  ReuseableButton(
                      text: 'Sign Up',
                      onPressed: () {
                        context.read<AuthCubit>().signUp(
                            emailController.text.trim(),
                            passwordController.text.trim());
                      }),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?',
                          style: GoogleFonts.lato()),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.lato(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        );
      }),
    );
  }
}
