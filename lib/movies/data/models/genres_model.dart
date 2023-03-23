import 'package:clean_architecture_movies_app/movies/domain/entities/genres.dart';

  class GenresModel extends  GenresEntity {
 const GenresModel({
 required super.id, required super.name});

 factory GenresModel.fromjson
(Map<String , dynamic> json) {
   return GenresModel(id: json["id"], name:  json["name"]);
}

}