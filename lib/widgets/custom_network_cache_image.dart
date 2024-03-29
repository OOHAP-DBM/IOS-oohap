import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../themes/custom_colors.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  final Widget Function(BuildContext, ImageProvider)? imageBuilder;
  final double? height;
  final double? width;

  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit,
    this.imageBuilder,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: imageUrl,
      fit: fit ?? BoxFit.cover,
      imageBuilder: imageBuilder,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: SpinKitThreeInOut(
        size: 20.sp,
        color: CustomColors.buttonGreen,
      )),
      errorWidget: (context, url, error) =>
          const Icon(Icons.image_not_supported_outlined),
    );

    // return CachedNetworkImage(
    //   imageUrl: imageUrl,
    //   fit: fit ?? BoxFit.cover,
    //   imageBuilder: imageBuilder,
    //   progressIndicatorBuilder: (context, url, downloadProgress) => Center(
    //       child: CircularProgressIndicator(
    //           color: CustomColors.buttonGreen,
    //           value: downloadProgress.progress)),
    //   errorWidget: (context, url, error) => const Icon(Icons.error),
    // );
  }
}
