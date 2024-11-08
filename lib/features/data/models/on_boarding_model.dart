import '../../domain/entities/on_boarding_entity.dart';

class OnBoardingModel extends OnBoardingEntity {
  OnBoardingModel({
    required super.title,
    required super.body,
    required super.image,
  });

  factory OnBoardingModel.fromJson(Map<String, dynamic> json) {
    return OnBoardingModel(
      title: json['title'] as String,
      body: json['body'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'image': image,
    };
  }
}
