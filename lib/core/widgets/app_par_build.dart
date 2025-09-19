import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

AppBar appBarBuild({required String title}) {
  return AppBar(
    title: Text(title, style: AppStyles.textStyle19),
    centerTitle: true,
  );
}
