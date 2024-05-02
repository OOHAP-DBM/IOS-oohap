import 'package:flutter_bloc/flutter_bloc.dart';

// Define states
abstract class SavedHoardingState {}

class SavedHoardingInitial extends SavedHoardingState {}

class SavedHoardingLoaded extends SavedHoardingState {
  final List<Map<String, dynamic>> hoardingDetails;

  SavedHoardingLoaded(this.hoardingDetails);
}

// Define Cubit
class SavedHoardingCubit extends Cubit<SavedHoardingState> {
  SavedHoardingCubit() : super(SavedHoardingInitial());

  void addHoardingDetail(Map<String, dynamic> detail) {
    if (state is SavedHoardingLoaded) {
      final currentState = state as SavedHoardingLoaded;
      final List<Map<String, dynamic>> updatedDetails =
      List.from(currentState.hoardingDetails)..add(detail);
      emit(SavedHoardingLoaded(updatedDetails));
    } else {
      emit(SavedHoardingLoaded([detail]));
    }
  }
  void removeHoardingDetail(Map<String, dynamic> detail) {
    if (state is SavedHoardingLoaded) {
      final currentState = state as SavedHoardingLoaded;
      final List<Map<String, dynamic>> updatedDetails =
      List.from(currentState.hoardingDetails);
      updatedDetails.remove(detail);
      emit(SavedHoardingLoaded(updatedDetails));
    }
  }

}
