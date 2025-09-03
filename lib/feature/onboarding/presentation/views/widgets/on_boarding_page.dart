import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardPage extends StatelessWidget {
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
                imageAsset,
                width: double.infinity,
                fit: BoxFit.fill,
                color: imageColor,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(centerImageAsset, height: 180),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
