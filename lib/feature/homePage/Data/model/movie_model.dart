import 'package:court_flix/feature/homePage/Domain/entity/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required super.id,
    required super.title,
    super.posterPath,
    super.backdropPath,
    required super.overview,
    required super.rating,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? json['name'] ?? '',
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      overview: json['overview'] ?? '',
      rating: (json['vote_average'] ?? 0).toDouble(),
    );
  }
}
