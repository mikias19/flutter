import 'package:flutter_bloc/flutter_bloc.dart';
import "package:block_training/model/user.dart";

class UserCubit extends Cubit<User?> {
  UserCubit() : super(null);

  void selectedUser(User user) {
    emit(user);
  }
}
