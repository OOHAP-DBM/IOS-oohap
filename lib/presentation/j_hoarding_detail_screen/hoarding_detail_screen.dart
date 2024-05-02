import 'package:flutter/cupertino.dart';
import 'package:oohapp/presentation/j_hoarding_detail_screen/widget/car_widget.dart';
import 'package:oohapp/presentation/j_hoarding_detail_screen/widget/custom_expandable_widget.dart';
import 'package:oohapp/presentation/j_hoarding_detail_screen/widget/customer_review_widget.dart';
import 'package:oohapp/presentation/j_hoarding_detail_screen/widget/dummy_comments.dart';
import 'package:oohapp/presentation/j_hoarding_detail_screen/widget/hoarding_detail_card_widget.dart';
import 'package:oohapp/presentation/j_hoarding_detail_screen/widget/rating_score_card_widget.dart';
import 'package:oohapp/presentation/j_hoarding_detail_screen/widget/target_audiance_widget.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_appbar/detail_screen_app_bar.dart';
import '../../widgets/custom_buttons/custom_text_btn.dart';
import '../i_pos_screen/model/hoarding_dummy_data.dart';
import '../i_pos_screen/widget/expandable_text.dart';

class HoardingDetailScreen extends StatefulWidget {
  final String? hoardingType;

  const HoardingDetailScreen({super.key, this.hoardingType});

  @override
  State<HoardingDetailScreen> createState() => _HoardingDetailScreenState();
}

class _HoardingDetailScreenState extends State<HoardingDetailScreen> {
  List<Map<String, dynamic>> hoardingDetailsList = [];

  int _currentImagePage = 0;

  List<String> getImageUrls(List<Map<String, dynamic>> data) {
    List<String> imageUrls = [];
    for (var item in data) {
      imageUrls.add(item['imageUrl']);
    }
    return imageUrls;
  }

  /// Web view for demo purpose

  // late final WebViewController controller;
  //
  // @override
  // void initState() {
  //   controller = WebViewController()
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //     ..loadRequest(Uri.parse(
  //         'https://www.google.com/maps/search/imambara+in+lucknow/@26.8742993,80.8436355,11z?entry=ttu'));
  //   super.initState();
  // }

