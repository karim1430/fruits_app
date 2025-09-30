import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/widgets/app_bar_title_and_arrow_widget.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';

import 'cutom_comment_text_field.dart';

class ReviewAndRatingViewBody extends StatelessWidget {
  const ReviewAndRatingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarTitleAndArrowWidget(title: 'المراجعه'),
          SizedBox(height: 20),

          CustomCommentTextField(),
          SizedBox(height: 20),
          Text('232 مراجعة', style: AppStyles.textStyleBold16),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
