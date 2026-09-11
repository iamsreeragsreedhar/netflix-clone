import 'package:court_flix/core/route/main_scaffold.dart';
import 'package:court_flix/feature/homePage/Presentation/screens/home_page.dart';
import 'package:court_flix/feature/search/presenation/coming_soon.dart';
import 'package:court_flix/feature/search/presenation/downloads.dart';
import 'package:court_flix/feature/search/presenation/more.dart';
import 'package:court_flix/feature/search/presenation/search.dart';
import 'package:court_flix/feature/loginPage/login_screen.dart';
import 'package:court_flix/feature/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const home = '/';
  static const Login = '/login';
  static const HomeScreen = '/home';
  static const Search = '/search';
  static const ComingSoon = '/coming-soon';
  static const downloads = '/downloads';
  static const more = '/more';
}

// final GoRouter routes = GoRouter(
//   initialLocation: AppRoutes.home,
//   routes: [

//     GoRoute(path: AppRoutes.HomeScreen, builder: (context, state) => const HomePage()),
//     GoRoute(path: AppRoutes.Search, builder: (context, state) => const SearchScreen()),
//     GoRoute(path: AppRoutes.ComingSoon, builder: (context, state) => const ComingSoon()),
//     GoRoute(path: AppRoutes.downloads, builder: (context, state) => const downloadScreen()),
//     GoRoute(path: AppRoutes.more, builder: (context, state) => const moreScreen()),
//   ],
// );
final routes = GoRouter(
  routes: [
    GoRoute(path: AppRoutes.home, builder: (context, state) => const Splashscreen()),
    GoRoute(path: AppRoutes.Login, builder: (context, state) => const LoginScreen()),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScaffold(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [GoRoute(path: '/home', builder: (context, state) => const HomePage())],
        ),

        StatefulShellBranch(
          routes: [GoRoute(path: '/search', builder: (context, state) => const SearchScreen())],
        ),

        StatefulShellBranch(
          routes: [GoRoute(path: '/coming-soon', builder: (context, state) => const ComingSoon())],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(path: '/downloads', builder: (context, state) => const downloadScreen()),
          ],
        ),

        StatefulShellBranch(
          routes: [GoRoute(path: '/more', builder: (context, state) => const moreScreen())],
        ),
      ],
    ),
  ],
);
