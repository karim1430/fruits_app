import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/routing/routes.dart';
import 'package:fruits_hub/feature/Best%20Selling/presentation/views/best_selling_view.dart';
import 'package:fruits_hub/feature/home/presentation/views/home_view.dart';
import 'package:fruits_hub/feature/auth/presentation/views/check_view.dart';
import 'package:fruits_hub/feature/auth/presentation/views/login_view.dart';
import 'package:fruits_hub/feature/auth/presentation/views/new_password_view.dart';
import 'package:fruits_hub/feature/auth/presentation/views/password_recovery_view.dart';
import 'package:fruits_hub/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:fruits_hub/feature/auth/presentation/views/sign_up_view.dart';
import 'package:fruits_hub/feature/splash/presentation/views/splash_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return _createRoute(const SplashView());

      case Routes.homeView:
        return _createRoute(const HomeView());
      case Routes.onboardingView:
        return _createRoute(const OnboardingView());
      case Routes.loginView:
        return _createRoute(const LoginView());
      case Routes.passwordRecoveryView:
        return _createRoute(PasswordRecoveryView());
      case Routes.checkView:
        return _createRoute(CheckView());
      case Routes.newPasswordView:
        return _createRoute(NewPasswordView());
      case Routes.signUpview:
        return _createRoute(SignUpView());
      case Routes.bestSellingView:
        return _createRoute(BestSellingView());
      // case Routes.splashScreen:
      //   return _createRoute(const SplashScreen());
      // case Routes.onBoardingScreen:
      //   return _createRoute(const OnboardingScreen());
      // case Routes.loginView:
      //   return _createRoute(const LoginView());
      // case Routes.registerView:
      //   return _createRoute(const RegisterView());
      // case Routes.homeView:
      //   return _createRoute(const HomeView());
      // case Routes.categoriesView:
      //   return _createRoute(const CategoriesView());
      // case Routes.insideCollectionView:
      //   {
      //     final id = settings.arguments as String;
      //     return _createRoute(InsideCollectionView(id: id));
      //   }
      // case Routes.addNoteView:
      //   {
      //     final args = settings.arguments;
      //     return _createRoute(AddNoteView(docID: args as String));
      //   }
      // case Routes.editNoteView:
      //   {
      //     Map<String, dynamic> args =
      //         settings.arguments as Map<String, dynamic>;

      //     return _createRoute(EditNoteView(
      //       docID: args.entries.elementAt(0).toString(),
      //       noteID: args.entries.elementAt(1).toString(),
      //     ));
      //   }
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found!'))),
        );
    }
  }

  PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
