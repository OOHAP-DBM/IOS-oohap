import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oohapp/core/constants/global_cubit/character_count_cubit.dart';
import 'package:oohapp/core/constants/global_cubit/form_validation_cubit.dart';

import 'package:oohapp/presentation/c_onboarding_screen/cubit/onboarding_cubit.dart';
import 'package:oohapp/presentation/b_splash_screen/cubit/splash_cubit.dart';
import 'package:oohapp/core/app_export.dart';
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
        BlocProvider<CharacterCountCubit>(create: (context) => CharacterCountCubit()),
        BlocProvider<FormValidationCubit>(create: (context) => FormValidationCubit()),
        // Add other global Cubits here if needed
      ],
      child: child,
    );
  }
}
