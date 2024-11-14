abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String? userEmail;
  AuthAuthenticated(this.userEmail);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
