import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/utils/constants.dart';

class FruitPromoCard extends StatelessWidget {
  const FruitPromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Container(
        width: width,
        height: 180,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFFFA726), // Orange color
              Color(0xFF66BB6A), // Green color
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Fruits image on the left
            Positioned(
              left: 20,
              top: 20,
              bottom: 20,
              child: Container(
                width: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1610348725531-843dff563e2c?w=400&h=300&fit=crop',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.white.withOpacity(0.2),
                        child: Icon(Icons.image, color: Colors.white, size: 40),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Content on the right
            Positioned(
              right: 20,
              top: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Arabic text "عروض العيد"
                  Text(
                    'عروض العيد',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.right,
                  ),

                  SizedBox(height: 8),

                  // Discount text
                  Text(
                    'خصم 25%',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 12),
                  // Shopping button
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.38,
                    height: 42,
                    padding: EdgeInsets.only(left: 28, right: 28),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        'تسوق الآن',
                        style: AppStyles.textStyleBold13.copyWith(
                          color: kPrimaryColor,
                        ),
                        //  TextStyle(
                        //   fontSize: 14,
                        //   fontWeight: FontWeight.w600,
                        //   color: Color(0xFF66BB6A),
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
