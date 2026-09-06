import 'package:court_flix/feature/search/domain/entity/search_enetity.dart';

class MovieSearchModel extends topSearchEntity {
  MovieSearchModel({
    required super.adult,
    super.backdropPath,
    required super.id,
    required super.title,
    super.posterPath,
    required super.originalLanguage,
    required super.originalTitle,
  });

  factory MovieSearchModel.fromJson(Map<String, dynamic> json) {
    return MovieSearchModel(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      posterPath: json['poster_path'],
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
    );
  }
}
