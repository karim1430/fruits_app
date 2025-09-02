import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageAsset;
  final Color imageColor;
  final String centerImageAsset;

  const OnboardPage({
    super.key,
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.imageColor,
    required this.centerImageAsset,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          // تم إضافة SizedBox لضبط الارتفاع والعرض
          width: MediaQuery.of(context).size.width,
          height: screenHeight * 0.4,
          child: Stack(
            fit: StackFit.expand, // لجعل Stack يأخذ المساحة المتاحة بالكامل
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                imageAsset,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill, // لملء المساحة بالكامل
                color: imageColor,
              ),
              Positioned(
                bottom: 0,
                child: SvgPicture.asset(centerImageAsset, height: 180),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Text(
          title,
          textDirection: TextDirection.rtl,
          style: GoogleFonts.nunito(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            description,
            textDirection: TextDirection.rtl,

            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontSize: 16,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
