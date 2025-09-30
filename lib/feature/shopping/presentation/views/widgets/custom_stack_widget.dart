import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomStackWidget extends StatelessWidget {
  const CustomStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: SvgPicture.asset(
            'assets/Ellipse 225.svg',
            height: MediaQuery.of(context).size.height * 0.42,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ),
        ),
        Positioned(
          bottom: 80,
          left: 0,
          right: 0,
          child: Image.network(
            'https://img.freepik.com/free-photo/red-apple-with-leaf_1150-11335.jpg?w=2000',
            height: MediaQuery.of(context).size.height * 0.25,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.fastfood,
                size: 40,
                color: Colors.grey.shade400,
              );
            },
          ),
        ),
      ],
    );
  }
}
