import '../../core/app_export.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    this.dropdownValue,
     this.onChanged,
    this.color,
    this.height,
    this.width,
    this.margin,
    this.placeholder,
    this.items,
    this.validator,
    this.dropdownController,
    this.errorColor,
    this.hintText,
    this.borderRadius,
    this.startText,
    this.iconColor,
  });

  final Color? color;
  final Color? iconColor;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final String? placeholder;
  final String? startText;
  final String? dropdownValue;
  final ValueChanged<String?>? onChanged;
  final List<String>? items;

  final String? Function(String?)? validator;
  final TextEditingController? dropdownController;
  final Color? errorColor;
  final String? hintText;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: width ?? size.width * 0.44,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          placeholder != null
              ? Column(
            children: [
              Row(
                children: [
                  CustomText.text(
                    text: placeholder!,
                    color: CustomColors.liteBlack,
                  ),
                  CustomText.text(
                    text: startText ?? '*',
                    color: CustomColors.errorColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
            ],
          )
              : const SizedBox.shrink(),
          Container(
            // height: height ?? 40.0,
            // Adjust the height as needed
            // padding: const EdgeInsets.symmetric(horizontal: 2.0),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              /* border: Border.all(
                color: CustomColors.inactiveColor,
                width: 1.0,
              ),*/
              color: color,
              borderRadius: borderRadius ?? BorderRadius.circular(0.0),
            ),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: errorColor ?? CustomColors.inactiveButton),
                  borderRadius: borderRadius ??
                      const BorderRadius.all(Radius.circular(0.0)),
                ),
                contentPadding:
                const EdgeInsets.symmetric(vertical: 7.0, horizontal: 6.0),
                isDense: true,
                //  fillColor: Colors.grey[200],
                focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadius ??
                      const BorderRadius.all(Radius.circular(0.0)),
                  borderSide: BorderSide(
                    color: errorColor ?? CustomColors.inactiveButton,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: errorColor ?? CustomColors.inactiveButton),
                  borderRadius: borderRadius ??
                      const BorderRadius.all(Radius.circular(0.0)),
                ),
                errorStyle: const TextStyle(height: 0.0, fontSize: 10.0),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: CustomColors.errorColor,
                  ),
                  borderRadius: borderRadius ??
                      const BorderRadius.all(Radius.circular(0.0)),
                ),
              ),
              hint: dropdownController?.text.isEmpty ?? true
                  ? hintText != null
                  ? Text(
                hintText!,
                style: const TextStyle(
                  color: CustomColors.inactiveButton,
                  fontWeight: FontWeight.w300,
                ),
              )
                  : null
                  : null,
              menuMaxHeight: size.height * 0.30,
              value: dropdownValue != null &&
                  items?.contains(dropdownValue) == true
                  ? dropdownValue
                  : null,
              items: items?.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: CustomColors.blackColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }).toList() ??
                  [],
              onChanged: onChanged,
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: iconColor ?? CustomColors.liteBlack,
                size: 30,
              ),
              isExpanded: true,
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}