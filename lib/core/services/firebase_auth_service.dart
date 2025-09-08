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
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفه جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'البريد الكتروني تم استخدمه مسبقا');
      } else {
        throw CustomException(message: 'حدث حطأ الرجاء المحاوله مؤخرا');
      }
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}
