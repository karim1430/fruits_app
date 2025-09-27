import 'package:flutter/material.dart';

class CustomErrorsWidget extends StatelessWidget {
  const CustomErrorsWidget({super.key, required this.errors});
  final String errors;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errors));
  }
}
