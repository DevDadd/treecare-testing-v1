import 'package:bloc/bloc.dart';
import 'package:testtree/cubit/user_state.dart';
import 'package:testtree/model/user.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState());
  void addUser(User user) {
    emit(state.copyWith(users: user));
  }

  void disposeUser() {
    emit(state.copyWith(users: null));
  }
}
