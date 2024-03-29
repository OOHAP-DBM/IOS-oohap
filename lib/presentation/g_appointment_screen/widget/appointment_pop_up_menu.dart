import 'package:flutter/cupertino.dart';
import 'package:oohapp/core/app_export.dart';
/*

class AppointmentPopUpMenu {
  static Widget menuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.0.w),
      child: ListTile(
        onTap: onTap,
        title: CustomText.text(text: label, color: Colors.black),
        trailing: Icon(
          icon,
          color: CustomColors.buttonGreen,
        ),
      ),
    );
  }
}
*/

class AppointmentPopUpMenu extends StatelessWidget {
  const AppointmentPopUpMenu(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.0.w),
      child: ListTile(
        onTap: onTap,
        title: CustomText.text(text: label, color: Colors.black),
        trailing: Icon(
          icon,
          color: CustomColors.buttonGreen,
        ),
      ),
    );
  }
}
