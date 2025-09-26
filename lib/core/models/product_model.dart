import 'dart:io';
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
      name: json['name'] as String,
      code: json['code'] as String,
      description: json['description'] as String,
      price: json['price'] as num,
      imageFile: File(
        json['image'],
      ), // Placeholder, as File cannot be deserialized from JSON
      isFeature: json['isFeature'] as bool,
      imageUrl: json['imageUrl'] as String?,
      avgRatting: json['avgRatting'] ?? 0,
      count: json['count'] ?? 0,
      expiration: json['expiration'] as num,
      numberOfCallories: json['numberOfCallories'] as int,
      isOrganic: json['isOrganic'] ?? false,
      unitAmount: json['unitAmount'] as int,
      reviews: (json['reviews'] as List<dynamic>? ?? [])
          .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sellingCount: json['sellingCount'] ?? 0,
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
