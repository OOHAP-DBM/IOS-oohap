import '../../../core/app_export.dart';

class LikeWidget extends StatefulWidget {
  const LikeWidget({super.key});

  @override
  LikeWidgetState createState() => LikeWidgetState();
}

class LikeWidgetState extends State<LikeWidget> {

  int _likeCount = 0;
  int _dislikeCount = 0;
  bool _liked = false;
  bool _disliked = false;

  void _like() {
    setState(() {
      if (!_liked) {
        _liked = true;
        _likeCount++;
        if (_disliked) {
          _dislikeCount--;
          _disliked = false;
        }
      } else {
        _liked = false;
        _likeCount--;
      }
    });
  }

  void _dislike() {
    setState(() {
      if (!_disliked) {
        _disliked = true;
        _dislikeCount++;
        if (_liked) {
          _likeCount--;
          _liked = false;
        }
      } else {
        _disliked = false;
        _dislikeCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomText.text(text: 'Helpful?', fontSize: 13.sp),
        SizedBox(width: 10.w),
        Material(
          child: InkWell(
            splashColor:  Colors.grey[400],
            onTap: _like,
            child: _liked
                ? Icon(
                    Icons.thumb_up_alt_outlined,
                    color: Colors.blue,
                    size: 15.sp,
                  )
                : Icon(
                    Icons.thumb_up_alt_outlined,
                    size: 15.sp,
                  ),
          ),
        ),
        SizedBox(width: 3.w),
        _liked
            ? CustomText.text(
                text: '$_likeCount',
                color: _liked ? Colors.blue : Colors.black,
                fontSize: 10.sp)
            : const SizedBox.shrink(),
        SizedBox(width: 10.w),
        Material(
          child: InkWell(
            splashColor:  Colors.grey[400],
            onTap: _dislike,
            child: _disliked
                ? Icon(
                    Icons.thumb_down_alt_outlined,
                    color: Colors.blue,
                    size: 15.sp,
                  )
                : Icon(
                    Icons.thumb_down_alt_outlined,
                    size: 15.sp,
                  ),
          ),
        ),
        SizedBox(width: 3.w),
        _disliked
            ? CustomText.text(
                text: '$_dislikeCount',
                color: _disliked ? Colors.blue : Colors.black,
                fontSize: 10.sp)
            : const SizedBox.shrink()
      ],
    );
  }
}
