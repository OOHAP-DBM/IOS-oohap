import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:oohapp/presentation/h_my_staff_screen/cubit/upload_image_cubit.dart';
import 'package:oohapp/widgets/custom_appbar/detail_screen_app_bar.dart';
import 'package:oohapp/widgets/custom_buttons/custom_text_btn.dart';
import 'package:oohapp/widgets/custom_dropdown.dart';
import 'package:oohapp/widgets/custom_new_text_field.dart';
import 'package:oohapp/widgets/phone_number_text_field.dart';
import '../../core/app_export.dart';
import '../../core/waste_work/validator_regex.dart';
import '../../widgets/custom_buttons/custom_outline_button.dart';
import '../../widgets/custom_network_cache_image.dart';
import '../../widgets/date_picker/date_picker.dart';
import '../../widgets/helper/auto_close_dialog.dart';
import '../../widgets/helper/rotate_icon_button.dart';
import '../../widgets/image_picker/choose_image_source_widget.dart';

class StaffCreation extends StatefulWidget {
  const StaffCreation({super.key});

  @override
  State<StaffCreation> createState() => _StaffCreationState();
}

class _StaffCreationState extends State<StaffCreation> {
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _passwordGenerateController =
      TextEditingController();

  File? imageFile;
  final imagePicker = ImagePicker();

  // Function for the open dob Alert box for the select dob in dob text field

  Future<void> _updateEvent() async {
    DateTime? pickedEvent = await DatePickerController.pickDob(context);

    if (pickedEvent != null && pickedEvent != DateTime.now()) {
      _dobController.text =
          "${pickedEvent.month}/${pickedEvent.day}/${pickedEvent.year}";
    }
  }

  void disableTextField(bool readOnly) {
    true;
  }

  Future _selectUserProfile() async {
    ImagePickerDialog.showBottomSheet(
      context,
      (ImageSource source) async {
        final pickedImageProfile = await imagePicker.pickImage(source: source);

        if (pickedImageProfile != null) {
          if (mounted) {
            imageFile = File(pickedImageProfile.path);
            context.read<ImageCubit>().setSelectedImage(imageFile);
            CustomSnackBar.showCustomSnackBar(
                context, 'Profile updated successfully');
          }
        } else {
          if (mounted) {
            CustomSnackBar.showCustomSnackBar(context, 'Image not selected');
          }
        }
      },
    );
  }

  /// For Expand text field

  bool _expandAddress = false;
  bool _expandLocation = false;
  bool _expandPassword = false;

  /// For assign text field
  String? addressText;

  /// function for the copy meet link
  String _generatedPassword = 'dw3GJ4&*%#@GIh1r';

  void _copyMeetLink() {
    Clipboard.setData(ClipboardData(text: _generatedPassword));
    CustomSnackBar.showCustomSnackBar(
        context, 'Password copied $_generatedPassword',
        second: 3, backgroundColor: Colors.blue);
  }

  /// Function for generate password

  String generateRandomPassword() {
    const String validChars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789&*%#@!';

    final random = Random();
    String newPassword = '';
    for (int i = 0; i < 16; i++) {
      newPassword += validChars[random.nextInt(validChars.length)];
    }
    return newPassword;
  }

  /// Function for generate password

