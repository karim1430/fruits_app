import 'dart:io';

import 'package:fruits_hub/core/entities/product_entity.dart';

ProductEntity getDummeyProduct() {
  return ProductEntity(
    name: 'Apple',
    code: 'APL123',
    description: 'Fresh and juicy apples from the farm.',
    price: 2.5,
    imageFile: File(
      '',
    ), // Dummy file, as we cannot provide a real image in a dummy
    isFeature: true,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3kfy4baAJJgK2yvbuFRoZk73WxdNHM4ISVw&s',
    avgRatting: 4.5,
    count: 120,
    expiration: 7,
    numberOfCallories: 52,
    isOrganic: true,
    unitAmount: 1,
    reviews: [],
  );
}

List<ProductEntity> getDummyProduct = [
  getDummeyProduct(),
  getDummeyProduct(),
  getDummeyProduct(),
  getDummeyProduct(),
  getDummeyProduct(),
  getDummeyProduct(),
  getDummeyProduct(),
  getDummeyProduct(),
];
