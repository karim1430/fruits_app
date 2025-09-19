import 'package:bloc/bloc.dart';
import 'package:fruits_hub/feature/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/feature/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signInUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());

    var result = await authRepo.signInUserWithEmailAndPassword(email, password);

    result.fold(
      (failer) {
        emit(SignInFailure(failer.errMessage));
      },
      (success) {
        emit(SignInSuccess(success));
      },
    );
  }
}
