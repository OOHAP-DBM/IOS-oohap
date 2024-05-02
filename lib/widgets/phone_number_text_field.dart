import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../core/app_export.dart';

class CustomPhoneNumberTextField extends StatelessWidget {
  final TextEditingController? controller;
 final void Function(String?)? onChanged;

   const CustomPhoneNumberTextField(
      {super.key, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomText.text(
                text: 'Mobile Number',
                color: CustomColors.liteBlack,
                fontSize: 10.sp,
                textAlign: TextAlign.start),
            CustomText.text(
              text: '*',
              color: CustomColors.errorColor,
            ),
          ],
        ),
        SizedBox(
          height: 5.0.h,
        ),
        IntlPhoneField(

          controller: controller,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            focusColor: CustomColors.mediumGrey,
            labelStyle: const TextStyle(color: CustomColors.mediumGrey),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
            // EdgeInsets.all(8.5.r),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: CustomColors.mediumGrey),
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
            ),
            isDense: false,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(
                color: CustomColors.mediumGrey,
              ),
            ),
            counterText: '',
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: CustomColors.mediumGrey),
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
            ),
            hintText: 'Enter mobile number',
            hintStyle: TextStyle(
              color: CustomColors.mediumGrey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          initialCountryCode: 'IN',
          keyboardType: TextInputType.phone,
          onChanged: (value){
            onChanged;
          },
        ),
      ],
    );
  }
}
