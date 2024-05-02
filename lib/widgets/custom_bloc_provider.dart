import 'package:oohapp/core/constants/global_cubit/character_count_cubit.dart';
import 'package:oohapp/core/constants/global_cubit/form_validation_cubit.dart';

import 'package:oohapp/presentation/c_onboarding_screen/cubit/onboarding_cubit.dart';
import 'package:oohapp/presentation/b_splash_screen/cubit/splash_cubit.dart';
import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/presentation/h_my_staff_screen/cubit/upload_image_cubit.dart';

import '../presentation/i_pos_screen/cubit/saved_hoarding.dart';
// Import your FormValidationCubit here

class CustomBlocProvider extends StatelessWidget {
  const CustomBlocProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(create: (context) => InternetCubit()),
        BlocProvider<SplashCubit>(create: (context) => SplashCubit()),
        BlocProvider<OnboardingCubit>(create: (context) => OnboardingCubit()),
        BlocProvider<CharacterCountCubit>(
            create: (context) => CharacterCountCubit()),
        BlocProvider<StaffProfileCubit>(
          create: (context) => StaffProfileCubit(),


        ),

        //     BlocProvider(create: (context) => InternetCubit()),
        //    BlocProvider<OnboardingCubit>(create: (context) => OnboardingCubit()),
        //    BlocProvider(create: (context) => LoginValidationCubit()),
//BlocProvider(create: (context) => LoginOtpCubit()),
        //  BlocProvider(create: (context) => PasswordCubit()),
        // BlocProvider(create: (context) => SignUpOtpCubit()),
        //  BlocProvider(create: (context) => SignUpFormCubit()),
        // BlocProvider(create: (context) => BottomCubit()),
        //     BlocProvider(create: (context) => DashboardCubit()),
        //    BlocProvider(create: (context) => SignUpValidationCubit()),
        //   BlocProvider(create: (context) => ChatCubit()),
        // Update user profile
        //    BlocProvider(create: (context) => ImageCubit()),

        //   BlocProvider<EditProfileCubit>(create: (context) => EditProfileCubit(),),
        // Add member screen cubit
        //   BlocProvider(create: (context) => AddMemberCubit()),
        // Item cubit for the show team member list
        //   BlocProvider(create: (context) => ItemCubit()),

        BlocProvider<SavedHoardingCubit>(create: (context) => SavedHoardingCubit()),

        // Add other global Cubits here if needed
      ],
      child: child,
    );
  }
}
