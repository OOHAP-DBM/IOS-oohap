import 'package:flutter/cupertino.dart';
import 'package:oohapp/widgets/custom_appbar/detail_screen_app_bar.dart';
import 'package:oohapp/widgets/custom_bottom_model_sheet.dart';
import 'package:oohapp/widgets/custom_buttons/custom_text_btn.dart';
import 'package:oohapp/widgets/custom_network_cache_image.dart';
import 'package:oohapp/widgets/custom_show_dialog.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_sheet.dart';
import '../../widgets/custom_new_text_field.dart';
import '../f_my_hoarding_screen/widget/search_text_field.dart';

class MyStaffScreen extends StatefulWidget {
  const MyStaffScreen({super.key});

  @override
  State<MyStaffScreen> createState() => _MyStaffScreenState();
}

class _MyStaffScreenState extends State<MyStaffScreen> {
  final int _totalStaff = 10;
  bool _isStaffAvailable = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //  backgroundColor: Colors.grey[200],
      appBar: DetailScreenAppBar(
        title: 'My Staff',
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 16.0.w),
              child: CustomTextBtn(
                  onPressed: () {},
                  text: '+ Add New',
                  textColor: CustomColors.buttonGreen))
        ],
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 200.h,
                      width: size.width,
                      child: CustomCachedNetworkImage(
                          imageUrl:
                              'https://images.unsplash.com/photo-1552581234-26160f608093?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomText.text(text: 'No Staff Added'),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButton(
                    width: size.width * 0.60,
                    onTap: () {},
                    backgroundColor: CustomColors.buttonColor,
                    text: '+ Add Staff',
                  )
                ],
              ),*/

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.75,
                    child: SearchTextField(
                      hintText: 'Search Staff by name position',
                      borderRadius: 30.r,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  Container(
                    width: size.width * 0.13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: IconButton(
                      color: const Color(0xFF282C3E),
                      onPressed: () {
                        int selectedDateValue = -1;
                        CustomBottomModelSheet.showSheet(context, [
                          StatefulBuilder(
                            builder: (BuildContext context,
                                void Function(void Function())
                                updateWidget) =>
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText.text(
                                      text: 'Sort By',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        ActionChip(
                                          avatar: Icon(
                                            selectedDateValue == 0
                                                ? Icons.radio_button_checked
                                                : Icons.radio_button_off,
                                            color: selectedDateValue == 0
                                                ? CustomColors.buttonGreen
                                                : CustomColors.grey,
                                            size: 22.w,
                                          ),
                                          label: CustomText.text(
                                              text: 'Supervisor',
                                              color: CustomColors.buttonColor),
                                          onPressed: () => updateWidget(() {
                                            selectedDateValue == 0;
                                          }),
                                          backgroundColor: Colors.transparent,
                                          side: const BorderSide(
                                              color: Colors.transparent),
                                          padding: EdgeInsets.only(right: 10.w),
                                        ),
                                        SizedBox(
                                          height: 7.h,
                                        ),
                                        Container(
                                          color: Colors.grey[200],
                                          height: 1.5.h,
                                        ),
                                        ActionChip(
                                          avatar: Icon(
                                            selectedDateValue == 1
                                                ? Icons.radio_button_checked
                                                : Icons.radio_button_off,
                                            color: selectedDateValue == 1
                                                ? CustomColors.buttonGreen
                                                : CustomColors.grey,
                                            size: 22.w,
                                          ),
                                          label: CustomText.text(
                                              text: 'Manager',
                                              color: CustomColors.buttonColor),
                                          onPressed: () => updateWidget(() {
                                            selectedDateValue == 1;
                                          }),
                                          backgroundColor: Colors.transparent,
                                          side: const BorderSide(
                                              color: Colors.transparent),
                                          padding: EdgeInsets.only(right: 10.w),
                                        ),
                                        SizedBox(
                                          height: 7.h,
                                        ),
                                        Container(
                                          color: Colors.grey[200],
                                          height: 1.5.h,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: CustomButton(
                                        onTap: () => Navigator.pop(context),
                                        text: 'Apply',
                                        width: size.width * 0.35,
                                        backgroundColor: CustomColors.buttonColor,
                                      ),
                                    ),
                                  ],
                                ),
                          ),
                        ]);
                     /*   CustomShowDialog.decoratedAlertDialog(
                          context,
                          content: StatefulBuilder(
                            builder: (BuildContext context,
                                    void Function(void Function())
                                        updateWidget) =>
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText.text(
                                      text: 'Sort By',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ActionChip(
                                          avatar: Icon(
                                            selectedDateValue == 0
                                                ? Icons.radio_button_checked
                                                : Icons.radio_button_off,
                                            color: selectedDateValue == 0
                                                ? CustomColors.buttonGreen
                                                : CustomColors.grey,
                                            size: 22.w,
                                          ),
                                          label: CustomText.text(
                                              text: 'Supervisor',
                                              color: CustomColors.buttonColor),
                                          onPressed: () => updateWidget(() {
                                            selectedDateValue == 0;
                                          }),
                                          backgroundColor: Colors.transparent,
                                          side: const BorderSide(
                                              color: Colors.transparent),
                                          padding: EdgeInsets.only(right: 10.w),
                                        ),
                                        SizedBox(
                                          height: 7.h,
                                        ),
                                        Container(
                                          color: Colors.grey[200],
                                          height: 1.5.h,
                                        ),
                                        ActionChip(
                                          avatar: Icon(
                                            selectedDateValue == 1
                                                ? Icons.radio_button_checked
                                                : Icons.radio_button_off,
                                            color: selectedDateValue == 1
                                                ? CustomColors.buttonGreen
                                                : CustomColors.grey,
                                            size: 22.w,
                                          ),
                                          label: CustomText.text(
                                              text: 'Manager',
                                              color: CustomColors.buttonColor),
                                          onPressed: () => updateWidget(() {
                                            selectedDateValue == 1;
                                          }),
                                          backgroundColor: Colors.transparent,
                                          side: const BorderSide(
                                              color: Colors.transparent),
                                          padding: EdgeInsets.only(right: 10.w),
                                        ),
                                        SizedBox(
                                          height: 7.h,
                                        ),
                                        Container(
                                          color: Colors.grey[200],
                                          height: 1.5.h,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: CustomButton(
                                        onTap: () => Navigator.pop(context),
                                        text: 'Apply',
                                        width: size.width * 0.35,
                                        backgroundColor: CustomColors.buttonColor,
                                      ),
                                    ),
                                  ],
                                ),
                          ),
                        );*/
                      },
                      icon: const Icon(Icons.filter_alt_outlined),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomText.text(text: 'All Staff: $_totalStaff'),
              SizedBox(
                height: 10.h,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _totalStaff,
                  itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0.h),
                        child: ListTile(
                          leading: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: const ClipOval(
                              child: CustomCachedNetworkImage(
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      'https://images.unsplash.com/photo-1552581234-26160f608093?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                            ),
                          ),
                          title: CustomText.text(
                              text: 'Peter Parks', fontWeight: FontWeight.w600),
                          subtitle: CustomText.text(
                              text: 'Supervisor',
                              color: CustomColors.mediumBlack),
                          onTap: () {},
                          tileColor: Colors.grey.withOpacity(0.1),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.w),
                          visualDensity: const VisualDensity(vertical: 1),
                        ),
                      ))
            ],
          )),
    );
  }
}
