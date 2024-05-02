
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/app_export.dart';

class HoardingDetailCardWidget extends StatefulWidget {
  final double? height;
  final List<String> imageUrl;
  final String numberOfImage;

  //final int? itemCount;

  //final int imageItemCount;
  final void Function(int) onPageChanged;

  const HoardingDetailCardWidget({
    super.key,
    this.height,
    required this.imageUrl,
    required this.numberOfImage,
    required this.onPageChanged,
  });

  @override
  State<HoardingDetailCardWidget> createState() =>
      _HoardingDetailCardWidgetState();
}

class _HoardingDetailCardWidgetState extends State<HoardingDetailCardWidget> {
  final PageController _pageController = PageController();

  List<String> getImageUrls(List<Map<String, dynamic>> data, List imageId) {
    List<String> imageUrls = [];
    for (var item in data) {
      imageUrls.add(item[imageId]);
    }
    return imageUrls;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 230.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.r),
                topLeft: Radius.circular(15.r),
              ),
            ),
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: widget.imageUrl.length,
                  onPageChanged: widget.onPageChanged,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomCachedNetworkImage(
                      imageUrl: widget.imageUrl[index],
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.r),
                            topLeft: Radius.circular(10.r),
                          ),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),

                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.w, vertical: 8.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircularButton(
                          onPressed: () {},
                          icon: Icons.favorite_border,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 3.h),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Text(
                            widget.numberOfImage,
                            style: TextStyle(
                                color: Colors.white, fontSize: 13.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: SmoothPageIndicator(

                      controller: _pageController,
                      count: widget.imageUrl.length,

                      effect: const WormEffect(
                          dotHeight: 12,
                          dotWidth: 12,
                          dotColor: Colors.white,
                          activeDotColor: CustomColors.buttonGreen),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
