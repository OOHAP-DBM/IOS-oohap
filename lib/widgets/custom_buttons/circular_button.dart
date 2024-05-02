import 'package:flutter/material.dart';
import 'package:oohapp/themes/custom_colors.dart';

import '../scale_size.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key,
    required this.onPressed,
    this.iconColor,
    this.backgroundColor,
    this.borderColor,
    this.text,
    this.height,
    this.width,
    this.isDisabled = false,
    this.margin,
    this.alignment,
    required this.icon,
    this.borderWidth,
  });

  final VoidCallback onPressed;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final String? text;
  final double? height;
  final double? width;
  final bool isDisabled;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final IconData icon;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        height: height ?? size.height * 0.056,
        width: width ?? size.width * 0.056,
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor ?? Colors.transparent,
            )),
        child: Icon(
          icon,
          color: iconColor ?? CustomColors.linkColor,
        ),
      ),
    );
  }
}
