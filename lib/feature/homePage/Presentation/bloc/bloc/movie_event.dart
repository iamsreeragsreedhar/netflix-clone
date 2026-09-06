part of 'movie_bloc.dart';

class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class FetchTrendingMoviesEvent extends MovieEvent {
  const FetchTrendingMoviesEvent();
  @override
  List<Object> get props => [];
}

class popularMoviesEvent extends MovieEvent {
  const popularMoviesEvent();
  @override
  List<Object> get props => [];
}

class nowPlayingMoviesEvent extends MovieEvent {
  const nowPlayingMoviesEvent();
  @override
  List<Object> get props => [];
}

class topRatedMoviesEvent extends MovieEvent {
  const topRatedMoviesEvent();
  @override
  List<Object> get props => [];
}

class refreshMoviesEvent extends MovieEvent {
  const refreshMoviesEvent();
  @override
  List<Object> get props => [];
}
