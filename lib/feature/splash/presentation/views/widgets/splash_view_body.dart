import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/routing/routes.dart';
import 'package:fruits_hub/core/utils/assets.dart';

import '../../../../../core/services/shared_preferences_singleton.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  // late bool skip;
  // @override
  // void initState() {
  //   skip = SharedPreferencesSingleton.getBool('skip');
  //   // waitAndnagigatToBoardingview();
  //   skipToLogin();
  //   super.initState();
  // }

  // void skipToLogin() {
  //   if (skip == false) {
  //     waitAndnagigatToBoardingview();
  //     // setState(() {});
  //   } else {
  //     Future.delayed(const Duration(seconds: 3), () {
  //       Navigator.pushReplacementNamed(context, Routes.loginView);
  //       setState(() {});
  //     });
  //   }
  // }

  // void waitAndnagigatToBoardingview() {
  //   Future.delayed(const Duration(seconds: 3), () {
  //     Navigator.pushReplacementNamed(context, Routes.onboardingView);
  //     setState(() {}); // Use your home route name
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SvgPicture.asset('assets/plant.svg'),
        Center(
          child: SvgPicture.asset(
            'assets/fruit_hup_icon.svg',
            width: 200,
            height: 200,
          ),
        ),
        SvgPicture.asset(Assets.circles),
      ],
    );
  }
}
