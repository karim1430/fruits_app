import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/repos/product_repo/product_repo.dart';
import '../../../../core/cubits/product_cubit/product_cubit.dart';
import '../../../../core/services/service_allocator.dart';
import 'widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(getIt.get<ProductRepo>()),
      child: Scaffold(
        // appBar: AppBar(
        //   leading: CircleAvatar(
        //     child: SvgPicture.asset('assets/notification_icon.svg'),
        //   ),
        //   title: Text('الأكثر مبيعًا', style: AppStyles.textStyle19),
        //   centerTitle: true,
        //   actions: [
        //     CircleAvatar(
        //       child: IconButton(
        //         onPressed: () => Navigator.of(context).pop(),
        //         icon: const Icon(Icons.arrow_back_ios),
        //       ),
        //     ),
        //   ],
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
        body: Builder(
          builder: (context) {
            context.read<ProductCubit>().fetchBestSellingProducts();

            return BestSellingViewBody();
          },
        ),
      ),
    );
  }
}
