import 'package:clean_architecture_movies_app/movies/domain/entities/recommendation.dart';

class RecommendationModel extends RecommendationEntity {
   RecommendationModel({required super.imgPath, required super.id});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
    imgPath: json["backdrop_path"]??"/jazlkwXfw4KdF6fVTRsolOvRCmu.jpg", id: json["id"]);
  }
}
