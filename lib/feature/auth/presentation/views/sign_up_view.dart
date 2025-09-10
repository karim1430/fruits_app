import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/service_allocator.dart';
import 'package:fruits_hub/core/widgets/app_par_build.dart';
import 'package:fruits_hub/feature/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/feature/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'widgets/sign_up_view_body_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuild(title: 'حساب جديد'),
      body: BlocProvider(
        create: (context) => SignUpCubit(getIt<AuthRepo>()),
        child: SignUpViewBodyBlocComsumer(),
      ),
    );
  }
}
