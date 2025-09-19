import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class GoogleFaceBookApple extends StatelessWidget {
  const GoogleFaceBookApple({
    super.key,
    required this.title,
    required this.logo,
    this.onTap,
  });

  final String title;
  final String logo;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Text(
                title,
                style: AppStyles.textStyleSemi16.copyWith(
                  color: Colors.black87,
                ),
              ),
            ),

            Positioned(
              right: 16,
              child: SvgPicture.asset(logo, width: 20, height: 20),
            ),
          ],
        ),
      ),
    );
  }
}
