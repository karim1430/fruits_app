import 'package:fruits_hub/core/entities/review_entity.dart';

num getAvgRating(List<ReviewEntity> reviews) {
  if (reviews.isEmpty) {
    return 0;
  }
  num total = 0;
  for (var review in reviews) {
    total += review.ratting;
  }
  return total / reviews.length;
}
