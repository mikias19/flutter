import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<User?> signUp(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      throw Exception('Sign up failed: $e');
    }
  }

  Future<User?> logIn(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      throw Exception("Login failed:$e");
    }
  }

  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}