  void generatePassword() {
    setState(() {
      _generatedPassword = generateRandomPassword();
      _passwordGenerateController.text = _generatedPassword!;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //  backgroundColor: Colors.grey[200],
      appBar: const DetailScreenAppBar(title: 'Staff Creation'),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: BlocBuilder<ImageCubit, File?>(
                        builder: (context, imageFile) {
                          return ClipOval(
                              //  borderRadius: BorderRadius.circular(8.r),
                              child: imageFile == null
                                  ? const CustomCachedNetworkImage(
                                      imageUrl:
                                          'https://images.unsplash.com/photo-1712979242076-76fcc6630005?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
                                  : Image.file(
                                      imageFile,
                                      fit: BoxFit.cover,
                                    ));
                        },
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(4, 5.0),
                      child: CircularOutlineButton(
                        backgroundColor: Colors.white,
                        onPressed: _selectUserProfile,
                        icon: Icons.camera_alt_outlined,
                        //   backgroundColor: Colors.white,
                        borderColor: CustomColors.mediumBlack,
                        iconColor: CustomColors.mediumBlack,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                const CustomNewTextFormField(
                  placeholder: 'First Name',
                  starText: '*',
                  hintText: 'Prashant',
                ),
                SizedBox(
                  height: 8.h,
                ),
                const CustomNewTextFormField(
                  placeholder: 'Last Name',
                  starText: '*',
                  hintText: 'Singh',
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomDropdown(
                        width: size.width * 0.40,
                        placeholder: 'Gender',
                        startText: '*',
                        items: ['Male', 'Female'],
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        width: size.width * 0.40,
                        onTap: _updateEvent,
                        controller: _dobController,
                        keyboardType: TextInputType.datetime,
                        placeholder: 'Date of birth',
                        hintText: 'Enter date of birth',
                        readOnly: true,
                        maxLines: 1,
                        isDense: true,
                        // contentPadding: EdgeInsets.zero,
                        suffixIcon: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.calendar_today_outlined,
                            color: CustomColors.buttonColor,
                            size: 20,
                          ),
                        ),
                        //   onChanged: (value) => cubit.onChangedDob(value),
                        //validator: (value) => ValidatorRegex.dobValidator(value),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomDropdown(
                  width: size.width,
                  placeholder: 'Role',
                  startText: '*',
                  items: const ['Mounter', 'Printer', 'Graphics'],
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 8.h,
                ),
                const CustomNewTextFormField(
                  placeholder: 'Email',
                  starText: '*',
                  hintText: 'abc@gmail.com',
                ),
                SizedBox(
                  height: 8.h,
                ),
                // Phone number text field
                CustomPhoneNumberTextField(
                    //controller: ,
                    ),

                SizedBox(
                  height: 10.h,
                ),
                Divider(
                    color: CustomColors.mediumBlack.withOpacity(0.3),
                    height: 1,
                    thickness: 0.7),
                SizedBox(
                  height: 8.h,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomText.text(
                              text: 'Address',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: CustomColors.buttonColor),
                        ),
                        RotatingIconButton(
                          isExpanded: _expandAddress,
                          onTap: () {
                            setState(() {
                              _expandAddress = !_expandAddress;
                            });
                          },
                        ),
                      ],
                    ),
                    _expandAddress
                        ? Column(
                            children: [
                              SizedBox(
                                height: 8.h,
                              ),
                              const CustomNewTextFormField(
                                placeholder: 'Street Address',
                                starText: '*',
                                hintText: 'Vikas Nagar',
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              const CustomNewTextFormField(
                                placeholder: 'Pincode',
                                starText: '*',
                                hintText: '226018',
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              CustomDropdown(
                                width: size.width,
                                placeholder: 'City',
                                startText: '*',
                                items: const [
                                  'Lucknow',
                                  'Mumbai',
                                  'Kolkata',
                                  'Surat'
                                ],
                                onChanged: (value) {},
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              CustomDropdown(
                                width: size.width,
                                placeholder: 'State',
                                startText: '*',
                                items: const [
                                  'Uttar Pradesh',
                                  'Uttarakhand',
                                  'Madhya Pradesh',
                                  'Gujarat'
                                ],
                                onChanged: (value) {},
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              CustomDropdown(
                                width: size.width,
                                placeholder: 'Country',
                                startText: '*',
                                items: const [
                                  'India',
                                  'Switzerland',
                                  'France',
                                  'China'
                                ],
                                onChanged: (value) {},
                              ),
                            ],
                          )
                        : const SizedBox.shrink()
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                    color: CustomColors.mediumBlack.withOpacity(0.3),
                    height: 1,
                    thickness: 0.7),
                SizedBox(
                  height: 8.h,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomText.text(
                              text: 'Assign Location',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: CustomColors.buttonColor),
                        ),
                        RotatingIconButton(
                          isExpanded: _expandLocation,
                          onTap: () {
                            setState(() {
                              _expandLocation = !_expandLocation;
                            });
                          },
                        ),
                      ],
                    ),
                    _expandLocation
                        ? Column(
                            children: [
                              SizedBox(
                                height: 8.h,
                              ),
                              const CustomNewTextFormField(
                                placeholder: 'Street Address',
                                starText: '*',
                                hintText: 'Search Staff',
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Icon(CupertinoIcons.search),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                height: 30,
                                alignment: Alignment.center,
                                child: ListView(
                                  //  shrinkWrap: true,
                                  //   physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    buildAddress((addressText) {
                                      setState(() {});
                                    }, 'Hazratganj'),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    buildAddress((addressText) {}, 'Bhootnath'),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    buildAddress(
                                        (addressText) {}, 'indranagar'),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    buildAddress((addressText) {}, 'Charbagh'),
                                  ],
                                ),
                              )
                            ],
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                    color: CustomColors.mediumBlack.withOpacity(0.3),
                    height: 1,
                    thickness: 0.7),
                SizedBox(
                  height: 8.h,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomText.text(
                              text: 'Assign Password',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: CustomColors.buttonColor),
                        ),
                        RotatingIconButton(
                          isExpanded: _expandPassword,
                          onTap: () {
                            setState(() {
                              _expandPassword = !_expandPassword;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    _expandPassword
                        ? Column(
                            children: [
                              CustomNewTextFormField(
                                controller: _passwordGenerateController,
                                readOnly: true,
                                placeholder: 'Password',
                                starText: '*',
                                hintText: 'dw3GJ4&*%#@GIh1r',
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: InkWell(
                                      onTap: _copyMeetLink,
                                      child: const Icon(
                                          Icons.content_copy_outlined)),
                                ),
                              ),

                              /// Here
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomText.text(
                                        text:
                                            'Password should be minimum 8 character + 1 upper case + 1 Lower case + 1 special symbol',
                                        color: CustomColors.inactiveButton,
                                        fontSize: 10,
                                        textAlign: TextAlign.start),
                                  ),
                                  CustomTextBtn(
                                    onPressed: generatePassword,
                                    text: 'Generate',
                                    textColor: CustomColors.supportiveColor,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                Divider(
                    color: CustomColors.mediumBlack.withOpacity(0.3),
                    height: 1,
                    thickness: 0.7),
                SizedBox(
                  height: 10.h,
                ),
                CustomButton(
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) => AutoCloseDialog(
                        duration: const Duration(seconds: 2),
                        content: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 30.h, horizontal: 30.w),
                          child: Column(
                            children: [
                              Lottie.asset(
                                'assets/success.json',
                                width: 150.w,
                                height: 150.h,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              CustomText.text(
                                  text: 'Staff has been created \nsuccessfully',
                                  color: CustomColors.buttonColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 15.h,
                              ),
                              CustomButton(
                                onTap: () => Navigator.pop(context),
                                text: 'Done',
                                backgroundColor: CustomColors.buttonColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  text: 'Save',
                  backgroundColor: CustomColors.buttonColor,
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomButton(
                  onTap: () {},
                  text: 'Cancel',
                  textColor: Colors.black,
                  backgroundColor: CustomColors.transparent,
                  borderColor: CustomColors.grey,
                ),
              ],
            ),
          )),
    );
  }

  InkWell buildAddress(void Function(String addressText) onTap, addressText) {
    return InkWell(
      onTap: () => onTap(addressText),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Row(
          children: [
            CustomText.text(text: addressText, color: CustomColors.buttonColor),
            const Icon(
              Icons.close,
              color: CustomColors.buttonColor,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
