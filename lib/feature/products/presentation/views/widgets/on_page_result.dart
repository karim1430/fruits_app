import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/widgets/app_bar_widget.dart';
import 'package:fruits_hub/feature/Best%20Selling/presentation/views/widgets/best_selling_grid_view_bloc_builder.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../home/presentation/views/widgets/search_custom.dart';
import 'clissify_less_or_more_price_show_modal.dart';

class OnPageResult extends StatelessWidget {
  const OnPageResult({super.key, required this.isResultPage});
  final ValueChanged<bool> isResultPage;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: AppBarWidget()),
        SliverToBoxAdapter(child: SearchCustom(isResultPage: isResultPage)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(right: 17),
            child: Row(
              children: [
                Text(
                  '4 نتائج',
                  style: AppStyles.textStyleBold16.copyWith(fontSize: 20),
                ),
                Spacer(),
                TextButton(
                  onPressed: () async {
                    await classifyLessOrMorePriceShowModal(
                      context,
                      isResultPage,
                    );
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
                    child: SvgPicture.asset('assets/arrow-swap-horizontal.svg'),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          sliver: BestSellingGridViewBlocBuilder(),
        ),
      ],
    );
  }
}
