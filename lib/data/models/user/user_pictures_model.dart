import 'package:equatable/equatable.dart';

class UserPicturesModel extends Equatable {
  final String large;
  final String medium;
  final String thumbnail;

  const UserPicturesModel({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory UserPicturesModel.fromJson(Map<String, dynamic> json) {
    return UserPicturesModel(
      large: json['large'] as String,
      medium: json['medium'] as String,
      thumbnail: json['thumbnail'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'large': large, 'medium': medium, 'thumbnail': thumbnail};
  }

  @override
  List<Object?> get props => [large, medium, thumbnail];
}
