import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oohapp/presentation/g_appointment_screen/widget/appointment_meeting.dart';
import 'package:oohapp/presentation/g_appointment_screen/widget/appointment_pop_up_menu.dart';
import 'package:oohapp/widgets/custom_appbar/detail_screen_app_bar.dart';
import 'package:oohapp/widgets/custom_network_cache_image.dart';
import 'package:oohapp/widgets/custom_show_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_new_text_field.dart';

class AppointmentDetail extends StatefulWidget {
  const AppointmentDetail({super.key});

  @override
  State<AppointmentDetail> createState() => _AppointmentDetailState();
}

class _AppointmentDetailState extends State<AppointmentDetail> {
  String imageUrl =
      'https://images.unsplash.com/photo-1708616748538-bdd66d6a9e25?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  final String _textCopy = 'https://meet.google.com/ycp-yvjg-trj';

  Future<void> _openMeetUrl(BuildContext context) async {
    var url = Uri.parse(_textCopy);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
      if (context.mounted) {
        await CustomSnackBar.showCustomSnackBar(context, 'Opening browser...');
      }
    } else {
      if (context.mounted) {
        CustomSnackBar.showCustomSnackBar(context, 'Could not launch $url');
      }
      throw 'Could not launch $url';
    }
  }

  /// function for the copy meet link

  void _copyText() {
    Clipboard.setData(ClipboardData(text: _textCopy));
    CustomSnackBar.showCustomSnackBar(context, 'Url copied $_textCopy',
        second: 3, backgroundColor: Colors.blue);
  }

  /// Select date and time function

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = _selectedDate.toString();
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _timeController.text = _selectedTime.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //  backgroundColor: Colors.grey[200],
      appBar: const DetailScreenAppBar(
        title: 'Appointment',
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.text(
                  text: 'Booked Hoarding', fontWeight: FontWeight.w600),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 180.h,
                width: size.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: const ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: CustomCachedNetworkImage(
                      imageUrl:
                          'https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  CustomText.text(text: 'Hazratganj Chauraha', fontSize: 15.sp),
                  Spacer(),
                  Icon(
                    Icons.star_outlined,
                    size: 17.w,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  CustomText.text(
                    text: '4.5',
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText.text(
                    text: '(240)',
                  ),
                ],
              ),
              CustomText.text(
                  text: 'Gomti Nagar, Lucknow',
                  fontSize: 12.sp,
                  color: CustomColors.mediumGrey),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.assistant_photo_outlined,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  CustomText.text(
                      text: 'Gomti Nagar, Lucknow',
                      fontSize: 12.sp,
                      color: CustomColors.supportiveColor),
                ],
              ),
              SizedBox(height: 10.h),
              AppointmentMeeting(
                remindMe: () {
                  CustomSnackBar.showCustomSnackBar(
                      context, 'We will remind you after 30 min..',
                      second: 3, backgroundColor: Colors.blue);
                },
                joinMeeting: () {
                  _openMeetUrl(context);
                },
                copyMeetUrl: () {
                  _copyText();
                },
                meetUrl: _textCopy,
                moreButton: () {

                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      context: context,
                      builder: (context) => Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 8.h),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppointmentPopUpMenu(
                                      icon: CupertinoIcons.square_on_square,
                                      label: 'Copy link',
                                      onTap: () {
                                        _copyText();
                                        Navigator.pop(context);
                                      }),
                                  AppointmentPopUpMenu(
                                      icon: Icons.calendar_today_outlined,
                                      label: 'Reschedule meeting',
                                      onTap: () {
                                        CustomShowDialog.decoratedAlertDialog(
                                          context,
                                          content: Column(children: [
                                            Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    icon:
                                                    const Icon(Icons.close)),
                                                Expanded(
                                                  child: CustomText.text(
                                                      text: 'Reschedule Meeting',
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                      FontWeight.w400)
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 7.h,
                                            ),
                                            Container(
                                              color: Colors.black12,
                                              height: 1.5.h,
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 8.w),
                                              child: Column(
                                                children: [
                                                  CustomText.text(
                                                      text:
                                                      'Select Preferred Meeting Date & time.',
                                                      fontWeight: FontWeight.w400, fontSize: 14.sp),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  CustomNewTextFormField(
                                                    onTap: () => _selectDate(context),
                                                    controller: _dateController,
                                                    contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 12.h),
                                                    hintText: 'DD-MM-YYYY',
                                                    suffixIcon: Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: 8.0.w),
                                                      child: Icon(
                                                        Icons.calendar_month, color: Colors.blue,size: 22.w,),
                                                    ),
                                                    readOnly: true,
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  CustomNewTextFormField(
                                                    onTap: () => _selectTime(context),
                                                    contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 12.h),
                                                    hintText: 'HH:MM:SS',
                                                    suffixIcon: Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: 8.0.w),
                                                      child:  Icon(
                                                        Icons.access_time, color: Colors.blue,size: 22.w,),
                                                    ),
                                                    readOnly: true,
                                                    controller: _timeController,
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  CustomButton(
                                                    onTap: (){
                                                      Navigator.pop(context);
                                                    },
                                                    text: 'Send Request',
                                                    backgroundColor: CustomColors.buttonColor,
                                                  )
                                                ],
                                              ),
                                            ),

                                          ]),
                                        );
                                        //  Navigator.pop(context);
                                      }),
                                  AppointmentPopUpMenu(
                                      icon: Icons.calendar_today_outlined,
                                      label: 'Add to calender',
                                      onTap: () {
                                        Navigator.pop(context);
                                      }),
                                  AppointmentPopUpMenu(
                                      icon: CupertinoIcons.info,
                                      label: 'Help',
                                      onTap: () {
                                        Navigator.pop(context);
                                      }),
                                ],
                              ),
                            ),
                          ));
                },
              ),
            ],
          )),
    );
  }
}
