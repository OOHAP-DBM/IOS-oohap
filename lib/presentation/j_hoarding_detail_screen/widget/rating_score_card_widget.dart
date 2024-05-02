import 'package:flutter/cupertino.dart';

import '../../../core/app_export.dart';

class RatingScoreCard extends StatelessWidget {
  const RatingScoreCard(
      {super.key, required this.ratingScore, required this.ratingFor});

  final String ratingScore;
  final String ratingFor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Expanded(
              child: CustomText.text(
                text: ratingScore,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: CustomColors.buttonGreen
              ),
            ),
            SizedBox(height: 5.h),

            /// Add rating type text like Hoarding, Application , quality etc,
            ///
            Expanded(
              child: CustomText.text(
                text: ratingFor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }
}
