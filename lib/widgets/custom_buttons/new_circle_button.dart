

import '../../core/app_export.dart';

class NewCircularButton extends StatelessWidget {
  const NewCircularButton({
    super.key,
    required this.onPressed,
    this.iconColor,
    this.backgroundColor,
    this.iconSize = 24.0,
    required this.icon,
  });

  final VoidCallback onPressed;
  final Color? iconColor;
  final Color? backgroundColor;
  final IconData icon;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
        padding: EdgeInsets.all(8.r),
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
              return backgroundColor ?? Colors.black;
            },
          ),
        ),
        onPressed: onPressed,
        icon: Icon(icon));
  }
}

/*  return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey[400],
        onTap: onTap,
        borderRadius: BorderRadius.circular(100.r),
        child: Container(
            decoration: BoxDecoration(
                color: backgroundColor ?? Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                    color: borderColor ?? Colors.transparent,
                    width: borderWidth ?? 1)),
            child: SizedBox.fromSize(
              size: Size.fromRadius(radius ?? 15.r),
              child: Icon(
                icon,
                color: iconColor ?? CustomColors.linkColor,
                size: iconSize ?? 18.sp,
              ),
            )),
      ),
    );
  }
}*/

/*

IconButton.filled(
color: Colors.black,
style: ButtonStyle(
backgroundColor: MaterialStateProperty
    .resolveWith<Color?>(
(Set<MaterialState> states) {
if (states
    .contains(MaterialState.pressed)) {
return CustomColors.buttonGreen;
}

return Colors.black54;
},
),
),
onPressed: () {


*/
