import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_styles.dart';
import 'the_best_selling_fruit.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFF1F1F5)),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(child: Icon(Icons.arrow_back_ios)),
                  ),
                ),
                const Spacer(),
                Text(
                  'الأكثر مبيعًا',
                  style: AppStyles.textStyleBold16.copyWith(fontSize: 20),
                ),
                const Spacer(),
                CircleAvatar(
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: SvgPicture.asset('assets/notification_icon.svg'),
                  ),
                ),
                // const SizedBox(width: 48), // للتوازن مع زر الرجوع
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                itemCount: 20, // عرض المزيد من المنتجات
                itemBuilder: (context, index) {
                  // return const TheBestSellingFruit(productEntity:[],);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
