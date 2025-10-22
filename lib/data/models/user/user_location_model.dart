import 'package:equatable/equatable.dart';

import 'street_model.dart';

class UserLocationModel extends Equatable {
  final StreetModel street;
  final String city;
  final String state;
  final String country;
  final String postcode;

  const UserLocationModel({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
  });

  factory UserLocationModel.fromJson(Map<String, dynamic> json) {
    return UserLocationModel(
      street: StreetModel.fromJson(json['street'] as Map<String, dynamic>),
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      postcode: json['postcode'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street.toJson(),
      'city': city,
      'state': state,
      'country': country,
      'postcode': postcode,
    };
  }

  @override
  List<Object?> get props => [street, city, state, country, postcode];
}
