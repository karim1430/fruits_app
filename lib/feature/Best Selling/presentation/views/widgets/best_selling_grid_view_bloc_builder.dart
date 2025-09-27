import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/product_cubit/product_cubit.dart';
import 'package:fruits_hub/core/helper_functions/get_ducmmey_product.dart';
import 'package:fruits_hub/core/widgets/custom_errors_widget.dart';
import 'package:fruits_hub/feature/Best%20Selling/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingGridViewBlocBuilder extends StatelessWidget {
  const BestSellingGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return BestSellingGridView(productEntity: state.products);
        } else if (state is ProductFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorsWidget(errors: state.errMessage),
          );
        } else {
          return Skeletonizer.sliver(
            child: BestSellingGridView(productEntity: getDummyProduct),
          );
        }
      },
    );
  }
}
