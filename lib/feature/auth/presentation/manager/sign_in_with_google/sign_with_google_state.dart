part of 'sign_with_google_cubit.dart';

@immutable
sealed class SignWithGoogleState {}

final class SignWithGoogleInitial extends SignWithGoogleState {}

final class SignWithGoogleLoading extends SignWithGoogleState {}

final class SignWithGoogleSuccess extends SignWithGoogleState {}

final class SignWithGoogleFailure extends SignWithGoogleState {
  final String errorMessage;

  SignWithGoogleFailure(this.errorMessage);
}
