import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/product_cubit/product_cubit.dart';
import 'package:fruits_hub/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub/core/services/service_allocator.dart';
import 'package:fruits_hub/feature/products/presentation/views/widgets/product_view_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(getIt.get<ProductRepo>()),
      child: Builder(
        builder: (context) {
          context.read<ProductCubit>().fetchBestSellingProducts();
          return ProductViewBody();
        },
      ),
    );
  }
}
