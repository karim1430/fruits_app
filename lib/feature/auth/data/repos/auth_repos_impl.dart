import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/exptions.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/feature/auth/data/models/user_model.dart';
import 'package:fruits_hub/feature/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/feature/auth/domain/repos/auth_repo.dart';

class AuthReposImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthReposImpl(this.firebaseAuthService);
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseModel(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
