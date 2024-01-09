import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oohapp/core/app_export.dart';

import 'package:oohapp/presentation/c_onboarding_screen/cubit/charcter_count/character_count_cubit.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
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
    this.onChanged, // New property for onChanged
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Color? color;
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
  final void Function(String)? onChanged; // New property for onChanged

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height ?? ScaleSize.height(9.66),
      width: width ?? ScaleSize.width(100),
      decoration: BoxDecoration(
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.calloutText(
            text: placeholder,
            color: CustomColors.blackColor,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            height: height ?? ScaleSize.height(5.66),
            decoration: BoxDecoration(
              color: color,
            ),
            child: Stack(
              children: [
                TextFormField(
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
                      context.read<CharacterCountCubit>().updateCharacterCount(text.length);
                    }
                  },
                  decoration: InputDecoration(
                    focusColor: CustomColors.inactiveButton,
                    labelStyle: const TextStyle(color: CustomColors.inactiveButton),
                    contentPadding: const EdgeInsets.symmetric(
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
                      borderSide: const BorderSide(color: CustomColors.blackColor),
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
                  ),
                ),
                if (showCharacterCount == true)
                  Positioned(
                    bottom: 0,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: CustomColors.grey,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: BlocBuilder<CharacterCountCubit, int>(
                        builder: (context, count) {
                          return CustomText.calloutText(
                            text: '$count/${maxLength ?? 0}',
                            color: CustomColors.blackColor,
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
