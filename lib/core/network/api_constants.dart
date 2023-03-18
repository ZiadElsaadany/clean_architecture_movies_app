class ApiConstant {
  static const String baseUrl = "htptps://api.themoviedb.org/3";
  static const String apiKey = "7aa09e7c4adae327e284850da455d2b0";
  static const String nowPlayingPath =
      "${ApiConstant.baseUrl}/movies/now_playing?${ApiConstant.apiKey}";


}