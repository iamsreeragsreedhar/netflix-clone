import 'package:bloc/bloc.dart';
import 'package:court_flix/feature/homePage/Domain/entity/movie_entity.dart';
import 'package:court_flix/feature/homePage/Domain/usecase/movie_usecase.dart';
import 'package:court_flix/feature/homePage/Domain/usecase/now_playing_usecase.dart';
import 'package:court_flix/feature/homePage/Domain/usecase/popular_movies_usecase.dart';
import 'package:court_flix/feature/homePage/Domain/usecase/toprated_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetTrendingMovies usecase;
  final NowPlayingUsecase nowPlayingusecase;
  final PopularMoviesUsecase popularMoviesUsecase;
  final TopratedUsecase topratedUsecase;
  MovieBloc(
    this.usecase, {
    required this.nowPlayingusecase,
    required this.popularMoviesUsecase,
    required this.topratedUsecase,
  }) : super(MovieState()) {
    on<FetchTrendingMoviesEvent>(fetchtrendingmovies);
    on<popularMoviesEvent>(popularMovies);
    on<nowPlayingMoviesEvent>(nowPlayingMovies);
    on<topRatedMoviesEvent>(topRatedMovies);
    on<refreshMoviesEvent>(refreshMovies);
  }

  Future<void> fetchtrendingmovies(FetchTrendingMoviesEvent event, Emitter<MovieState> emit) async {
    emit(state.copyWith(status: Moviestatus.loading, type: Movietype.trending));
    try {
      final result = await usecase.call();

      print(" result from bloc $result");

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              msg: failure.message,
              status: Moviestatus.failure,
              type: Movietype.trending,
            ),
          );
        },

        (movie) {
          emit(
            state.copyWith(
              msg: "fetched successfully",
              status: Moviestatus.success,
              type: Movietype.trending,
              movies: movie,
            ),
          );
          print(" emitted result bloc ");
        },
      );
    } catch (e) {
      emit(state.copyWith(status: Moviestatus.failure, msg: e.toString()));
    }
  }

  Future<void> popularMovies(popularMoviesEvent event, Emitter<MovieState> emit) async {
    emit(state.copyWith(status: Moviestatus.loading, type: Movietype.popular));
    try {
      final result = await popularMoviesUsecase.call();

      print(" result from bloc $result");

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              msg: failure.message,
              status: Moviestatus.failure,
              type: Movietype.popular,
            ),
          );
        },

        (movie) {
          emit(
            state.copyWith(
              msg: "fetched successfully",
              status: Moviestatus.success,
              type: Movietype.popular,
              popularMoviesList: movie,
            ),
          );
          print(" emitted result bloc ");
        },
      );
    } catch (e) {
      emit(state.copyWith(status: Moviestatus.failure, msg: e.toString()));
    }
  }

  Future<void> nowPlayingMovies(nowPlayingMoviesEvent event, Emitter<MovieState> emit) async {
    emit(state.copyWith(status: Moviestatus.loading, type: Movietype.watchingnow));
    try {
      final result = await nowPlayingusecase.call();

      print(" result from bloc $result");

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              msg: failure.message,
              status: Moviestatus.failure,
              type: Movietype.watchingnow,
            ),
          );
        },

        (movie) {
          emit(
            state.copyWith(
              msg: "fetched successfully",
              status: Moviestatus.success,
              type: Movietype.watchingnow,
              nowPlayingMoviesList: movie,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(status: Moviestatus.failure, msg: e.toString()));
    }
  }

  Future<void> topRatedMovies(topRatedMoviesEvent event, Emitter<MovieState> emit) async {
    emit(state.copyWith(status: Moviestatus.loading, type: Movietype.toprated));
    try {
      final result = await topratedUsecase.call();

      print(" result from bloc $result");

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              msg: failure.message,
              status: Moviestatus.failure,
              type: Movietype.toprated,
            ),
          );
        },

        (movie) {
          emit(
            state.copyWith(
              msg: "fetched successfully",
              status: Moviestatus.success,
              type: Movietype.toprated,
              topRatedMoviesList: movie,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(status: Moviestatus.failure, msg: e.toString()));
    }
  }

  Future refreshMovies(refreshMoviesEvent event, Emitter<MovieState> emit) async {
    emit(state.copyWith(status: Moviestatus.loading, type: Movietype.trending));
    try {
      final result = Future.wait([
        usecase.call(),
        popularMoviesUsecase.call(),
        nowPlayingusecase.call(),
        topratedUsecase.call(),
      ]);

      print(" result from bloc $result");

      emit(
        state.copyWith(
          msg: "fetched successfully",
          status: Moviestatus.success,
          type: Movietype.trending,
          movies: (await result)[0] as List<MovieEntity>,
          popularMoviesList: (await result)[1] as List<MovieEntity>,
          nowPlayingMoviesList: (await result)[2] as List<MovieEntity>,
          topRatedMoviesList: (await result)[3] as List<MovieEntity>,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: Moviestatus.failure, msg: e.toString()));
    }
  }
}
