part of 'movie_bloc.dart';

enum Moviestatus { none, loading, success, failure }

enum Movietype { none, trending, popular, watchingnow, toprated }

class MovieState extends Equatable {
  final Moviestatus status;
  final Movietype type;
  final String msg;
  final List<MovieEntity> movies;
  final List<MovieEntity> popularMoviesList;
  final List<MovieEntity> nowPlayingMoviesList;
  final List<MovieEntity> topRatedMoviesList;

  const MovieState({
    this.status = Moviestatus.none,
    this.type = Movietype.none,
    this.msg = '',
    this.movies = const [],
    this.popularMoviesList = const [],
    this.nowPlayingMoviesList = const [],
    this.topRatedMoviesList = const [],
  });

  @override
  List<Object> get props => [
    status,
    type,
    msg,
    movies,
    popularMoviesList,
    nowPlayingMoviesList,
    topRatedMoviesList,
  ];

  MovieState copyWith({
    Moviestatus? status,
    Movietype? type,
    String? msg,
    List<MovieEntity>? movies,
    List<MovieEntity>? popularMoviesList,
    List<MovieEntity>? nowPlayingMoviesList,
    List<MovieEntity>? topRatedMoviesList,
  }) {
    return MovieState(
      msg: msg ?? this.msg,
      status: status ?? this.status,
      type: type ?? this.type,
      movies: movies ?? this.movies,
      nowPlayingMoviesList: nowPlayingMoviesList ?? this.nowPlayingMoviesList,
      popularMoviesList: popularMoviesList ?? this.popularMoviesList,
      topRatedMoviesList: topRatedMoviesList ?? this.topRatedMoviesList,
    );
  }
}
