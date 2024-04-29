import 'package:oohapp/core/app_export.dart';

import 'package:oohapp/core/constants/global_cubit/character_count_cubit.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.onPressed,
      this.color,
      this.text,
      this.child,
      this.height,
      this.width,
      this.obscureText = false,
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
      this.showCharacterCount = false, // New property for character count
      this.onChanged,
      this.newColor,
      this.validator,
      this.requiredSign,
      this.onTap,
      this.enabled,
      this.readOnly,
      this.contentPadding,
      this.isDense // New property for onChanged
      });

  final VoidCallback? onPressed;
  final Color? color;
  final Color? newColor;
  final String? text;
  final Widget? child;
  final double? height;
  final double? width;
  final bool? obscureText;
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
  final bool? showCharacterCount;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? requiredSign;
  final void Function()? onTap;
  final bool? enabled;
  final bool? readOnly;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isDense;

  // New property for onChanged

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // height: (showCharacterCount!)?ScaleSize.height(12.7):ScaleSize.height(9.66),

      width: width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (requiredSign == true)
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
          const SizedBox(
            height: 8.0,
          ),
          Container(
            // height: height ?? ScaleSize.height(5.66),
            decoration: BoxDecoration(
              color: newColor,
            ),
            child: Stack(
              children: [
                TextFormField(
                  readOnly: readOnly!,
                  enabled: enabled,
                  onTap: onTap,
                  validator: validator,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  keyboardType: keyboardType,
                  maxLength: maxLength,
                  controller: controller,
                  obscureText: obscureText!,
                  maxLines: maxLines,
                  onChanged: (text) {
                    if (onChanged != null) {
                      onChanged!(text);
                    }
                    if (showCharacterCount == true) {
                      context
                          .read<CharacterCountCubit>()
                          .updateCharacterCount(text.length);
                    }
                  },
                  decoration: InputDecoration(
                    focusColor: CustomColors.inactiveButton,
                    labelStyle:
                        const TextStyle(color: CustomColors.inactiveButton),
                    contentPadding: contentPadding ??
                        const EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 8.0,
                        ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CustomColors.blackColor,
                      ),
                    ),
                    counterText: '',
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: CustomColors.blackColor),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    icon: icon,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      color: CustomColors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                    prefixIcon: prefixIcon,
                    suffixIconColor: CustomColors.inactiveButton,
                    prefixIconColor: CustomColors.inactiveButton,
                    suffixIcon: suffixIcon,
                    prefixIconConstraints:
                        const BoxConstraints(minWidth: 15, minHeight: 15),
                    suffixIconConstraints:
                        const BoxConstraints(minWidth: 15, minHeight: 15),
                    isDense: isDense,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2,
          ),
          if (showCharacterCount == true)
            BlocBuilder<CharacterCountCubit, int>(
              builder: (context, count) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Text(
                      '$count/${maxLength ?? 0} Characters',
                      style: TextStyle(
                        color: CustomColors.blackColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
