import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exptions.dart';

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
        log('============${e.code}');
        throw CustomException(
          message: 'حدث خطأ أثناء تسجيل الدخول. الرجاء المحاولة لاحقًا',
        );
      }
    } catch (e) {
      log(e.toString());
      throw CustomException(message: e.toString());
    }
  }
}
