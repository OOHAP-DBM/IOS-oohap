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

  static String capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1);
  }

  static String formatPhoneNumber(String phoneNumber) {
    String formattedNumber =
        '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}';
    return formattedNumber;
  }


  static String bookingDateFormat(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }


}
