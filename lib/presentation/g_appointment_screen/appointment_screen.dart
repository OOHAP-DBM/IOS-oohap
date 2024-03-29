import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:oohapp/presentation/g_appointment_screen/appointment_detail_screen.dart';
import 'package:oohapp/presentation/g_appointment_screen/widget/appointment_meeting.dart';
import 'package:oohapp/presentation/g_appointment_screen/widget/appointment_widget.dart';
import 'package:oohapp/presentation/g_appointment_screen/widget/empty_screen_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_appbar/detail_screen_app_bar.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  int _selectedIndex = -1;
  int _selectedIndex2 = -1;
  bool _emptyScreen = true;

  /// Join meeting function over here

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DetailScreenAppBar(
        title: 'Appointment',
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Column(
          children: [
            if (_emptyScreen)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: EmptyScreenWidget(
                    onTap: () {
                      setState(() {
                        _emptyScreen = false;
                      });
                    },
                    imageUrl: ImageConstant.baby,
                    buttonText: 'Explore Hoardings',
                    title: 'No Appointment found',
                    subTitle:
                        'No Scheduled meetings found, We encourage you to consider booking some advertising hoardings to boost your business and establish a stronger market presence.'),
              )
            else
              Column(
                children: [
                  SizedBox(
                    height: 90.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(12.r),
                                decoration: BoxDecoration(
                                    color: _selectedIndex == index
                                        ? CustomColors.buttonGreen
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(19.r),
                                    border: Border.all(
                                        color: _selectedIndex == index
                                            ? Colors.transparent
                                            : CustomColors.mediumBlack.withOpacity(0.3))),
                                child: CustomText.text(
                                    text: '1st \nJan',
                                    color: _selectedIndex == index
                                        ? Colors.white
                                        : CustomColors.mediumBlack,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppointmentWidget(
                          isShowDivider: true,
                          joinCall: () {},
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomText.text(
                            text: 'Upcoming Meetings',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600),
                        SizedBox(
                          height: 8.h,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex2 = index;
                                    });
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              AppointmentDetail(),
                                        ));
                                    /*    showModalBottomSheet(
                                      context: context,
                                      builder: (context) => AppointmentMeeting(
                                        remindMe: () {
                                          Navigator.pop(context);
                                          CustomSnackBar.showCustomSnackBar(
                                              context,
                                              'We will remind you after 30 min..',
                                              second: 3,
                                              backgroundColor: Colors.blue);
                                        },
                                        joinMeeting: () {
                                          Navigator.pop(context);
                                          _openMeetUrl(context);
                                        },
                                        copyMeetUrl: () {
                                          Navigator.pop(context);
                                          _copyMeetLink();
                                        },
                                        meetUrl: _meetUrl,
                                      ),
                                    );*/
                                  },
                                  child: AppointmentWidget(
                                    borderColor: _selectedIndex2 == index
                                        ? CustomColors.buttonGreen
                                        : Colors.transparent,
                                    isShowDivider: true,
                                    joinCall: () {},
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      )),
    );
  }
}
