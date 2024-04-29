import 'package:oohapp/core/app_export.dart';

class CustomTextFieldSelector extends StatelessWidget {
  const CustomTextFieldSelector(
      {super.key,
      this.onPressed,
      this.color,
      this.text,
      this.child,
      this.height,
      this.width,
      this.margin,
      this.alignment,
      this.controller,
      this.icon,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLines,
      this.hintText,
      this.labelText,
      this.maxLength,
      this.keyboardType,
      this.placeholder,
      this.choices,
      this.selectedChoice,
 
      this.validator,
      this.requiredSign,
      this.choiceImages,
     

      this.onChanged});

  final VoidCallback? onPressed;
  final Color? color;
  final String? text;
  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final TextEditingController? controller;
  final Widget? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final String? hintText;
  final String? labelText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final String? placeholder;
  final List<String>? choices;
  final String? selectedChoice;
  final bool? requiredSign;
    final Map<String, String>? choiceImages; 

  
 
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    if(requiredSign==true)
     Row(
      children: [
             CustomText.calloutText(
            text: placeholder,
            color: CustomColors.blackColor,
          ),
          CustomText.calloutText(
            text: '*',
            color: Colors.red,
          )
      ],
     )
     else
       CustomText.calloutText(
            text: placeholder,
            color: CustomColors.blackColor,
          ),
        SizedBox(height: 8.h),
        DropdownButtonFormField<String>(
          validator: validator,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            isDense: true,
          ),
         
          isExpanded: true,
          iconSize: 30,
          style: TextStyle(color: Colors.black, fontSize: 16),
          hint: controller?.text.isEmpty ?? true
              ? hintText != null
                  ? Text(
                      hintText!,
                      style: const TextStyle(
                        color: CustomColors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  : null
              : null,
          items: choices?.map((String value) {
                   return DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: [
                  if (choiceImages != null && choiceImages!.containsKey(value))
                    Image.asset(
                      choiceImages![value]!, // Load the image from assets
                      width: 20, // Fixed width for the image
                      height: 20, // Fixed height for the image
                      fit: BoxFit.contain,
                    ),
                  SizedBox(width: 8), // Spacing between image and text
                  Text(
                    value,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            );
          }).toList() ?? [],
            onChanged: (String? newValue) {
            if (newValue != null) {
              controller?.text = newValue;
              if (onChanged != null) {
                onChanged!(newValue);
              }
            }
          },
          dropdownColor: Colors.white,
        ),
      ],
    );
  }
}
