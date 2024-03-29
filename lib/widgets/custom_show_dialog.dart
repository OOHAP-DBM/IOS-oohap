import 'package:flutter/services.dart';
import '../../core/app_export.dart';
import 'custom_buttons/custom_text_btn.dart';

class CustomShowDialog {
  static Future<dynamic> buildExitDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                      /* height: size.height * 0.5,
                        width: size.width * 0.5,*/
                      height: 30,
                      width: 30,
                      imagePath: ImageConstant.baby,
                      fit: BoxFit.contain),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'Confirm Exit..!!!',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Are you sure you,You want to exit',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          surfaceTintColor: CustomColors.inactiveButton,
          backgroundColor: CustomColors.inactiveButton,
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            OutlinedButton(
              onPressed: () async {
                await SystemNavigator.pop();
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  const Size(40, 30),
                ),
              ),
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //Navigator.of(context).pop();
                Navigator.of(context, rootNavigator: true).pop();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(42, 31),
                backgroundColor: CustomColors.buttonGreen,
                // Background color
                foregroundColor: Colors.black, // Text color
              ),
              child: const Text(
                'No',
              ),
            )
          ],
        );
      },
    );
  }

  static Future<dynamic> buildLogoutDialog(
      BuildContext context, void Function()? onPressed) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 200.h,
                  width: 200.w,
                  child: Image.asset(
                    ImageConstant.baby,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomText.text(text: 'Comeback Soon!'),
                SizedBox(
                  height: 2.h,
                ),
                CustomText.text(
                    text: 'Are you sure, You want to \nlogout?',
                    textAlign: TextAlign.center,
                    color: CustomColors.mediumBlack,
                    fontSize: 14.sp),
                SizedBox(
                  height: 10.h,
                ),
                CustomButton(
                  text: 'Yes logout',
                  onTap: onPressed,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextBtn(
                  text: 'Cancel',
                  textColor: CustomColors.buttonGreen,
                  onPressed: () =>
                      Navigator.of(context, rootNavigator: true).pop(),
                ),
              ],
            ),
          ),
          surfaceTintColor: CustomColors.inactiveButton,
          backgroundColor: CustomColors.inactiveButton,
          actionsAlignment: MainAxisAlignment.spaceBetween,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        );
      },
    );
  }

  static void showInfoBox(BuildContext context, String infoText, String title) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(title),
          content: SizedBox(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * 0.4,
            child: SingleChildScrollView(
              child: Text(
                infoText,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          actions: [
            CustomTextBtn(
              text: 'Close',
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            )
          ],
        );
      },
    );
  }

  static void showInfoBox1(BuildContext context, Widget child) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(child: child),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: CustomText.text(text: 'Close', fontSize: 16.5.sp),
            ),
          ],
        );
      },
    );
  }

  static void showTextField(BuildContext context, Widget child) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.20,
            child: SingleChildScrollView(child: child),
          ),
        );
      },
    );
  }

  static Future<void> alertBox(BuildContext context, Widget child,
      {bool barrierDismissible = true}) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0.r),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.40,
            child: Center(child: SingleChildScrollView(child: child)),
          ),
        );
      },
    );
  }

  static Future<void> decoratedAlertDialog(BuildContext context,
      {bool barrierDismissible = true,
      Widget? content,
      Widget? title,
      List<Widget>? action}) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.white.withOpacity(0.9),
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0.r),
          ),
          title: title,
          actions: action,
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: SingleChildScrollView(child: content)),
              ],
            ),
          ),
        );
      },
    );
  }
}
