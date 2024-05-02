

import '../../../core/app_export.dart';
import 'custom_expandable_widget.dart';

class HoardingSpecificationWidget extends StatelessWidget {
  const HoardingSpecificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableWidget(
        showMore: 'Show all 6 specifications',
        initialColumn1Widgets: [
          CustomText.text(
            text: 'Category',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 3.h),
          CustomText.text(
            text: 'Unipole - OOH',
            color: CustomColors.mediumBlack,
            fontSize: 12.5.sp,
          ),
          SizedBox(height: 7.h),
          CustomText.text(
            text: 'Category',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 3.h),
          CustomText.text(
            text: 'Unipole - OOH',
            color: CustomColors.mediumBlack,
            fontSize: 12.5.sp,
          ),
          SizedBox(height: 7.h),
          CustomText.text(
            text: 'Category',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 3.h),
          CustomText.text(
            text: 'Unipole - OOH',
            color: CustomColors.mediumBlack,
            fontSize: 12.5.sp,
          ),
        ],
        initialColumn2Widgets: [
          CustomText.text(
            text: 'Category',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 3.h),
          CustomText.text(
            text: 'Unipole - OOH',
            color: CustomColors.mediumBlack,
            fontSize: 12.5.sp,
          ),
          SizedBox(height: 7.h),
          CustomText.text(
            text: 'Category',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 3.h),
          CustomText.text(
            text: 'Unipole - OOH',
            color: CustomColors.mediumBlack,
            fontSize: 12.5.sp,
          ),
        ]);
  }
}
