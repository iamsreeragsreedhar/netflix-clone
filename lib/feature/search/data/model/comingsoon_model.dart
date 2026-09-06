import 'package:court_flix/feature/homePage/Domain/entity/movie_entity.dart';
import 'package:court_flix/feature/search/domain/entity/comingsoon_entity.dart';

class ComingsoonModel extends commingSoonEntity {
  ComingsoonModel({
    required super.adult,
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.title,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.softcore,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory ComingsoonModel.fromJson(Map<String, dynamic> json) {
    return ComingsoonModel(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      posterPath: json['poster_path'],
      releaseDate: json['release_date'] ?? '',
      softcore: json['softcore'] ?? false,
      video: json['video'] ?? false,
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
    );
  }
}
