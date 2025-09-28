import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/feature/Best%20Selling/presentation/views/widgets/best_selling_grid_view_bloc_builder.dart';

import '../../../../../core/utils/app_styles.dart';
import 'the_best_selling_fruit.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
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
                      child: Center(
                        child: Transform.translate(
                          offset: const Offset(-2, 0), // تزق السهم يمين شوية
                          child: const Icon(Icons.arrow_back_ios, size: 22),
                        ),
                      ),
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
                      onPressed: () => {},
                      icon: SvgPicture.asset('assets/notification_icon.svg'),
                    ),
                  ),
                  // const SizedBox(width: 48), // للتوازن مع زر الرجوع
                ],
              ),
            ),
          ),

          BestSellingGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
