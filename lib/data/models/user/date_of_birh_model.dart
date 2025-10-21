import 'package:equatable/equatable.dart';

class DateOfBirthModel extends Equatable {
  final DateTime date;
  final int age;

  const DateOfBirthModel({required this.date, required this.age});

  factory DateOfBirthModel.fromJson(Map<String, dynamic> json) {
    return DateOfBirthModel(
      date: DateTime.parse(json['date'] as String),
      age: json['age'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {'date': date.toIso8601String(), 'age': age};
  }

  @override
  List<Object?> get props => [date, age];
}
