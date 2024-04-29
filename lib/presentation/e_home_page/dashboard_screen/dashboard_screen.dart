import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/core/constants/app_constant.dart';
import 'package:oohapp/presentation/e_home_page/dashboard_screen/sale_chart/sale_chart.dart';
import 'dummy_data/item_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //  backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: CustomSvgImageView(
          svgPath: ImageConstant.vendorLogoWithLeftAlign,
          fit: BoxFit.contain,
        ),
        actions: [
          CircularButton(
            onPressed: () {},
            icon: Icons.notifications_none,
            iconColor: CustomColors.blackColor,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CustomCircleImage(
              onTap: () {},
              imagePath: ImageConstant.baby,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
      /* body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: size.height * 0.22,
              width: size.width,

              color: CustomColors.liteGrey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.inputText(
                            text: "Grow your business with",
                            color: CustomColors.blackColor,
                            fontStyle: FontStyle.italic),
                        CustomText.inputText(
                            text: "OOHAPP!",
                            fontStyle: FontStyle.italic,
                            color: CustomColors.blackColor),
                        const SizedBox(
                          height: 10.0,
                        ),
                        CustomButton(
                            width: size.width * 0.40,
                            backgroundColor: CustomColors.buttonColor,
                            onTap: () {
                   Navigator.pushNamed(context, Routes.addhoardingScreen);

                              // CustomSnackBar(
                              //         color: Colors.redAccent,
                              //         text: 'Hording clicked',
                              //         second: 1,
                              //         icon: Icons.image)
                              //     .showSnackBar(context);
                            },
                            text: '+ Add Hoarding'),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.15,
                      width: size.width * 0.22,
                      child: CustomImageView(
                        fit: BoxFit.fill,
                        imagePath: ImageConstant.hoarding,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // List here

            */ /*  const SizedBox(
              height: 20,
            ),*/ /*
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    color: CustomColors.grey,

                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText.secondaryTitle(
                    text: 'Your Dashboard',
                    color: CustomColors.blackColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: itemList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: size.height * 0.07,
                            width: size.width,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            //color: Colors.red,
                            decoration: BoxDecoration(
                              color: itemColors[index % itemColors.length],
                              // borderRadius: BorderRadius.circular(8.0),
                          */ /*    border: Border.all(
                                color: CustomColors.blackColor,
                              ),*/ /*
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText.headlineText(
                                  text: itemList[index]['title'].toString(),
                                  color: CustomColors.blackColor,
                                ),
                                const Spacer(),
                                CustomText.headlineText(
                                  text: itemList[index]['value'].toString(),
                                  color: CustomColors.blackColor,
                                ),
                                const SizedBox(width: 10.0),
                                const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: CustomColors.blackColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  // Sale chart widget here *************
                  SaleChart(),
                ],
              ),
            ),
          ],
        ),
      ),*/

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.sunny,
                  color: Colors.orangeAccent,
                ),
                SizedBox(
                  width: 10.w,
                ),
                CustomText.text(
                    text: "${AppConstant.getTimeMessage()} Robert",
                    fontSize: 15.sp),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: size.width,
              child: DottedBorder(
                  color: CustomColors.inactiveButton,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText.text(
                            text: "No hoarding added", fontSize: 15.sp),
                        CustomButton(
                          onTap: () {},
                          width: size.width * 0.45,
                          fontSize: null,
                          text: '+ Add Hoarding',
                          backgroundColor: Colors.black,
                        )
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomText.text(text: "Your Dashboard", fontSize: 14.sp),
            SizedBox(height: 10.h),
            GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: itemList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 0.7,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    width: size.width * 0.35,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      //  color: containerColor,
                      color: itemColors[index % itemColors.length],
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.r),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.text(
                            text: itemList[index]['title'].toString(),
                            //    text: "Total\nEarnings",
                            fontSize: 14.sp),
                        SizedBox(height: 10.h),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: CustomText.text(
                                text: index == 0
                                    ? "₹ ${itemList[index]['value'].toString()}"
                                    : itemList[index]['value'].toString(),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                }),

            // Sale chart widget here *************
            /*  SizedBox(
              height: 10.h,
            ),*/
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: CustomText.text(
                        text: "Sales Summary", fontSize: 14.sp)),
                CustomText.text(text: "Weekly", fontSize: 13.sp),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.bar_chart_outlined),
                        SizedBox(
                          width: 5.w,
                        ),
                        CustomText.text(text: "10", fontSize: 15.sp)
                      ],
                    ),
                    CustomText.text(
                      text: "Total Sales",
                      fontSize: 12.sp,
                      color: CustomColors.liteBlack,
                    )
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.bar_chart_outlined),
                        SizedBox(
                          width: 5.w,
                        ),
                        CustomText.text(text: "2", fontSize: 15.sp)
                      ],
                    ),
                    CustomText.text(
                      text: "Avg. Sales per Day",
                      fontSize: 12.sp,
                      color: CustomColors.liteBlack,
                    )
                  ],
                ),
              ],
            ),

            //SaleChart(),
          ],
        ),
      ),
    );
  }
}
