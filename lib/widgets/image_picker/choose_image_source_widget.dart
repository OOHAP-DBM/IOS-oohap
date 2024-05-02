import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../themes/custom_colors.dart';
import '../../../widgets/custom_buttons/circular_button.dart';
import '../../../widgets/custom_text.dart';
import '../custom_buttons/new_circle_button.dart';

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

  static void uploadImage(
      BuildContext context, Function(ImageSource) onImageSelected) async {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SizedBox(
        height: 100.h,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: [
                  NewCircularButton(
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
                    NewCircularButton(
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
              /*   SizedBox(width: 15.w),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple[300],
                      ),
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(18.r),
                        child: Icon(
                          Icons.cancel,
                          size: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    CustomText.text(
                        text: 'Cancel',
                        color: CustomColors.liteBlack,
                        fontSize: 12.sp),
                  ],
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
