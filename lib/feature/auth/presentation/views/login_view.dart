import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/feature/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/feature/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import '../../../../core/services/service_allocator.dart';
import '../../../../core/widgets/app_par_build.dart';
import 'widgets/login_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: appBarBuild(title: 'تسجيل الدخول'),
        body: LoginViewBodyBlocConsumer(),
      ),
    );
  }
}
