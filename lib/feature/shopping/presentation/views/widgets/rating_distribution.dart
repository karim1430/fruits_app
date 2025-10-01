import 'dart:math' as math;

import 'package:flutter/material.dart';

class RatingDistribution extends StatelessWidget {
  const RatingDistribution({super.key});

  @override
  Widget build(BuildContext context) {
    final ratings = {
      5: 1.0, // 100%
      4: 0.7, // 70%
      3: 0.5, // 50%
      2: 0.3, // 30%
      1: 0.2, // 20%
    };

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // توزيع النجوم
          Column(
            children: ratings.entries.map((e) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    // رقم النجمة

                    // Progress bar
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(math.pi),
                          child: LinearProgressIndicator(
                            value: e.value,
                            backgroundColor: Colors.grey.shade300,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.orange,
                            ),
                            minHeight: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      e.key.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
