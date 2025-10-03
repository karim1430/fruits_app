import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_hub/core/routing/app_router.dart';
import 'package:fruits_hub/core/services/custom_bloc_observer.dart';
import 'package:fruits_hub/core/services/service_allocator.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/feature/shopping/presentation/manager/cubit/shopping_cart_cubit.dart';
import 'package:fruits_hub/feature/splash/presentation/views/splash_view.dart';
import 'package:fruits_hub/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBwh9OgAhPWX5yodtBsI1wB6BIiQkmDnqM',
      appId: '1:372393176344:android:53b492dfce89fff0bb026d',
      messagingSenderId: 'sendid',
      projectId: 'fruit-fe5e7',
      storageBucket: 'fruit-fe5e7.firebasestorage.app',
    ),
  );
  setup();
  await SharedPreferencesSingleton.init();
  runApp(const FruitApp());
}

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShoppingCartCubit(),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          fontFamily: 'Cairo',
          scaffoldBackgroundColor: Colors.white,
        ),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: const Locale('ar'), // Set the locale to Arabic
        title: 'E-commerce App',
        home: const SplashView(),
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}
