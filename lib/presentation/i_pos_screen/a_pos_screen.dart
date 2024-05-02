import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:oohapp/presentation/i_pos_screen/dooh_pages/b_dooh_book_detail_screen.dart';
import 'package:oohapp/presentation/i_pos_screen/widget/grid_border.dart';
import 'package:oohapp/presentation/i_pos_screen/widget/hoarding_category.dart';
import 'package:oohapp/presentation/i_pos_screen/widget/pos_hoarding.dart';
import 'package:oohapp/presentation/j_hoarding_detail_screen/hoarding_detail_screen.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_appbar/detail_screen_app_bar.dart';
import '../../widgets/custom_buttons/new_circle_button.dart';
import 'cubit/saved_hoarding.dart';
import 'model/hoarding_dummy_data.dart';

class PosScreen extends StatefulWidget {
  const PosScreen({super.key});

  @override
  State<PosScreen> createState() => _PosScreenState();
}

class _PosScreenState extends State<PosScreen> {
  late final bool isSaved;

  /// Grid hoarding index
  int selectedIndex = -1;

  /// Get hoarding category name
  String hoardingCategoryName = '';

  bool showShimmer = false;
  bool showSearchBar = false;
  Timer? shimmerTimer;

  // int _currentImagePage = 0;

  void startLoadingShimmerEffect() {
    shimmerTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        showShimmer = true;
      });
    });
  }

  void selectIndex(int index, String selectedHoardingName) {
    setState(() {
      selectedIndex = index;
      hoardingCategoryName = selectedHoardingName;
    });
  }

  void toggleSearchBar() {
    setState(() {
      showSearchBar = !showSearchBar;
    });
  }

  @override
  void initState() {
    startLoadingShimmerEffect();
    super.initState();
  }

  @override
  void dispose() {
    shimmerTimer?.cancel();
    super.dispose();
  }

  final PageController _pageController = PageController();

  // ********* This function is for the add image in empty list ***** /////

  final List<int> _currentImagePages =
      List.filled(oohHoardingDummyData.length, 0);

  List<String> getImageUrls(List<Map<String, dynamic>> data) {
    List<String> imageUrls = [];
    for (var item in data) {
      imageUrls.add(item['imageUrl']);
    }
    return imageUrls;
  }

  /// Ooh and dooh card
  int _hoardingType = 0;
  String _hoardingName = 'OOH';

  /// Change grid border
  bool _showGridItems = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: DetailScreenAppBar(
        title: 'POS Dashboard',
        actions: [
          NewCircularButton(
            backgroundColor: Colors.transparent,
            onPressed: () {},
            icon: Icons.shopping_cart,
            iconColor: const Color(0xFF282C3E),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _hoardingType = 0;
                          _hoardingName = 'OOH';
                        });
                      },
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 10.h),
                        decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            // color: Colors.pink[200],
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: _hoardingType == 0
                                    ? CustomColors.supportiveColor
                                    : Colors.transparent,
                                width: 1.5)),
                        child: Row(
                          children: [
                            Image.asset(
                              ImageConstant.buildings,
                              width: 30.w,
                              height: 50.h,
                            ),
                            SizedBox(
                              width: 40.w,
                            ),
                            CustomText.text(
                                text: 'OOH', fontWeight: FontWeight.w600)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _hoardingType = 1;
                          _hoardingName = 'DOOH';
                        });
                      },
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 10.h),
                        decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            // color: Colors.pink[200],
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: _hoardingType == 1
                                    ? CustomColors.supportiveColor
                                    : Colors.transparent,
                                width: 1.5)),
                        child: Row(
                          children: [
                            Image.asset(
                              ImageConstant.overBridge,
                              width: 30.w,
                              height: 50.h,
                            ),
                            SizedBox(
                              width: 40.w,
                            ),
                            CustomText.text(
                                text: 'DOOH', fontWeight: FontWeight.w600)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: CustomPaint(
                painter: GridBorderCustomPainter(
                  _showGridItems
                      ? CustomColors.supportiveColor
                      : Colors.transparent,
                  const Color(0xFFF5F5F5),
                  // Colors.black12
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.h),
                  child: Column(
                    children: [
                      GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 5.0,
                                mainAxisSpacing: 5.0),
                        itemCount: _showGridItems ? categories.length : 4,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              selectIndex(index, categories[index].text);
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  child: ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      selectedIndex == index
                                          ? Colors.transparent.withOpacity(0.2)
                                          : Colors.transparent.withOpacity(0.0),
                                      BlendMode.srcATop,
                                    ),
                                    child: Image.asset(categories[index].image,
                                        height: 30.h, width: 30.w),
                                  ),
                                ),
                                SizedBox(height: 8.0.h),
                                Expanded(
                                  child: CustomText.text(
                                    text: categories[index].text,
                                    fontSize: 11.sp,
                                    color: selectedIndex == index
                                        ? Colors.black
                                        : Colors.grey,
                                  ),
                                ),
                                if (selectedIndex == index)
                                  Container(
                                    color: Colors.black45,
                                    height: 1.5.h,
                                    width: 40.w,
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                      CircularButton(
                          backgroundColor: Colors.transparent,
                          iconColor: CustomColors.supportiveColor,
                          onPressed: () {
                            setState(() {
                              _showGridItems = !_showGridItems;
                            });
                          },
                          icon: _showGridItems
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            showShimmer
                ? Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomText.text(
                                text: '$_hoardingName-$hoardingCategoryName',
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600),
                            CustomText.text(
                                fontSize: 14.sp,
                                text: _hoardingType == 0
                                    ? ' (${oohHoardingDummyData.length})'
                                    : ' (${doohHoardingDummyData.length})',
                                color: CustomColors.mediumGrey,
                                fontWeight: FontWeight.w400),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        BlocBuilder<SavedHoardingCubit, SavedHoardingState>(
                          builder: (context, state) {
                            if (_hoardingType == 0) {
                              return DynamicHeightGridView(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 12.0,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: oohHoardingDummyData.length,
                                builder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      /*   if (_hoardingName == 'OOH') {
                                        Navigator.pushNamed(
                                          context,
                                          '/hoardingDetail',
                                          arguments: oohHoardingDummyData[index]
                                              ['hoardingType'],
                                        );
                                      } else {
                                        Navigator.pushNamed(
                                          context,
                                          '/hoardingDetail',
                                          arguments: oohHoardingDummyData[index]
                                              ['hoardingType'],
                                        );
                                      }*/

                                      if (_hoardingName == 'OOH') {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                              builder: (context) =>
                                                  HoardingDetailScreen(
                                                hoardingType:
                                                    oohHoardingDummyData[index]
                                                        ['hoardingType'],
                                              ),
                                            ));
                                      } else {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                              builder: (context) =>
                                                  HoardingDetailScreen(
                                                hoardingType:
                                                    oohHoardingDummyData[index]
                                                        ['hoardingType'],
                                              ),
                                            ));
                                      }

                                      /*  Navigator.pushNamed(
                                  context,
                                  '/hoardingDetail',
                                  arguments: oohHoardingDummyData[index]
                                  ['hoardingType'],
                                );*/
                                    },
                                    child: HoardingCards(
                                      topRated: (index == 1 || index == 3)
                                          ? 'Top Rated'
                                          : null,
                                      newHoarding: (index == 0 || index == 3)
                                          ? 'New'
                                          : null,
                                      hoardingPrice: oohHoardingDummyData[index]
                                          ['hoardingPrice'],
                                      discountPrice: oohHoardingDummyData[index]
                                          ['discountPrice'],
                                      imageUrl: oohHoardingDummyData[index]
                                          ['imageUrl'],
                                      hoardingPlace: oohHoardingDummyData[index]
                                          ['hoardingLocation'],
                                      hoardingLocation:
                                          oohHoardingDummyData[index]
                                              ['hoardingCity'],
                                      ratingText: oohHoardingDummyData[index]
                                          ['ratingText'],
                                      hoardingType: oohHoardingDummyData[index]
                                          ['hoardingType'],
                                      saveHoarding: () {},
                                    ),
                                  );
                                },
                              );
                            } else {
                              return DynamicHeightGridView(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 12.0,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: doohHoardingDummyData.length,
                                builder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      /*  if (_hoardingName == 'OOH') {
                                        Navigator.pushNamed(
                                          context,
                                          '/hoardingDetail',
                                          arguments: oohHoardingDummyData[index]
                                              ['hoardingType'],
                                        );
                                      } else {
                                        Navigator.pushNamed(
                                          context,
                                          '/hoardingDetail',
                                          arguments: oohHoardingDummyData[index]
                                              ['hoardingType'],
                                        );
                                      }*/

                                      /*  Navigator.pushNamed(
                                        context,
                                        '/hoardingDetail',
                                        arguments: doohHoardingDummyData[index]
                                            ['hoardingType'],
                                      );*/

                                      if (_hoardingName == 'OOH') {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                              builder: (context) =>
                                                  HoardingDetailScreen(
                                                hoardingType:
                                                    oohHoardingDummyData[index]
                                                        ['hoardingType'],
                                              ),
                                            ));
                                      } else {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                              builder: (context) =>
                                                  HoardingDetailScreen(
                                                hoardingType:
                                                    oohHoardingDummyData[index]
                                                        ['hoardingType'],
                                              ),
                                            ));
                                      }
                                    },
                                    child: HoardingCards(
                                      topRated: (index == 1 || index == 3)
                                          ? 'Top Rated'
                                          : null,
                                      newHoarding: (index == 0 || index == 3)
                                          ? 'New'
                                          : null,
                                      hoardingPrice:
                                          doohHoardingDummyData[index]
                                              ['hoardingPrice'],
                                      discountPrice:
                                          doohHoardingDummyData[index]
                                              ['discountPrice'],
                                      imageUrl: doohHoardingDummyData[index]
                                          ['imageUrl'],
                                      hoardingPlace:
                                          doohHoardingDummyData[index]
                                              ['hoardingLocation'],
                                      hoardingLocation:
                                          doohHoardingDummyData[index]
                                              ['hoardingCity'],
                                      ratingText: doohHoardingDummyData[index]
                                          ['ratingText'],
                                      hoardingType: doohHoardingDummyData[index]
                                          ['hoardingType'],
                                      saveHoarding: () {},
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  )
                //     : const DashboardCardShimmerWidget(),

                : SizedBox(
                    height: 7.h,
                  ),
          ],
        ),
      ),
    );
  }
}
