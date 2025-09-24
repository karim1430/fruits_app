import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/feature/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
  Future<Either<Failure, UserEntity>> signInUserWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failure, UserCredential>> signInUserWithGoogle();
  Future<Either<Failure, UserCredential>> signInUserWithFacebook();
  Future addUserData({
    required String path,
    required Map<String, dynamic> data,
    String? uId,
  });
  Future saveUserData({required Map<String, dynamic> user});
  Future<Map<String, dynamic>> getUserData({required String uId});
}
