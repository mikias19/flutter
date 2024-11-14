import 'package:flutter_bloc/flutter_bloc.dart';
import "auth_state.dart";
import 'package:block_training/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(AuthInitial());

  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    try {
      await authRepository.signUp(email, password);
      emit(AuthAuthenticated(""));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logIn(String email, String password) async {
    emit(AuthLoading());

    try {
      User? user = await authRepository.logIn(email, password);
      if (user != null) {
        emit(AuthAuthenticated(user.email ?? ""));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logOut() async {
    try {
      await authRepository.logOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
