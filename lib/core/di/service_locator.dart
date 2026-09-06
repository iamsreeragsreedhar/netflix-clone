import 'package:court_flix/core/repository/dio_client.dart';
import 'package:court_flix/feature/homePage/Data/datasource/movie_data_source.dart';
import 'package:court_flix/feature/homePage/Data/repository/movie_repoimpl.dart';
import 'package:court_flix/feature/homePage/Domain/repository/movie_repository.dart';
import 'package:court_flix/feature/homePage/Domain/usecase/movie_usecase.dart';
import 'package:court_flix/feature/homePage/Domain/usecase/now_playing_usecase.dart';
import 'package:court_flix/feature/homePage/Domain/usecase/popular_movies_usecase.dart';
import 'package:court_flix/feature/homePage/Domain/usecase/toprated_usecase.dart';
import 'package:court_flix/feature/homePage/Presentation/bloc/bloc/movie_bloc.dart';
import 'package:court_flix/feature/search/data/data_source/search_datasource.dart';
import 'package:court_flix/feature/search/data/repository/topsearch_repoimpl.dart';
import 'package:court_flix/feature/search/domain/repository/topsearch_repository.dart';
import 'package:court_flix/feature/search/domain/usecase/comingsoon_usecase.dart';
import 'package:court_flix/feature/search/domain/usecase/topsearch_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> InitDepedencies() async {
  sl.registerLazySingleton(() => MovieDataSource(sl()));
  sl.registerLazySingleton(() => topSearchDatasource(dio: sl()));

  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));
  sl.registerLazySingleton<TopsearchRepository>(() => TopsearchRepoimpl(search: sl()));
  sl.registerLazySingleton<dioClient>(() => dioClient());

  sl.registerLazySingleton<ComingsoonUsecase>(() => ComingsoonUsecase(repository: sl()));
  sl.registerLazySingleton<GetTrendingMovies>(() => GetTrendingMovies(sl()));
  sl.registerLazySingleton<NowPlayingUsecase>(() => NowPlayingUsecase(sl()));
  sl.registerLazySingleton<PopularMoviesUsecase>(() => PopularMoviesUsecase(sl()));
  sl.registerLazySingleton<TopratedUsecase>(() => TopratedUsecase(sl()));
  sl.registerLazySingleton<TopsearchUsecase>(() => TopsearchUsecase(repository: sl()));

  ///// One time Declaration
  sl.registerFactory(() => Dio());
  sl.registerFactory(
    () =>
        MovieBloc(sl(), nowPlayingusecase: sl(), popularMoviesUsecase: sl(), topratedUsecase: sl()),
  );
}