  final String reviewImages =
      'https://images.unsplash.com/photo-1696512651935-15dd8ab560b4?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:  DetailScreenAppBar(
        title: 'Hoarding Details',
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HoardingDetailCardWidget(
                    imageUrl: getImageUrls(oohHoardingDummyData),
                    numberOfImage:
                        "${_currentImagePage + 1}/${oohHoardingDummyData.length}",
                    onPageChanged: (int page) {
                      setState(() {
                        _currentImagePage = page;
                      });
                    },
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.r, vertical: 10.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.23),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText.text(
                                    text: 'Polytechnic Chauraha',
                                    // Use the provided hoardingLocation
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  CustomText.text(
                                      text: '60*20sf',
                                      color: CustomColors.mediumBlack,
                                      fontSize: 12.sp,
                                      fontStyle: FontStyle.italic)
                                ]),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomText.text(
                              text: 'Gomati nagar Lucknow',
                              // Use the provided hoardingCity

                              fontSize: 13.sp,
                              color: CustomColors.mediumBlack,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5.r),
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0.r))),
                                        child: CustomText.text(
                                          text: '4.0',
                                          // Use the provided hoardingCity
                                          fontSize: 11.sp,
                                          color: CustomColors.whiteColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CustomText.text(
                                                  text: 'Excellent',
                                                  // Use the provided hoardingCity
                                                  fontSize: 12.sp,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w600),
                                              CustomText.text(
                                                text: "(2423 Ratings)",
                                                fontSize: 11.sp,
                                                color: CustomColors.mediumBlack,
                                              ),
                                            ],
                                          ),
                                          CustomText.text(
                                            text:
                                                "80% clients rated this hoarding.",
                                            // Use the provided hoardingCity
                                            fontSize: 10.5.sp,
                                            color: CustomColors.mediumBlack,
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 15.sp,
                                        color: CustomColors.buttonGreen,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: 22,
                                          decoration: BoxDecoration(
                                              //    color: Colors.blue,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0.r))),
                                          child: const CustomCachedNetworkImage(
                                              imageUrl:
                                                  'https://i.pinimg.com/564x/ff/05/dc/ff05dc4dad240614d98afb8fe10733dc.jpg')),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CustomText.text(
                                                  text:
                                                      'Sector 25, Indira Nagar Lucknow',
                                                  // Use the provided hoardingCity
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600),
                                            ],
                                          ),
                                          CustomText.text(
                                            text: "View on Map",
                                            // Use the provided hoardingCity
                                            fontSize: 10.5.sp,
                                            color: Colors.blue,
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 15.sp,
                                        color: CustomColors.buttonGreen,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ])),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.23),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.text(
                            text: 'Polytechnic Chauraha',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 8.h,
                        ),
                        Container(
                          height: 180.h,
                          clipBehavior: Clip.hardEdge,
                          width: size.width,
                          decoration: BoxDecoration(
                              // color: Colors.blue,
                              border: Border.all(
                                  color: CustomColors.blackColor, width: 0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0.r))),
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0.r)),
                              child: /*WebViewWidget(
                              controller: controller,
                            ),*/
                                  const CustomCachedNetworkImage(
                                      imageUrl:
                                          'https://images.unsplash.com/photo-1591117752671-541f3495dc93?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.23),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.text(
                            text: 'Description',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 8.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0.r))),
                          child: const ExpandableTextWidget(
                            text:
                                "Perfect answer. Thanks very much. You can't add a boxShadow to the decorator of a ClipRRect. It doesn't work. However, you can add that boxShadow to a Container with clipBehavior Clip.hardEdge. This is another reason why this should be the accepted answer is that",
                            defaultMaxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.23),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.text(
                            text: 'Hoarding Specifications',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 8.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0.r))),
                          child: ExpandableWidget(
                              showMore: 'Show all 6 specifications',
                              initialColumn1Widgets: [
                                CustomText.text(
                                  text: 'Category',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 3.h),
                                CustomText.text(
                                  text: widget.hoardingType!,
                                  color: CustomColors.mediumBlack,
                                  fontSize: 12.5.sp,
                                ),
                                SizedBox(height: 7.h),
                                CustomText.text(
                                  text: 'Size',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 3.h),
                                CustomText.text(
                                  text: '10 ft x 20 ft',
                                  color: CustomColors.mediumBlack,
                                  fontSize: 12.5.sp,
                                ),
                                SizedBox(height: 7.h),
                                CustomText.text(
                                  text: 'Daily Average Footfall',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 3.h),
                                CustomText.text(
                                  text: '1000 - 1500',
                                  color: CustomColors.mediumBlack,
                                  fontSize: 12.5.sp,
                                ),
                              ],
                              initialColumn2Widgets: [
                                CustomText.text(
                                  text: 'lopsem porem',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 3.h),
                                CustomText.text(
                                  text: 'lopsem porem',
                                  color: CustomColors.mediumBlack,
                                  fontSize: 12.5.sp,
                                ),
                                SizedBox(height: 7.h),
                                CustomText.text(
                                  text: 'lopsem porem',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 3.h),
                                CustomText.text(
                                  text: 'lopsem porem',
                                  color: CustomColors.mediumBlack,
                                  fontSize: 12.5.sp,
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.23),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.text(
                            text: 'Recently Booked by',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0.r))),
                            child: Column(
                              children: [
                                // image row 1
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CarLogoWidget(
                                      imageUrl:
                                          'https://w7.pngwing.com/pngs/995/480/png-transparent-bmw-car-logo-bmw-logo-trademark-logo-car-thumbnail.png',
                                      carBrandName: 'BMW',
                                    ),
                                    CarLogoWidget(
                                      imageUrl:
                                          'https://w7.pngwing.com/pngs/995/480/png-transparent-bmw-car-logo-bmw-logo-trademark-logo-car-thumbnail.png',
                                      carBrandName: 'BMW',
                                    ),
                                    CarLogoWidget(
                                      imageUrl:
                                          'https://w7.pngwing.com/pngs/995/480/png-transparent-bmw-car-logo-bmw-logo-trademark-logo-car-thumbnail.png',
                                      carBrandName: 'BMW',
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 10.h,
                                ),

                                // image row 2
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CarLogoWidget(
                                      imageUrl:
                                          'https://w7.pngwing.com/pngs/995/480/png-transparent-bmw-car-logo-bmw-logo-trademark-logo-car-thumbnail.png',
                                      carBrandName: 'BMW',
                                    ),
                                    CarLogoWidget(
                                      imageUrl:
                                          'https://w7.pngwing.com/pngs/995/480/png-transparent-bmw-car-logo-bmw-logo-trademark-logo-car-thumbnail.png',
                                      carBrandName: 'BMW',
                                    ),
                                    CarLogoWidget(
                                      imageUrl:
                                          'https://w7.pngwing.com/pngs/995/480/png-transparent-bmw-car-logo-bmw-logo-trademark-logo-car-thumbnail.png',
                                      carBrandName: 'BMW',
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.23),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.text(
                            text: 'Target Audience',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0.r))),
                            child: const TargetAudienceWidget()),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.23),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.text(
                            text: 'Review & Ratings',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0.r))),
                            child: Column(
                              children: [
                                // image row 1
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5.r),
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0.r))),
                                      child: CustomText.text(
                                        text: '4.0',
                                        // Use the provided hoardingCity
                                        fontSize: 11.sp,
                                        color: CustomColors.whiteColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CustomText.text(
                                                text: 'Excellent',
                                                // Use the provided hoardingCity
                                                fontSize: 12.sp,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w600),
                                            CustomText.text(
                                              text: "(2423 Ratings)",
                                              fontSize: 11.sp,
                                              color: CustomColors.mediumBlack,
                                            ),
                                          ],
                                        ),
                                        CustomText.text(
                                          text:
                                              "80% clients rated this hoarding.",
                                          // Use the provided hoardingCity
                                          fontSize: 10.5.sp,
                                          color: CustomColors.mediumBlack,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText.text(
                            text: 'Rating Score Card',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          height: 66.h,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.r, vertical: 10.r),
                          decoration: BoxDecoration(
                            color: CustomColors.buttonGreen.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const ClampingScrollPhysics(),
                            children: [
                              const RatingScoreCard(
                                ratingScore: '4.7',
                                ratingFor: 'Hoarding',
                              ),
                              SizedBox(width: 15.w),
                              const RatingScoreCard(
                                ratingScore: '4.7',
                                ratingFor: 'Application',
                              ),
                              SizedBox(width: 15.w),
                              const RatingScoreCard(
                                ratingScore: '4.7',
                                ratingFor: 'Quality',
                              ),
                              SizedBox(width: 15.w),
                              const RatingScoreCard(
                                ratingScore: '4.7',
                                ratingFor: 'Assurance',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          color: Colors.grey[200],
                          height: 1.5.h,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        // Add here Customer photo and review widget
                        CustomerReviewWidget(
                          onTap: () => Navigator.pushNamed(
                              context, '/reviewImages',
                              arguments: reviewImages),
                          imageUrl: reviewImages,
                          itemCountCustomerImage: 5,
                          customerName: 'Anonymous user',
                          customerCommentsWidget: ExpandableTextWidget(
                            text: text1,
                            defaultMaxLines: 2,
                          ),
                          reviewUsers: 5,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.23),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.text(
                            text: 'Check Availability',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 8.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0.r))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.check,
                                color: CustomColors.buttonGreen,
                                size: 20.sp,
                              ),
                              CustomText.text(
                                  text: 'From:',
                                  fontSize: 14.sp,
                                  color: CustomColors.mediumBlack,
                                  fontWeight: FontWeight.w400),
                              CustomText.text(
                                  text: '8 Jun 2023',
                                  fontSize: 14.sp,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400),
                              CustomText.text(
                                  text: 'To:',
                                  fontSize: 14.sp,
                                  color: CustomColors.mediumBlack,
                                  fontWeight: FontWeight.w400),
                              CustomText.text(
                                  text: '8 Jun 2023',
                                  fontSize: 14.sp,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400),
                              Icon(
                                Icons.calendar_month,
                                color: CustomColors.buttonGreen,
                                size: 24.sp,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.23),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 83.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1605993439219-9d09d2020fa5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzR8fHVzZXJ8ZW58MHx8MHx8fDA%3D',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText.text(
                                        text: 'Vendor',
                                        fontSize: 12.sp,
                                        color: CustomColors.mediumBlack,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      CustomText.text(
                                        text: 'Anonymous',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    CupertinoIcons.chat_bubble,
                                    color: CustomColors.buttonGreen,
                                    size: 22.sp,
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey[100],
                                height: 6,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CustomText.text(
                                          text: 'Ratings',
                                          fontSize: 14.sp,
                                          color: Colors.black54),
                                      Row(
                                        children: [
                                          CustomText.text(
                                            text: '4.93',
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          Icon(Icons.star,
                                              color: Colors.orange[200],
                                              size: 15.sp),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CustomText.text(
                                          text: 'Hoardings',
                                          fontSize: 14.sp,
                                          color: Colors.black54),
                                      CustomText.text(
                                        text: '213',
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CustomText.text(
                                          text: 'Bookings ',
                                          fontSize: 14.sp,
                                          color: Colors.black54),
                                      CustomText.text(
                                        text: '4.93',
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.info_outlined,
                          color: CustomColors.errorColor),
                      SizedBox(
                        width: 5.w,
                      ),
                      CustomTextBtn(
                        onPressed: () {},
                        text: 'Report hoarding',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        textColor: CustomColors.errorColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 105.h),
        ],
      ),
      bottomSheet: SingleChildScrollView(
        child: Container(
          // height: 220.h,
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 16.w),
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: CustomColors.grey,
              blurRadius: 6.0,
            )
          ]),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText.text(
                      text: 'Offered Price',
                      fontSize: 16.sp,
                      softWrap: true,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis),
                  Column(
                    children: [
                      CustomText.text(
                          text: 'Weekly',
                          fontSize: 12.sp,
                          softWrap: true,
                          color: CustomColors.mediumBlack,
                          overflow: TextOverflow.ellipsis),
                      CustomText.text(
                          text: '₹6,435',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Enquiry',
                      onTap: () {
                        Navigator.pushNamed(context, '/enquiryChat', arguments: 'Hoarding name');
                      },
                      width: size.width * 0.42,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 8.w,),
                  Expanded(
                    child: CustomButton(
                      text: 'Book Now',
                      onTap: () {
                        if (widget.hoardingType == 'Unipole - DOOH') {
                          Navigator.pushNamed(context, '/campaignScreen');
                        }
                        if (widget.hoardingType == 'Unipole - OOH') {
                          Navigator.pushNamed(context, '/selectDate');
                        }
                      },
                      width: size.width * 0.42,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
