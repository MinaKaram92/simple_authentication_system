import 'package:authentication_system_flutter/features/auth_feature/data/models/user_model.dart';
import 'package:authentication_system_flutter/features/auth_feature/data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepo) : super(RegisterInitial());
  final AuthRepo _authRepo;

  Future<void> regsiterUser({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(RegisterLoading());
    try {
      UserModel userModel = UserModel(name: name, email: email, phone: phone);
      await _authRepo.registerUserWithEmailAndPassword(
          userModel: userModel, password: password);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
