import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../products/presentation/views/widgets/custom_show_model_bottom_sheet.dart';

class SearchCustom extends StatelessWidget {
  const SearchCustom({super.key, required this.isResultPage});
  final ValueChanged<bool> isResultPage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),

          border: Border.all(color: Color(0xffF3F5F7)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          children: [
            SvgPicture.asset('assets/search_icon.svg', width: 20, height: 20),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'ابحث عن.......',
                  hintStyle: TextStyle(
                    color: Color(0xff949D9E),
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                  ),
                  border:
                      InputBorder.none, // علشان ميظهرش البوردر بتاع TextField
                ),
              ),
            ),
            CustomShowModalBottomSheet(isResultPage: isResultPage),
          ],
        ),
      ),
    );
  }
}
