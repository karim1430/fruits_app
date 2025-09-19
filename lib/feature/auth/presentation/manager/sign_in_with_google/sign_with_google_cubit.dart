import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../domain/repos/auth_repo.dart';

part 'sign_with_google_state.dart';

class SignWithGoogleCubit extends Cubit<SignWithGoogleState> {
  SignWithGoogleCubit(this.authRepo) : super(SignWithGoogleInitial());

  final AuthRepo authRepo;

  Future<void> signInORcreateUserWithGoogle() async {
    emit(SignWithGoogleLoading());

    var result = await authRepo.signInUserWithGoogle();

    result.fold(
      (failer) {
        emit(SignWithGoogleFailure(failer.errMessage));
      },
      (success) {
        emit(SignWithGoogleSuccess());
      },
    );
  }
}
