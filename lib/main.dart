import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/widgets/custom_bloc_provider.dart';

/*
void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = const ColorScheme.light();
    return CustomBlocProvider(
      child: MaterialApp(
        //navigatorKey: ScaleSize.navigatorMediaQueryKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: colorScheme,
          scaffoldBackgroundColor: colorScheme.background,
          appBarTheme: AppBarTheme(
            //color: colorScheme.primary,
            iconTheme: IconThemeData(color: colorScheme.onPrimary),
          ),
         */ /* bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: colorScheme.primary,
            // Set bottom navigation bar color
            selectedItemColor: colorScheme.inversePrimary,
            // Set selected item color
            unselectedItemColor: colorScheme.onPrimary
                .withOpacity(0.5), // Set unselected item color
          ),*/ /*
        ),
         initialRoute: Routes.homepagescreen,
         onGenerateRoute: RoutesGenerator.generateRoutes,
        // home: OnBoardingScreen(),



        // home: const CreateProfileScreen(),
        //  home: LoginWithPasswordScreen(),
        // home: DashboardScreen(),
        // home: PageOne(),
        // home: ProfileScreen(),
      ),
    );
  }
}*/

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = const ColorScheme.light();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_, child) {
        return CustomBlocProvider(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                useMaterial3: true,
                colorScheme: colorScheme,
                scaffoldBackgroundColor: colorScheme.background,
                appBarTheme: AppBarTheme(
                  //color: colorScheme.primary,
                  iconTheme: IconThemeData(color: colorScheme.onPrimary),
                )),
           // initialRoute: Routes.homepagescreen,
              initialRoute: Routes.homepagescreen,
              //initialRoute: Routes.mainScreen,
            onGenerateRoute: RoutesGenerator.generateRoutes,
          ),
        );
      },
    );
  }
}
