

import '../../../core/app_export.dart';
import '../../../widgets/custom_network_cache_image.dart';

class CarLogoWidget extends StatelessWidget {
  final String imageUrl;
  final String carBrandName;

  const CarLogoWidget({
    super.key,
    required this.imageUrl,
    required this.carBrandName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
          width: 80.w,
          child: CustomCachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        CustomText.text(
          text: carBrandName,
          fontSize: 12.sp,
        ),
      ],
    );
  }
}
