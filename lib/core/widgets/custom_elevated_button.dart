import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    this.onPressed,
  });

  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white, // لون النص والأيقونات
        elevation: 0, // شيل الظل اللي بيغير الإحساس باللون
        shadowColor: Colors.transparent, // يلغي أي لون ظل
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
