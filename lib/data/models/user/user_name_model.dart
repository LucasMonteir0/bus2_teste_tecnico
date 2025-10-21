import 'package:equatable/equatable.dart';

class UserNameModel extends Equatable {
  final String title;
  final String first;
  final String last;

  const UserNameModel({
    required this.title,
    required this.first,
    required this.last,
  });

  factory UserNameModel.fromJson(Map<String, dynamic> json) {
    return UserNameModel(
      title: json['title'] as String,
      first: json['first'] as String,
      last: json['last'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'first': first, 'last': last};
  }

  @override
  List<Object?> get props => [title, first, last];
}
