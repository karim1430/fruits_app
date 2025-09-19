import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_hub/core/errors/exptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = credential.user;
      if (user == null) {
        throw CustomException(
          message: 'فشل إنشاء الحساب. الرجاء المحاولة لاحقًا',
        );
      }
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفه جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'البريد الكتروني تم استخدمه مسبقا');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'الرجاء الاتصال بالإنترنت');
      } else {
        throw CustomException(message: 'حدث حطأ الرجاء المحاوله مؤخرا');
      }
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  Future<User> signInUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      if (user == null) {
        throw CustomException(
          message: 'فشل إنشاء الحساب. الرجاء المحاولة لاحقًا',
        );
      }
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'لا يوجد مستخدم بهذا البريد الإلكتروني');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'كلمة المرور غير صحيحة');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'الرجاء الاتصال بالإنترنت');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
          message: 'بيانات غير صحيحة. يرجى التحقق وإعادة المحاولة',
        );
      } else {
        log('============${e.code}===========');
        throw CustomException(
          message: 'حدث خطأ أثناء تسجيل الدخول. الرجاء المحاولة لاحقًا',
        );
      }
    } catch (e) {
      log(e.toString());
      throw CustomException(message: e.toString());
    }
  }

  Future<UserCredential?> signInOrCreateWithGoogle() async {
    final googleSignIn = GoogleSignIn.instance;
    await googleSignIn.initialize(
      serverClientId:
          '372393176344-28q76beu29es27nebgnmc5jpansl9f04.apps.googleusercontent.com',
    );

    // خطوة المصادقة (authentication)
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn
          .authenticate(); // تفاعل مع المستخدم
      if (googleUser == null) {
        return null; // المستخدم لغى تسجيل الدخول
      }

      final auth = googleUser.authentication;
      final idToken = auth.idToken;
      if (idToken == null) {
        throw CustomException(
          message: 'Failed to get idToken during authentication',
        );
      }

      // خطوة التفويض (authorization) للحصول على accessToken إذا احتاجته
      // إذا لم تكن بحاجة إليه (مثلاً فقط لـ Firebase Auth) يمكنك تجاوز هذه الخطوة
      final scopes = ['email', 'profile'];
      final GoogleSignInClientAuthorization? authorization = await googleUser
          .authorizationClient
          .authorizationForScopes(scopes);
      final accessToken = authorization?.accessToken;

      final credential = GoogleAuthProvider.credential(
        idToken: idToken,
        accessToken: accessToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on GoogleSignInException catch (e) {
      log(e.toString());
      throw CustomException(message: 'تم الغاء التسجيل');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        throw CustomException(
          message: 'يوجد حساب مرتبط بمزود مختلف لهذا البريد الإلكتروني',
        );
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
          message: 'بيانات اعتماد جوجل غير صالحة. حاول مرة أخرى.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'الرجاء الاتصال بالإنترنت');
      } else {
        log('====${e.code}====');
        throw CustomException(
          message: 'حدث خطأ أثناء تسجيل الدخول بواسطة جوجل. حاول لاحقًا.',
        );
      }
    } catch (e) {
      log(e.toString());
      throw CustomException(message: e.toString());
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    try {
      // Guard unsupported platforms (desktop, etc.) to avoid MissingPluginException
      if (!kIsWeb &&
          defaultTargetPlatform != TargetPlatform.android &&
          defaultTargetPlatform != TargetPlatform.iOS) {
        throw CustomException(
          message:
              'تسجيل فيسبوك غير مدعوم على هذا النظام. استخدم Android أو iOS.',
        );
      }

      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final OAuthCredential credential = FacebookAuthProvider.credential(
          accessToken.tokenString,
        );

        return await FirebaseAuth.instance.signInWithCredential(credential);
      } else if (result.status == LoginStatus.cancelled) {
        throw CustomException(message: 'تم إلغاء تسجيل الدخول عبر فيسبوك');
      } else {
        throw CustomException(
          message: 'فشل تسجيل الدخول عبر فيسبوك: ${result.message}',
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        throw CustomException(
          message: 'يوجد حساب مرتبط بمزود مختلف لهذا البريد الإلكتروني',
        );
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
          message: 'بيانات اعتماد فيسبوك غير صالحة. حاول مرة أخرى.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'الرجاء الاتصال بالإنترنت');
      } else {
        log('====${e.code}====');
        throw CustomException(
          message: 'حدث خطأ أثناء تسجيل الدخول بواسطة فيسبوك. حاول لاحقًا.',
        );
      }
    } catch (e) {
      log(e.toString());
      throw CustomException(message: e.toString());
    }
  }

  Future delete() {
    return FirebaseAuth.instance.currentUser!.delete();
  }
}
