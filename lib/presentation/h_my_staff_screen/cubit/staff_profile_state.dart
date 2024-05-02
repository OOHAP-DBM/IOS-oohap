import 'dart:io';

enum Gender { male, female, other }

class StaffProfileState {
  File? image;
 /* String? firstName;
  String? lastName;
  Gender? gender;
  String? dob;
  String? role;
  String? email;
  String? mobileNumber;
  String? streetAddress;
  String? pinCode;
  String? city;
  String? state;
  String? country;
  String? password;*/

  StaffProfileState({
    this.image,
  /*  this.firstName,
    this.lastName,
    this.gender,
    this.dob,
    this.role,
    this.email,
    this.mobileNumber,
    this.streetAddress,
    this.pinCode,
    this.city,
    this.state,
    this.country,
    this.password,*/
  });

  StaffProfileState copyWith({
    File? image,
  /*  String? firstName,
    String? lastName,
    Gender? gender,
    String? dob,
    String? role,
    String? email,
    String? mobileNumber,
    String? streetAddress,
    String? pinCode,
    String? city,
    String? state,
    String? country,
    String? password,*/
  }) {
    return StaffProfileState(
      image: image ?? this.image,
   /*   firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      role: role ?? this.role,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      streetAddress: streetAddress ?? this.streetAddress,
      pinCode: pinCode ?? this.pinCode,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      password: password ?? this.password,*/
    );
  }
}
