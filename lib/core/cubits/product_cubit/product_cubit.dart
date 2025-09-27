import 'package:bloc/bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/repos/product_repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());

  final ProductRepo productRepo;
  Future<void> fetchProducts() async {
    emit(ProductLoading());
    final products = await productRepo.getProduct();
    products.fold(
      (failure) => emit(ProductFailure(failure.errMessage)),
      (success) => emit(ProductSuccess(success)),
    );
  }

  Future<void> fetchBestSellingProducts() async {
    emit(ProductLoading());
    final products = await productRepo.bestSellingProduct();
    products.fold(
      (failure) => emit(ProductFailure(failure.errMessage)),
      (success) => emit(ProductSuccess(success)),
    );
  }
}
