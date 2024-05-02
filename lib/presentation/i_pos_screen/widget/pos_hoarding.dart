import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_buttons/new_circle_button.dart';
import '../../../widgets/custom_network_cache_image.dart';


class HoardingCards extends StatelessWidget {
  const HoardingCards(
      {super.key,
        this.imageUrl,
        this.hoardingPlace,
        this.hoardingType,
        this.hoardingLocation,
        this.hoardingPrice = '12,200',
        this.discountPrice = '15,200',
        this.ratingText,
        this.saveHoarding,
        this.newHoarding = 'New',
        this.topRated = 'Top Rated',
        this.totalRated,
        this.hoardingSize});

  final String? imageUrl;
  final String? hoardingPlace;
  final String? hoardingType;
  final String? hoardingLocation;
  final String? hoardingPrice;
  final String? discountPrice;
  final String? ratingText;
  final void Function()? saveHoarding;
  final String? newHoarding;
  final String? topRated;
  final String? totalRated;
  final String? hoardingSize;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        /// Stack
        Container(
          height: size.height * 0.25,
          //   width: size.width * 0.40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
          ),
          child: CustomCachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imageUrl ??
                'https://images.unsplash.com/photo-1711722221946-e271830d5081?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      newHoarding != null
                          ? Transform.translate(
                        offset: const Offset(-5, 0),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                AssetImage(ImageConstant.newBadge),
                              ),
                              shape: BoxShape.rectangle),
                          width: 45.w,
                          height: 15.h,
                          child: CustomText.text(
                              text: newHoarding!,
                              color: Colors.white,
                              fontSize: 9.sp,
                              textAlign: TextAlign.center),
                        ),
                      )
                          : const SizedBox(),
                      Padding(
                        padding:  EdgeInsets.only(top: 8.0.h, right: 5.w),
                        child: NewCircularButton(
                          iconSize: 16.w,
                          onPressed: saveHoarding!,
                          icon: Icons.bookmark_outline,
                          backgroundColor: Colors.black.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 14.w, bottom: 10.h),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            topRated != null
                                ? Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(10.r),
                                  gradient:
                                  const LinearGradient(colors: [
                                    Color(0xFFFC7373),
                                    Color(0xFFE75858),
                                  ])),
                              padding: EdgeInsets.only(
                                  left: 15.w,
                                  right: 15.w,
                                  top: 10.h,
                                  bottom: 20.h),
                              child: CustomText.text(
                                  text: topRated!,
                                  color: Colors.white,
                                  fontSize: 9.sp),
                            )
                                : const SizedBox(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.h, horizontal: 8.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomText.text(
                                      text: ratingText ?? '4.6',
                                      fontSize: 9.sp),
                                  Icon(
                                    Icons.star_outlined,
                                    color: Colors.green,
                                    size: 12.w,
                                  ),
                                  SizedBox(
                                    width: 28.w,
                                  ),
                                  CustomText.text(
                                      text: totalRated ?? '2.5K',
                                      fontSize: 9.sp),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.text(
                  text: hoardingPlace ?? 'Hazratganj Chauraha',
                  fontWeight: FontWeight.w600,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 13.sp),
              SizedBox(
                height: 2.h,
              ),
              CustomText.text(
                  text: hoardingLocation ?? 'Gomti Nagar Lucknow',
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  color: CustomColors.blackColor.withOpacity(0.5),
                  fontSize: 12.sp),
              SizedBox(
                height: 2.h,
              ),
              CustomText.text(
                  text: hoardingSize ?? '300*250Sq.ft',
                  color: CustomColors.buttonGreen,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12.sp),
              SizedBox(
                height: 2.h,
              ),
              CustomText.text(
                  text: '₹$hoardingPrice/Month',
                  fontWeight: FontWeight.w600,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 13.sp),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText.text(
                      text: '₹$discountPrice/Month',
                      fontWeight: FontWeight.w600,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      color: CustomColors.mediumGrey,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 10.sp),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                        color: Colors.red[100], shape: BoxShape.rectangle),
                    child: CustomText.text(
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        text: '₹3000 OFF!',
                        fontWeight: FontWeight.w600,
                        color: CustomColors.errorColor,
                        fontSize: 10.sp),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}




/*  SizedBox(
            height: size.height * 0.25,
            width:   size.width * 0.42,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  child: CachedNetworkImage(
                    height: size.height * 0.25,
                    width: size.width * 0.42,
                    fit: BoxFit.fill,
                    imageUrl: 'https://images.unsplash.com/photo-1711722221946-e271830d5081?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                ),
                Positioned(
                  top: 10.h,
                  left: -5,

                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageConstant.newBadge),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    width: 45.w,
                    height: 15.h,
                    child: CustomText.text(
                      text: 'New',
                      color: Colors.white,
                      fontSize: 9.sp,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 5.0.h, right: 3.0.w),
                    child: CircularButton(
                      iconSize: 16.w,
                      onPressed: () {},
                      icon: Icons.bookmark_outline,
                      backgroundColor: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ),


                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 14.w, bottom: 10.h),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(colors: [
                                    Color(0xFFFC7373),
                                    Color(0xFFE75858),
                                  ]),
                                ),
                                padding: EdgeInsets.only(
                                  left: 15.w,
                                  right: 15.w,
                                  top: 10.h,
                                  bottom: 20.h,
                                ),
                                child: CustomText.text(
                                  text: 'Top Rated',
                                  color: Colors.white,
                                  fontSize: 9.sp,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 1.h,
                                  horizontal: 3.w,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomText.text(
                                      text: '4.6',
                                      fontSize: 9.sp,
                                    ),
                                    Icon(
                                      Icons.star_outlined,
                                      color: Colors.green,
                                      size: 12.w,
                                    ),
                                    SizedBox(
                                      width: 28.w,
                                    ),
                                    CustomText.text(
                                      text: '2.5K',
                                      fontSize: 9.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      */