import 'package:equatable/equatable.dart';

class StreetModel extends Equatable {
  final int number;
  final String name;

  const StreetModel({required this.number, required this.name});

  factory StreetModel.fromJson(Map<String, dynamic> json) {
    return StreetModel(
      number: json['number'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'number': number, 'name': name};
  }

  @override
  List<Object?> get props => [number, name];
}
