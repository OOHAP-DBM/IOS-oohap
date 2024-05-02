import 'dart:math';
import '../../../core/app_export.dart';
import 'like_dislike_widget.dart';

class CustomerReviewWidget extends StatefulWidget {
  final String title;
  final String imageUrl;
  final int itemCountCustomerImage;
  final String hoardingTitle;
  final String customerName;
  final String date;
  final String reviewRating;
  final Widget customerCommentsWidget;
  final int reviewUsers;
  final String readAllReview;
  final void Function()? onTap;

  const CustomerReviewWidget({
    super.key,
    this.title = 'Customer photos & reviews',
    required this.imageUrl,
    required this.itemCountCustomerImage,
    this.hoardingTitle = 'Hoarding Quality',
    required this.customerName,
    this.date = 'January 17, 2024',
    this.reviewRating = '4.0',
    required this.customerCommentsWidget,
    required this.reviewUsers,
    this.readAllReview = 'Read All 150 Review', this.onTap,
  });

  @override
  State<CustomerReviewWidget> createState() => _CustomerReviewWidgetState();
}

class _CustomerReviewWidgetState extends State<CustomerReviewWidget> {
  bool _isShowAll = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.text(
            text: widget.title,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 60.h,
            child: ListView.builder(
              itemCount: widget.itemCountCustomerImage,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemExtent: 73.w,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 12.r),
                  child: InkWell(
                    onTap: widget.onTap,
                    child: Container(
                      decoration: BoxDecoration(
                     //   color: Colors.red,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: CustomCachedNetworkImage(
                          imageUrl: widget.imageUrl,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount:
                _isShowAll ? widget.reviewUsers : min(2, widget.reviewUsers),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.text(
                            text: widget.hoardingTitle,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              CustomText.text(
                                text: widget.customerName,
                                fontSize: 12.sp,
                                color: CustomColors.mediumBlack,
                                fontWeight: FontWeight.w500,
                              ),
                              CustomText.text(
                                text: ' ● ',
                                fontSize: 12.sp,
                                color: CustomColors.mediumBlack,
                                fontWeight: FontWeight.w500,
                              ),
                              CustomText.text(
                                text: widget.date,
                                fontSize: 12.sp,
                                color: CustomColors.mediumBlack,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.5.r,
                          vertical: 1.5.r,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 1.5),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: CustomText.text(
                          text: widget.reviewRating,
                          fontSize: 10.5.sp,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  widget.customerCommentsWidget,
                  SizedBox(height: 8.h),
                  const LikeWidget(),
                  SizedBox(height: 8.h),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: CustomColors.grey.withOpacity(0.5),
                  ),
                  SizedBox(height: 8.h),
                ],
              );
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Material(
              child: InkWell(
                splashColor: Colors.grey[300],
                onTap: () {
                  setState(() {
                    _isShowAll = !_isShowAll;
                  });
                },
                child: CustomText.text(
                  text: _isShowAll ? 'Show less' : widget.readAllReview,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
