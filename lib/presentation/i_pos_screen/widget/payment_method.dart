import 'package:google_fonts/google_fonts.dart';

import '../../../core/app_export.dart';

class PaymentMethod {
  static Widget addCardDetails(
      BuildContext context,
      TextEditingController nameController,
      TextEditingController cardController,
      TextEditingController cardExpController,
      TextEditingController cardCvvController,
      Widget buttonRow,
      void Function() onTap,
      ) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.all(15.r),
        width: double.infinity,
        // height: MediaQuery.of(context).size.height * 0.50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.r), topRight: Radius.circular(35.r))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomText.text(text: 'Add Card Details', fontSize: 16.sp),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: buttonRow,
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Name on Card',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TextField(
                  controller: cardController,
                  decoration: InputDecoration(
                    hintText: 'Card Number',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: TextField(
                        controller: cardExpController,
                        decoration: InputDecoration(
                          hintText: 'Card Expiry',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: TextField(
                        controller: cardCvvController,
                        decoration: InputDecoration(
                          hintText: 'CVV',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                onTap: onTap,
                text: 'Continue',
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget upi(
      BuildContext context,
      TextEditingController upiIdController,
      TextEditingController registeredNameController,
      Widget buttonRow,
      void Function() onTap,
      ) {
    return Container(
      padding: EdgeInsets.all(15.r),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.r), topRight: Radius.circular(35.r))),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomText.text(text: 'Add Card Details', fontSize: 16.sp),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: buttonRow,
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TextField(
                controller: upiIdController,
                decoration: InputDecoration(
                  hintText: 'UPI ID',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TextField(
                controller: registeredNameController,
                decoration: InputDecoration(
                  hintText: 'Enter Registered Name',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              onTap: onTap,
              text: 'Continue',
            )
          ],
        ),
      ),
    );
  }

  static Widget upiApps(
      BuildContext context,
      TextEditingController upiIdController,
      TextEditingController registeredNameController,
      Widget buttonRow,
      void Function() onTap,
      ) {
    return Container(
      padding: EdgeInsets.all(15.r),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.r), topRight: Radius.circular(35.r))),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomText.text(text: 'Add Card Details', fontSize: 16.sp),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: buttonRow,
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TextField(
                controller: upiIdController,
                decoration: InputDecoration(
                  hintText: 'UPI ID',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TextField(
                controller: registeredNameController,
                decoration: InputDecoration(
                  hintText: 'Enter Registered Name',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              onTap: onTap,
              text: 'Continue',
            )
          ],
        ),
      ),
    );
  }
}
