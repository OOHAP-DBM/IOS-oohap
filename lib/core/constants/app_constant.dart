  import 'package:oohapp/core/app_export.dart';


class AppConstant {
  static String appName = 'OohApp';

  // App screens
  // Name for appBar of each screen
  static String homeScreen = 'HomeScreen';
  static String splashScreen = 'HomeScreen';
  static String profilePage = 'ProfileScreen';
  static String noScreen = 'No Screen found';

// font
// icon
static const IconData location_pin = IconData(0xe3ac, fontFamily: 'MaterialIcons');
static const IconData search = IconData(0xe567, fontFamily: 'MaterialIcons');
static const IconData mic = IconData(0xe3e1, fontFamily: 'MaterialIcons');
static const IconData camera_alt_rounded = IconData(0xf60b, fontFamily: 'MaterialIcons');


 static String getTimeMessage() {
    // Get the current time
    DateTime now = DateTime.now();
    int hour = now.hour;

    // Define the messages for each time of day
    String morning = "Good morning!";
    String evening = "Good evening!";
    String night = "Good night!";

    // Determine the appropriate message based on the current time
    String message;
    if (hour >= 5 && hour < 12) {
      message = morning;
    } else if (hour >= 12 && hour < 18) {
      message = evening;
    } else {
      message = night;
    }

    return message;
  }


}
