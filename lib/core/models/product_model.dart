import 'dart:io';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File imageFile;
  final bool isFeature;
  String? imageUrl;
  num avgRatting = 0;
  num count = 0;
  final num expiration;
  bool isOrganic;
  final int numberOfCallories;
  final int unitAmount;
  final List<ReviewModel> reviews;
  final int sellingCount;

  ProductModel({
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
    this.sellingCount = 0,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'] as String? ?? '',
      code: json['code'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: json['price'] as num? ?? 0,
      imageFile: File(
        json['image'] as String? ?? '',
      ), // Placeholder, as File cannot be deserialized from JSON
      isFeature: json['isFeature'] as bool? ?? false,
      imageUrl: json['imageUrl'] as String?,
      avgRatting: json['avgRatting'] as num? ?? 0,
      count: json['count'] as num? ?? 0,
      expiration: json['expiration'] as num? ?? 0,
      numberOfCallories: json['numberOfCallories'] as int? ?? 0,
      isOrganic: json['isOrganic'] as bool? ?? false,
      unitAmount: json['unitAmount'] as int? ?? 0,
      reviews: (json['reviews'] as List<dynamic>? ?? [])
          .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sellingCount: json['sellingCount'] as int? ?? 0,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      imageFile: imageFile,
      isFeature: isFeature,
      avgRatting: avgRatting,
      count: count,
      expiration: expiration,
      numberOfCallories: numberOfCallories,
      unitAmount: unitAmount,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      // Store only the image URL in Firestore, not the File instance
      'imageUrl': imageUrl,
      'isFeature': isFeature,
      'avgRatting': avgRatting,
      'count': count,
      'expiration': expiration,
      'numberOfCallories': numberOfCallories,
      'unitAmount': unitAmount,
      'reviews': reviews.map((e) => e.toJson()),
      'sellingCount': sellingCount,
    };
  }
}
