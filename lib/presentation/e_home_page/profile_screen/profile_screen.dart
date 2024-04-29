import 'package:flutter/cupertino.dart';
import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/presentation/e_home_page/profile_screen/list_builder/list_options.dart';
import 'package:oohapp/presentation/g_appointment_screen/appointment_screen.dart';
import 'package:oohapp/presentation/h_my_staff_screen/my_staff.dart';
import 'package:oohapp/presentation/h_my_staff_screen/staff_creation.dart';
import 'package:oohapp/widgets/custom_buttons/custom_text_btn.dart';

import '../../h_my_staff_screen/manage_permission_screen/manage_permission_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final ProfileMenu profileMenu = ProfileMenu();

  bool _expandMyStaff = false;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircularButton(
              onPressed: () {},
              icon: Icons.notifications_none,
              iconColor: CustomColors.blackColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.secondaryTitle(
                      text: 'Digital Brain Media', textAlign: TextAlign.start),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.inputText(
                          text: 'digital@gmail.com',
                          textAlign: TextAlign.start),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: CustomColors.grey,
            ),
            /*  ListTile(
              title: CustomText.headlineText(
                  text: 'My Bookings', textAlign: TextAlign.start),
              leading: const Icon(Icons.paste),
            ),*/
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: ListView.builder(
                itemCount: profileMenu.profileMenuComponents.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (index == 0) {
                        Navigator.pushNamed(context, Routes.myBooking);
                      }
                      if (index == 1) {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const MyStaffScreen(),
                            ));
                      }
                      if (index == 3) {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const AppointmentScreen(),
                            ));
                      }
                    },
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(profileMenu.profileMenuComponents[index]
                                  ['icon']),
                              SizedBox(
                                width: 15.0.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText.headlineText(
                                      text: profileMenu
                                              .profileMenuComponents[index]
                                          ['title']),
                                  if (index == 1 && _expandMyStaff)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomTextBtn(
                                            onPressed: () {

                                            },
                                            text: '● All Staff',
                                            fontWeight: FontWeight.w500,
                                            textColor: Colors.black),
                                        CustomTextBtn(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                    builder: (context) => const StaffCreation(),
                                                  ));
                                            },
                                            text: '● Add Staff',
                                            fontWeight: FontWeight.w500,
                                            textColor: Colors.black),
                                        CustomTextBtn(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                    builder: (context) => const ManagePermissionsScreen(),
                                                  ));
                                            },
                                            text: '● Manage Roles & Permission',
                                            fontWeight: FontWeight.w500,
                                            textColor: Colors.black),
                                      ],
                                    )
                                ],
                              ),
                              const Spacer(),
                              if (index == 1)
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.0.w),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _expandMyStaff = !_expandMyStaff;
                                        });
                                        _controller.forward(from: 0.0);
                                      },
                                      borderRadius: BorderRadius.circular(50),
                                      splashColor: Colors.green.withOpacity(0.5),
                                      child: AnimatedBuilder(
                                        animation: _controller,
                                        builder: (context, child) {
                                          return Transform.rotate(
                                            angle: _controller.value *
                                                (180 * 0.0174533),
                                            // Convert degrees to radians
                                            child: child,
                                          );
                                        },
                                        child: Icon(
                                          key: ValueKey(_expandMyStaff),
                                          _expandMyStaff
                                              ? Icons.keyboard_arrow_down_sharp
                                              : Icons.keyboard_arrow_up_sharp,
                                          size: 30.w,
                                        ),
                                      ),
                                    ),
                                  ),
                            ],
                          ),
                        ),
                        if (index <
                            profileMenu.profileMenuComponents.length - 1)
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 40.0.w, top: 2.0.h),
                              child: const Divider(
                                color: CustomColors.grey,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: CustomText.text(
                  text: 'v1.0', fontSize: 10.sp, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
