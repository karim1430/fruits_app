import 'package:fruits_hub/core/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final num ratting;
  final String date;
  final String reviewDescreption;

  ReviewModel({
    required this.name,
    required this.image,
    required this.ratting,
    required this.date,
    required this.reviewDescreption,
  });

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      ratting: reviewEntity.ratting,
      date: reviewEntity.date,
      reviewDescreption: reviewEntity.reviewDescreption,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      ratting: json['ratting'] as num? ?? 0,
      date: json['date'] as String? ?? '',
      reviewDescreption: json['reviewDescreption'] as String? ?? '',
    );
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'ratting': ratting,
      'date': date,
      'reviewDescreption': reviewDescreption,
    };
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      image: image,
      ratting: ratting,
      date: date,
      reviewDescreption: reviewDescreption,
    );
  }
}
