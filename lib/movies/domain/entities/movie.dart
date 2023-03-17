class MovieEntity {
  final String overview;
  final int id;
  final String title;
  final double voteAverage;
  final List<int> genreIds;
  final String backdropPath;

  MovieEntity(
  {
    required this.overview,
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.genreIds,
    required this.backdropPath
}
      );
}
