import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/routing/routes.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({
    super.key,
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.imageColor,
    required this.centerImageAsset,
    required this.isLastPage,
  });

  final String title;
  final String description;
  final String imageAsset;
  final Color imageColor;
  final String centerImageAsset;
  final bool isLastPage;

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Stack(
            fit: StackFit.expand,
            children: [
              SvgPicture.asset(
                widget.imageAsset,
                width: double.infinity,
                fit: BoxFit.fill,
                color: widget.imageColor,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(widget.centerImageAsset, height: 180),
              ),
              widget.isLastPage
                  ? SizedBox()
                  : Positioned(
                      top: 3,
                      right: 3,
                      child: TextButton(
                        onPressed: () {
                          SharedPreferencesSingleton.setBool('skip', true);
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.loginView,
                          );
                          setState(() {});
                        },
                        child: Text('تخطي'),
                      ),
                    ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            widget.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff4E5556),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
