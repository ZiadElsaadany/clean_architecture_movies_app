import 'package:clean_architecture_movies_app/core/utls/app_constant.dart';
import 'package:clean_architecture_movies_app/movies/data/models/movies_model.dart';
import 'package:dio/dio.dart';

class BaseMovieRemoteDataSource {


  //  methods --> from useCases

Future<List<MovieModel>>  getNowPlaying( )  async{

    try{
  final response =     await Dio().get(
        "${AppConstant.baseUrl}/movies/now_playing?${AppConstant.apiKey}"
      );
      if(response.statusCode == 200 ) {
     List resData =  response.data["results"];
        return
          List<MovieModel>.from(resData) .map((e) =>
          MovieModel.fromJson(e as Map<String, dynamic>)
          ).toList();

      }
      else{
      }
    }catch(e){

    }

  }


}