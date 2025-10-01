import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/widgets/app_bar_title_and_arrow_widget.dart';
import 'cutom_comment_text_field.dart';
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

class PersonsReviews extends StatelessWidget {
  const PersonsReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.ltr,

          child: ListTile(
            leading: Stack(
              clipBehavior: Clip.none,
              children: [
                const CircleAvatar(backgroundColor: Colors.blue),
                Positioned(
                  bottom: -3,
                  right: -3,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Color(0xffFFB400),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text('4.5'),
                  ),
                ),
              ],
            ),
            title: const Text('كريم', style: AppStyles.textStyleBold16),
            subtitle: Text(
              DateTime.now().toString(),
              style: AppStyles.textStyleBold13,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: Align(
            alignment: Alignment.centerRight,

            child: Text(
              'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها',
              style: AppStyles.textStyleBold16.copyWith(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
