import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/widgets/app_bar_widget.dart';
import 'package:fruits_hub/core/widgets/best_selling_and_more.dart';
import 'package:fruits_hub/core/widgets/custom_circle_avatar.dart';
import 'package:fruits_hub/feature/Best%20Selling/presentation/views/widgets/best_selling_grid_view_bloc_builder.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../home/presentation/views/widgets/search_custom.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: AppBarWidget()),
          SliverToBoxAdapter(child: SearchCustom()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(right: 17),
              child: Row(
                children: [
                  Text(
                    'منتجاتنا',
                    style: AppStyles.textStyleBold16.copyWith(fontSize: 20),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.bestSellingView);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffEFF3F4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset(
                        'assets/arrow-swap-horizontal.svg',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: CustomCircleAvatr()),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(right: 17, top: 17),
              child: BestSellingAndMore(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            sliver: BestSellingGridViewBlocBuilder(),
          ),
        ],
      ),
    );
  }
}
