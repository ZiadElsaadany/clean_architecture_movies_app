class ApiConstant {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "7aa09e7c4adae327e284850da455d2b0";
  static const String nowPlayingPath =
      "${ApiConstant.baseUrl}/movie/now_playing?api_key=${ApiConstant.apiKey}";

static const String popularPath =
    "${ApiConstant.baseUrl}/movie/popular?api_key=${ApiConstant.apiKey}";
  static const String topRatedPath =
      "${ApiConstant.baseUrl}/movie/top_rated?api_key=${ApiConstant.apiKey}";


  static const String baseImageUrl  = "https://image.tmdb.org/t/p/w500";
  static  String imageUrl( String path ) {
    return "$baseImageUrl$path";
  }

  static  String movieDetailsPath( int id ) {
    return "${ApiConstant.baseUrl}/movie/$id?api_key=${ApiConstant.apiKey}";
  }


  static  String recommendation( int id ) {
    return "${ApiConstant.baseUrl}/movie/$id/recommendations?api_key=${ApiConstant.apiKey}";
  }


}