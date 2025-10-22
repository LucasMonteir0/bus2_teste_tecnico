import 'dart:convert';

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
  final String uuid;
  final UserPicturesModel picture;

  const UserModel({
    required this.uuid,
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
      uuid: json['login']['uuid'] as String,
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
      'login': {'uuid': uuid},
    };
  }

  factory UserModel.fromSqfliteJson(Map<String, dynamic> map) {
    final Map<String, dynamic> rehydratedMap = {
      'email': map['email'],
      'phone': map['phone'],
      'cell': map['cell'],
      'login': {'uuid': map['uuid']},
      'name': jsonDecode(map['name']),
      'location': jsonDecode(map['location']),
      'dob': jsonDecode(map['dob']),
      'picture': jsonDecode(map['picture']),
    };

    return UserModel.fromJson(rehydratedMap);
  }

  Map<String, dynamic> toSqfliteJson() => {
    'uuid': uuid,
    'email': email,
    'phone': phone,
    'cell': cell,
    'name': jsonEncode(name.toJson()),
    'location': jsonEncode(location.toJson()),
    'dob': jsonEncode(dob.toJson()),
    'picture': jsonEncode(picture.toJson()),
  };

  @override
  List<Object?> get props {
    return [name, location, email, dob, phone, cell, picture];
  }
}
