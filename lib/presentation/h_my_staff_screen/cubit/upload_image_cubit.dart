import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oohapp/presentation/h_my_staff_screen/cubit/staff_profile_state.dart';

/*class StaffProfileCubit extends Cubit<StaffProfileState> {
  StaffProfileCubit() : super(StaffProfileState());

  void setSelectedImage(File? image) {
    emit(state.copyWith(image: image));
  }
  void setFirstName(String firstName) {
    emit(state.copyWith(firstName: firstName));
  }

  void setLastName(String lastName) {
    emit(state.copyWith(lastName: lastName));
  }

  void setGender(Gender gender) {
    emit(state.copyWith(gender: gender));
  }

  void setDob(String dob) {
    emit(state.copyWith(dob: dob));
  }

  void setRole(String role) {
    emit(state.copyWith(role: role));
  }

  void setEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void setMobileNumber(String mobileNumber) {
    emit(state.copyWith(mobileNumber: mobileNumber));
  }

  void setStreetAddress(String streetAddress) {
    emit(state.copyWith(streetAddress: streetAddress));
  }

  void setPinCode(String pinCode) {
    emit(state.copyWith(pinCode: pinCode));
  }

  void setCity(String city) {
    emit(state.copyWith(city: city));
  }

  void setStateValue(String stateValue) {
    emit(state.copyWith(state: stateValue));
  }

  void setCountry(String country) {
    emit(state.copyWith(country: country));
  }

  void setPassword(String password) {
    emit(state.copyWith(password: password));
  }
}


 */




class StaffProfileCubit extends Cubit<File?> {
  StaffProfileCubit() : super(null);

  void setSelectedImage(File? image) {
    emit(image);
  }
}
