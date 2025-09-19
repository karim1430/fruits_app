part of 'sign_in_with_facebook_cubit.dart';

@immutable
sealed class SignInWithFacebookState {}

final class SignInWithFacebookInitial extends SignInWithFacebookState {}

final class SignInWithFacebookLoading extends SignInWithFacebookState {}

final class SignInWithFacebookSuccess extends SignInWithFacebookState {}

final class SignInWithFacebookFailure extends SignInWithFacebookState {
  final String message;

  SignInWithFacebookFailure(this.message);
}
