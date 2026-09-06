import 'dart:developer';

import 'package:court_flix/core/extensions/sizedbox_extension.dart';
import 'package:court_flix/core/repository/api_constants.dart';
import 'package:court_flix/core/shared%20widget/common_navbar.dart';
import 'package:court_flix/core/shared%20widget/snackbar.dart';
import 'package:court_flix/feature/homePage/Presentation/bloc/bloc/movie_bloc.dart';
import 'package:court_flix/feature/homePage/Presentation/widgets/IconTextwidget.dart';
import 'package:court_flix/feature/homePage/Presentation/widgets/PlayButtonWidget.dart';
import 'package:court_flix/feature/homePage/Presentation/widgets/Previewwidget.dart';
import 'package:court_flix/feature/homePage/Presentation/widgets/SectionWidget.dart';
import 'package:court_flix/feature/homePage/Presentation/widgets/TextButtonWidget.dart';
import 'package:court_flix/feature/homePage/Presentation/widgets/top100.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<MovieBloc>().add(FetchTrendingMoviesEvent());
    context.read<MovieBloc>().add(popularMoviesEvent());
    context.read<MovieBloc>().add(nowPlayingMoviesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.black,

      bottomNavigationBar: CommonBottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/home');
            case 1:
              context.go('/search');
            case 2:
              context.go('/coming-soon');
            case 3:
              context.go('/downloads');
            case 4:
              context.go('/more');

              break;
            default:
          }
        },
      ),

      body: RefreshIndicator(
        color: Colors.white,
        onRefresh: () async {
          context.read<MovieBloc>().add(FetchTrendingMoviesEvent());
          context.read<MovieBloc>().add(popularMoviesEvent());
          context.read<MovieBloc>().add(nowPlayingMoviesEvent());
        },
        child: BlocConsumer<MovieBloc, MovieState>(
          listener: (context, state) {
            log('STATUS: ${state.status}');
            log('MESSAGE: ${state.msg}');

            if (state.status == Moviestatus.failure) {
              AppSnackbar.error(context, state.msg);
            }
            if (state.status == Moviestatus.success && state.msg.isNotEmpty) {
              AppSnackbar.success(context, state.msg);
            }
          },

          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.55,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: state.movies.isNotEmpty
                              ? Image.network(
                                  '${ApiConstants.imageBaseUrl}'
                                  '${state.movies.first.backdropPath}',
                                  fit: BoxFit.cover,
                                )
                              : const SizedBox(),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.black],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left: 20,
                          right: 20,
                          child: Row(
                            children: [
                              Image.asset('assets/logo/Nlogo.png', height: 30, width: 30),

                              10.width,

                              Textbuttonwidget(buttonname: "TV Shows"),

                              10.width,

                              Textbuttonwidget(buttonname: "Movies"),
                              10.width,
                              Textbuttonwidget(buttonname: "My List"),
                            ],
                          ),
                        ),

                        Positioned(
                          bottom: 80,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Top100(trendingnumber: '2', trendingplace: "Nigeria"),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icontextwidget(data: "My List", icon: Icons.add),

                              35.width,

                              Playbuttonwidget(),

                              35.width,

                              Icontextwidget(data: "Info", icon: Icons.info_outline_rounded),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Sectionwidget(
                    Isloading: state.status == Moviestatus.loading ? true : false,
                    sectionname: "Popular on Netflix",
                    count: state.popularMoviesList.length,
                    movieList: state.popularMoviesList,
                  ),
                  20.height,

                  Sectionwidget(
                    Isloading: state.status == Moviestatus.loading ? true : false,
                    sectionname: "Trending Now",
                    count: state.nowPlayingMoviesList.length,
                    movieList: state.nowPlayingMoviesList,
                  ),
                  20.height,

                  Sectionwidget(
                    Isloading: state.status == Moviestatus.loading ? true : false,
                    sectionname: "Top Rated",
                    count: state.topRatedMoviesList.length,
                    movieList: state.topRatedMoviesList,
                  ),

                  30.height,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
