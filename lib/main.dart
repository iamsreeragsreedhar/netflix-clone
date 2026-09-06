import 'package:court_flix/core/di/service_locator.dart';
import 'package:court_flix/core/route/routes.dart';
import 'package:court_flix/core/theme/theme.dart';
import 'package:court_flix/feature/homePage/Presentation/bloc/bloc/movie_bloc.dart';
import 'package:court_flix/feature/search/presenation/bloc/bloc/topsearch_bloc.dart';
import 'package:court_flix/feature/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await InitDepedencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieBloc(
            sl(),
            nowPlayingusecase: sl(),
            popularMoviesUsecase: sl(),
            topratedUsecase: sl(),
          ),
        ),
        BlocProvider(create: (context) => TopsearchBloc(sl(), sl())),
      ],
      child: MaterialApp.router(
        routerConfig: routes,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: DarkTheme.theme,
      ),
    );
  }
}
