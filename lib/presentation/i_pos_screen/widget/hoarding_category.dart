import '../../../core/utils/image_constant.dart';

class HoardingCategory {
  final String text;
  final String image;

  HoardingCategory({required this.text, required this.image});
}

List<HoardingCategory> categories = [
  HoardingCategory(text: 'Uniploes', image: ImageConstant.uniPole),
  HoardingCategory(text: 'Over Bridges', image: ImageConstant.overBridge),
  HoardingCategory(text: 'Bus shelter', image: ImageConstant.busShelter),
  HoardingCategory(text: 'LED', image: ImageConstant.led),
  HoardingCategory(text: 'Public Utility', image: ImageConstant.publicUtility),
  HoardingCategory(text: 'Poll Kioske', image: ImageConstant.pollKioske),
  HoardingCategory(text: 'Wall wrap', image: ImageConstant.wallWrap),
  HoardingCategory(text: 'Buildings', image: ImageConstant.buildings),
];