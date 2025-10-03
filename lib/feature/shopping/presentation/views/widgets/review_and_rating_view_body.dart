import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/widgets/app_bar_title_and_arrow_widget.dart';
import 'cutom_comment_text_field.dart';
import 'person_review.dart';
import 'rating_bar_widget.dart';

class ReviewAndRatingViewBody extends StatelessWidget {
  const ReviewAndRatingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarTitleAndArrowWidget(title: 'المراجعه'),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: CustomCommentTextField(),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text('232 مراجعة', style: AppStyles.textStyleBold16),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: Text('الملخص', style: AppStyles.textStyleSemi16),
                ),
                RatingBarWidget(),
              ],
            ),
          ),
          SliverList.builder(
            itemCount: 6,
            itemBuilder: (context, index) => PersonsReviews(),
          ),
        ],
      ),
    );
  }
}
