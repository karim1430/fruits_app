import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/routing/routes.dart';
import 'package:fruits_hub/core/services/service_allocator.dart';
import 'package:fruits_hub/feature/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/feature/auth/presentation/manager/sign_in_with_facebook/sign_in_with_facebook_cubit.dart';
import 'package:fruits_hub/feature/auth/presentation/manager/sign_in_with_google/sign_with_google_cubit.dart';
import 'package:fruits_hub/feature/auth/presentation/views/widgets/divider_widget.dart';
import 'package:fruits_hub/feature/auth/presentation/views/widgets/google_facebook_apple.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/showSnackBar.dart';
import 'facebook_bloc_consumer.dart';

class OtherLogin extends StatelessWidget {
  const OtherLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignWithGoogleCubit(getIt<AuthRepo>()),
        ),
        BlocProvider(
          create: (context) => SignInWithFacebookCubit(getIt<AuthRepo>()),
        ),
      ],

      child: Builder(
        builder: (context) {
          return Column(
            children: [
              DividerWidget(),
              SizedBox(height: 33),

              GoogleBlocConsumer(),
              SizedBox(height: 16),
              Platform.isIOS
                  ? Column(
                      children: [
                        GoogleFaceBookApple(
                          title: 'تسجيل بواسطة ابل',
                          logo: Assets.apple,
                        ),
                        SizedBox(height: 16),
                      ],
                    )
                  : SizedBox(),
              FacebookBlocConsumer(),
            ],
          );
        },
      ),
    );
  }
}

class GoogleBlocConsumer extends StatelessWidget {
  const GoogleBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignWithGoogleCubit, SignWithGoogleState>(
      listener: (context, state) {
        if (state is SignWithGoogleSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.homeView,
            (Route<dynamic> route) => false,
          );
          showSnackBar(context, 'تم تسجيل الدخول بنجاح');
        }
        if (state is SignWithGoogleFailure) {
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return GoogleFaceBookApple(
          onTap: () async {
            await context
                .read<SignWithGoogleCubit>()
                .signInORcreateUserWithGoogle();
          },
          title: 'تسجيل بواسطة جوجل',
          logo: Assets.google,
        );
      },
    );
  }
}
