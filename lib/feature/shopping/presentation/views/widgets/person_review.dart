import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.amber.shade300,
                          blurRadius: 13,
                          offset: const Offset(6, 6),
                        ),
                      ],
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
