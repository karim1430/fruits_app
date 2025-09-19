import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exptions.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/firebase_services.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';
import 'package:fruits_hub/feature/auth/data/models/user_model.dart';
import 'package:fruits_hub/feature/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/feature/auth/domain/repos/auth_repo.dart';

class AuthReposImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final FirebaseServices firebaseServices;

  AuthReposImpl(this.firebaseAuthService, this.firebaseServices);
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    UserModel? userEntity;
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      log(user.displayName.toString());
      userEntity = UserModel.fromFirebaseModel(user, fallbackName: name);
      await addUserData(
        path: BackendEndpoint.addUserData,
        data: userEntity.toMap(),
        uId: user.uid,
      );
      return right(userEntity);
    } on CustomException catch (e) {
      if (userEntity != null) {
        await firebaseAuthService.delete();
      }
      return left(ServerFailure(e.message));
    } catch (e) {
      if (userEntity != null) {
        await firebaseAuthService.delete();
      }
      log(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var users = await getUserData(uId: user.uid);
      log(users.toString());
      return right(UserModel.fromJson(users));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInUserWithGoogle() async {
    try {
      final userCredential = await firebaseAuthService
          .signInOrCreateWithGoogle();

      if (userCredential == null) {
        return left(ServerFailure('تم إلغاء تسجيل الدخول بواسطة جوجل'));
      }
      log(userCredential.user!.email!.toString());
      UserEntity user = UserEntity(
        name: userCredential.user?.displayName ?? '',
        email: userCredential.user!.email!,
        uId: userCredential.user!.uid,
      );
      var isUserExist = await firebaseServices.checkIfUserExist(
        path: BackendEndpoint.checkUserExist,
        uId: user.uId,
      );
      if (isUserExist) {
        await getUserData(uId: user.uId);
      } else {
        await addUserData(
          path: BackendEndpoint.addUserData,
          data: user.toMap(),
          uId: user.uId,
        );
      }
      return right(userCredential);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInUserWithFacebook() async {
    try {
      final userCredential = await firebaseAuthService.signInWithFacebook();

      return right(userCredential);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future addUserData({
    required String path,
    required Map<String, dynamic> data,
    String? uId,
  }) async {
    // try {
    return await firebaseServices.addData(path: path, data: data, uId: uId);
    // } catch (e) {
    //   await firebaseAuthService.delete();
    //   CustomException(message: 'try in the later again');
    //   log('Exception (add user data) $e');
    // }
  }

  @override
  Future<Map<String, dynamic>> getUserData({required String uId}) async {
    return await firebaseServices.getData(
      path: BackendEndpoint.getUserData,
      uId: uId,
    );
  }
}
