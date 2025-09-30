import 'package:flutter/material.dart';

class CustomCommentTextField extends StatelessWidget {
  const CustomCommentTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,

      decoration: InputDecoration(
        hintText: ' اكتب مراجعتك هنا ...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Color(0xffEEEEEE)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Color(0xffEEEEEE)),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: CircleAvatar(
            backgroundColor: Color(0xffFFB400),
            radius: 20,
            child: Icon(Icons.person, color: Color(0xffB5C1C2)),
          ),
        ),
      ),
    );
  }
}
