part of 'shopping_cart_cubit.dart';

@immutable
sealed class ShoppingCartState {}

final class ShoppingCartInitial extends ShoppingCartState {}

final class ShoppingCartAdded extends ShoppingCartState {}

final class ShoppingCartRemoved extends ShoppingCartState {}

final class ShoppingCartUpdated extends ShoppingCartState {
  final int count;

  ShoppingCartUpdated(this.count);
}

final class ShoppingCartError extends ShoppingCartState {
  final String message;
  ShoppingCartError(this.message);
}
