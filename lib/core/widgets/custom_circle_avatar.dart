import 'package:flutter/material.dart';

class CustomCircleAvatr extends StatelessWidget {
  const CustomCircleAvatr({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: CircleAvatar(
                backgroundColor: Color(0xffF3F5F7),
                radius: 38,
                child: Image.asset(
                  'assets/Avocado-PNG-Clipart 1.png',
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
