import 'package:court_flix/core/shared%20widget/common_navbar.dart';
import 'package:court_flix/core/shared%20widget/snackbar.dart';
import 'package:court_flix/feature/search/presenation/bloc/bloc/topsearch_bloc.dart';
import 'package:court_flix/feature/search/presenation/widgets/coming_soon_card.dart';
import 'package:court_flix/feature/search/presenation/widgets/coming_soon_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key});

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  void initState() {
    context.read<TopsearchBloc>().add(GetComingSoonEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CommonBottomNavBar(
        currentIndex: 2,
        onTap: (index) {
          print(index);
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
        onRefresh: () async {
          context.read<TopsearchBloc>().add(GetComingSoonEvent());
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                        border: Border(bottom: BorderSide(color: Colors.grey.shade800, width: 1)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(Icons.notifications, color: Colors.white, size: 25),
                      ),
                    ),

                    Text(
                      "Notifications",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Expanded(
                  child: BlocConsumer<TopsearchBloc, TopsearchState>(
                    listener: (context, state) {
                      debugPrint('STATUS: ${state.status}');
                      debugPrint('MESSAGE: ${state.msg}');
                      if (state.status == topSerachstatus.failure) {
                        AppSnackbar.error(context, state.msg);
                      }
                      if (state.status == topSerachstatus.success && state.msg.isNotEmpty) {
                        AppSnackbar.success(context, state.msg);
                      }
                    },
                    builder: (context, state) {
                      return (state.status == topSerachstatus.loading)
                          ? ComingSoonCardSkeleton()
                          : ListView.builder(
                              // shrinkWrap: true,
                              itemCount: state.comingSoonResults.isNotEmpty
                                  ? state.comingSoonResults.length
                                  : 0,
                              itemBuilder: (context, index) {
                                return ComingSoonCard(
                                  seasonText: "Season 1",
                                  title: state.comingSoonResults[index].title,
                                  description: state.comingSoonResults[index].overview,
                                  imageUrl: state.comingSoonResults[index].posterPath!,
                                  genres: state.comingSoonResults[index].genreIds
                                      .map((id) => id.toString())
                                      .toList(),
                                  onRemind: () {},
                                  onShare: () {},
                                );
                              },
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
