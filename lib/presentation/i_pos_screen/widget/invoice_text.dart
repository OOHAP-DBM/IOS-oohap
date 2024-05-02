import '../../../core/app_export.dart';

class InvoiceTextWidget extends StatelessWidget {
  final Color? fontColor1;
  final Color? fontColor2;
  final FontWeight? fontWeight1;
  final FontWeight? fontWeight2;
  final double? fontSize1;
  final double? fontSize2;
  final String text1;
  final String text2;

  const InvoiceTextWidget({
    super.key,
    this.fontColor1,
    this.fontColor2,
    this.fontWeight1,
    this.fontWeight2,
    this.fontSize1,
    this.fontSize2,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText.text(
            text: text1,
            fontSize: fontSize1 ?? 14.sp,
            fontWeight: fontWeight1,
            color: fontColor1),
        CustomText.text(
            text: text2,
            fontSize: fontSize2 ?? 14.sp,
            fontWeight: fontWeight2,
            color: fontColor2),
      ],
    );
  }
}
