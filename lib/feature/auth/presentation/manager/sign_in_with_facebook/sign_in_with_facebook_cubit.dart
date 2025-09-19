import 'package:bloc/bloc.dart';
import 'package:fruits_hub/feature/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_with_facebook_state.dart';

class SignInWithFacebookCubit extends Cubit<SignInWithFacebookState> {
  SignInWithFacebookCubit(this.authRepo) : super(SignInWithFacebookInitial());

  final AuthRepo authRepo;

  Future<void> signInORcreateUserWithFacebook() async {
    emit(SignInWithFacebookLoading());

    var result = await authRepo.signInUserWithFacebook();

    result.fold(
      (failer) {
        emit(SignInWithFacebookFailure(failer.errMessage));
      },
      (success) {
        emit(SignInWithFacebookSuccess());
      },
    );
  }
}
