import '../core/app_export.dart';

class CustomBottomModelSheet {
  static Future<void> showSheet(BuildContext context, List<Widget> children, {Color bgColor = Colors.white}) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.h),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(8.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
