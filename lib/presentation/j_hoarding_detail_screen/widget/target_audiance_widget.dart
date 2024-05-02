
import '../../../core/app_export.dart';
import 'custom_expandable_widget.dart';

class TargetAudienceWidget extends StatelessWidget {
  const TargetAudienceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableWidget(
        showMore: 'Show all 10 specifications',
        initialColumn1Widgets: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: CustomColors.buttonGreen, width: 2)),
                child: Icon(
                  Icons.check,
                  color: CustomColors.buttonGreen,
                  size: 18.sp,
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              CustomText.text(text: 'Student', fontSize: 13.sp),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: CustomColors.buttonGreen, width: 2)),
                child: Icon(
                  Icons.check,
                  color: CustomColors.buttonGreen,
                  size: 18.sp,
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              CustomText.text(text: 'Foodies', fontSize: 13.sp),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: CustomColors.buttonGreen, width: 2)),
                child: Icon(
                  Icons.check,
                  color: CustomColors.buttonGreen,
                  size: 18.sp,
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              CustomText.text(text: 'Political Activist', fontSize: 13.sp),

            ],
          ),
        ],
        initialColumn2Widgets: [
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: CustomColors.buttonGreen, width: 2)),
                child: Icon(
                  Icons.check,
                  color: CustomColors.buttonGreen,
                  size: 18.sp,
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              CustomText.text(text: 'Culture Seekers', fontSize: 13.sp),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: CustomColors.buttonGreen, width: 2)),
                child: Icon(
                  Icons.check,
                  color: CustomColors.buttonGreen,
                  size: 18.sp,
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              CustomText.text(text: 'Average Class', fontSize: 13.sp),
            ],
          ),
        ]);
  }
}
