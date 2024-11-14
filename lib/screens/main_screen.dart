import "package:flutter_bloc/flutter_bloc.dart";
import 'package:flutter/material.dart';
import "package:block_training/cubit/auth_cubit.dart";
import 'package:block_training/cubit/auth_state.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatelessWidget {
  final String userEmail;
  const MainScreen({super.key, required this.userEmail});
  String getUserInitials(String email) {
    return email.isNotEmpty ? email.substring(0, 2).toUpperCase() : '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          // Navigate back to the login screen after logout
          Navigator.pushReplacementNamed(context, '/');
        }
      },
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Text(
            'Dashboard',
            style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          actions: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blueAccent,
              child: Text(
                getUserInitials(userEmail),
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<AuthCubit>().logOut();
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.home, size: 100, color: Colors.blueAccent),
              const SizedBox(height: 20),
              Text(
                'Welcome to the Main Screen!',
                style: GoogleFonts.lato(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Enjoy exploring our app.',
                style: GoogleFonts.lato(fontSize: 18, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
