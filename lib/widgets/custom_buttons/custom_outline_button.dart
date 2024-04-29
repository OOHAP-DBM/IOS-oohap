import '../../core/app_export.dart';

class CircularOutlineButton extends StatelessWidget {
  const CircularOutlineButton({
    super.key,
    required this.onPressed,
    this.iconColor,
    this.backgroundColor,
    this.iconSize = 24.0,
    required this.icon,
    this.borderColor,
  });

  final VoidCallback onPressed;
  final Color? iconColor;
  final Color? backgroundColor;
  final IconData icon;
  final double? iconSize;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      splashColor: Colors.red,
      padding: EdgeInsets.all(5.r),
      constraints: BoxConstraints(
        minWidth: iconSize! * 1,
        minHeight: iconSize! * 1,
      ),
      iconSize: iconSize,
      style: ButtonStyle(
        iconColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return CustomColors.buttonGreen;
            }
            return iconColor;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return CustomColors.tertiaryGreen;
            }
            return backgroundColor ?? Colors.transparent;
          },
        ),
        side: MaterialStateProperty.resolveWith<BorderSide>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return const BorderSide(
                  color: CustomColors.tertiaryGreen, width: 1.0);
            }
            return BorderSide(
                color: borderColor ?? CustomColors.blackColor, width: 0.8);
          },
        ),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
