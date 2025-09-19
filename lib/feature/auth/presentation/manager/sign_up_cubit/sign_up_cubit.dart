import 'package:bloc/bloc.dart';
import 'package:fruits_hub/feature/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/feature/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignUpLoading());

    var result = await authRepo.createUserWithEmailAndPassword(
      email,
      password,
      name,
    );

    result.fold(
      (failer) {
        emit(SignUpFailure(failer.errMessage));
      },
      (success) {
        emit(SignUpSuccess(success));
      },
    );
  }
}
