import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../themes/custom_colors.dart';
import '../../../widgets/custom_buttons/circular_button.dart';
import '../../../widgets/custom_text.dart';

class ImagePickerDialog {
  static Future<void> show(
      BuildContext context, Function(ImageSource) onImageSelected) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomText.text(text: 'Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: CustomText.text(text: 'Gallery'),
                  onTap: () {
                    Navigator.of(context).pop();
                    onImageSelected(ImageSource.gallery);
                  },
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  child: CustomText.text(text: 'Camera'),
                  onTap: () {
                    Navigator.of(context).pop();
                    onImageSelected(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showBottomSheet(
      BuildContext context, Function(ImageSource) onImageSelected) async {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (BuildContext context) => SizedBox(
        height: 100.h,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.h),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                //color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(8.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Column(
                        children: [
                          CircularButton(
                            onPressed: () {
                              Navigator.pop(context);
                              onImageSelected(ImageSource.camera);
                            },
                            backgroundColor: Colors.deepPurple,
                            icon: Icons.camera_alt_outlined,
                            iconColor: Colors.white,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          CustomText.text(
                              text: 'Camera',
                              color: CustomColors.liteBlack,
                              fontSize: 12.sp),
                        ],
                      ),
                      SizedBox(width: 15.w),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          onImageSelected(ImageSource.gallery);
                        },
                        child: Column(
                          children: [
                            CircularButton(
                              onPressed: () {
                                Navigator.pop(context);
                                onImageSelected(ImageSource.gallery);
                              },
                              backgroundColor: CustomColors.buttonGreen,
                              icon: Icons.photo_size_select_actual_outlined,
                              iconColor: Colors.white,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            CustomText.text(
                                text: 'Gallery',
                                color: CustomColors.liteBlack,
                                fontSize: 12.sp),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
