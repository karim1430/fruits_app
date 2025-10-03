import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/cart_entity.dart';
part 'shopping_cart_state.dart';

class ShoppingCartCubit extends Cubit<ShoppingCartState> {
  ShoppingCartCubit() : super(ShoppingCartInitial());
  List<CartEntity> cartItems = [];

  void addToCart({required CartEntity cartEntity}) {
    try {
      final int existingIndex = cartItems.indexWhere(
        (element) => element.product.code == cartEntity.product.code,
      );
      if (existingIndex != -1) {
        cartItems[existingIndex].count++;
        emit(ShoppingCartAdded());
        log(
          '===============${cartItems[existingIndex].count.toString()}===========',
        );
        return;
      }
      cartItems.add(CartEntity(product: cartEntity.product, count: 1));
      emit(ShoppingCartAdded());
      log(cartItems.first.product.name);
    } catch (e) {
      log(e.toString());
      emit(ShoppingCartError(e.toString()));
    }
  }
}
