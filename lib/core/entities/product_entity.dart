import 'dart:io';

import 'package:fruits_hub/core/entities/review_entity.dart';

class ProductEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final File imageFile;
  final bool isFeature;
  String? imageUrl;
  final num avgRatting;
  final num count;
  final num expiration;
  bool isOrganic;
  final int numberOfCallories;
  final int unitAmount;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.imageFile,
    required this.isFeature,
    this.imageUrl,
    required this.avgRatting,
    required this.count,
    required this.expiration,
    required this.numberOfCallories,
    this.isOrganic = false,
    required this.unitAmount,
    required this.reviews,
  });
}
