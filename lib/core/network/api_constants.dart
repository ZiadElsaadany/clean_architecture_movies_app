class ApiConstant {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "7aa09e7c4adae327e284850da455d2b0";
  static const String nowPlayingPath =
      "${ApiConstant.baseUrl}/movie/now_playing?api_key=${ApiConstant.apiKey}";

static const String popularPath =
    "${ApiConstant.baseUrl}/movie/popular?api_key=${ApiConstant.apiKey}";
  static const String topRatedPath =
      "${ApiConstant.baseUrl}/movie/top_rated?api_key=${ApiConstant.apiKey}";
}