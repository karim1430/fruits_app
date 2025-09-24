import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/routing/routes.dart';
import '../../../../core/services/shared_preferences_singleton.dart';
import 'widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late bool skip;
  bool _hasNavigated = false; // لمنع التنقل المتعدد

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  void _initializeApp() async {
    // الحصول على حالة المستخدم من Firebase
    final user = FirebaseAuth.instance.currentUser;

    // الحصول على حالة skip من SharedPreferences
    skip = SharedPreferencesSingleton.getBool('skip');

    // انتظار 3 ثواني لعرض الشاشة
    await Future.delayed(const Duration(seconds: 3));

    // التنقل بناءً على الحالة
    _navigateBasedOnState(user);
  }

  void _navigateBasedOnState(User? user) {
    if (_hasNavigated) return; // منع التنقل المتعدد
    _hasNavigated = true;

    if (user != null) {
      // المستخدم مسجل دخول - الذهاب للصفحة الرئيسية
      log('User is signed in! Navigating to home');
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil(Routes.homeView, (route) => false);
    } else if (skip == true) {
      // المستخدم اختار تخطي التعريف - الذهاب لصفحة تسجيل الدخول
      log('User skipped onboarding. Navigating to login');
      Navigator.pushReplacementNamed(context, Routes.loginView);
    } else {
      // المستخدم لم يختار تخطي التعريف - الذهاب لصفحة التعريف
      log('User needs onboarding. Navigating to onboarding');
      Navigator.pushReplacementNamed(context, Routes.onboardingView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SplashViewBody());
  }
}
