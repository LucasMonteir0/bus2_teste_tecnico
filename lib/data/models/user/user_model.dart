import 'package:equatable/equatable.dart';

import 'date_of_birh_model.dart';
import 'user_location_model.dart';
import 'user_name_model.dart';
import 'user_pictures_model.dart';

class UserModel extends Equatable {
  final UserNameModel name;
  final UserLocationModel location;
  final String email;
  final DateOfBirthModel dob;
  final String phone;
  final String cell;
  final UserPicturesModel picture;

  const UserModel({
    required this.name,
    required this.location,
    required this.email,
    required this.dob,
    required this.phone,
    required this.cell,
    required this.picture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: UserNameModel.fromJson(json['name'] as Map<String, dynamic>),
      location: UserLocationModel.fromJson(
        json['location'] as Map<String, dynamic>,
      ),
      email: json['email'] as String,
      dob: DateOfBirthModel.fromJson(json['dob'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      cell: json['cell'] as String,
      picture: UserPicturesModel.fromJson(
        json['picture'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name.toJson(),
      'location': location.toJson(),
      'email': email,
      'dob': dob.toJson(),
      'phone': phone,
      'cell': cell,
      'picture': picture.toJson(),
    };
  }

  @override
  List<Object?> get props {
    return [name, location, email, dob, phone, cell, picture];
  }
}
