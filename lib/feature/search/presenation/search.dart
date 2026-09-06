import 'package:court_flix/core/extensions/sizedbox_extension.dart';
import 'package:court_flix/core/shared%20widget/common_navbar.dart';
import 'package:court_flix/core/shared%20widget/snackbar.dart';
import 'package:court_flix/feature/search/presenation/bloc/bloc/topsearch_bloc.dart';
import 'package:court_flix/feature/search/presenation/widgets/commonTextfield.dart';
import 'package:court_flix/feature/search/presenation/widgets/topSearchcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CommonBottomNavBar(
        currentIndex: 1,
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

              break;
            default:
          }
        },
      ),
      body: BlocConsumer<TopsearchBloc, TopsearchState>(
        listener: (context, state) {
          if (state.status == topSerachstatus.failure) {
            AppSnackbar.error(context, state.msg);
          }
          if (state.status == topSerachstatus.success && state.msg.isNotEmpty) {
            AppSnackbar.success(context, state.msg);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonSearchField(
                  onChanged: (value) {
                    context.read<TopsearchBloc>().add(GetTopSearchesEvent(query: value));
                  },
                  onMicTap: () {},
                ),
                30.height,
                Text(
                  "Top Searches",
                  style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                ),
                20.height,
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Topsearchcard(
                          title: state.searchResults.isNotEmpty
                              ? state.searchResults[index].title
                              : "No Title",
                          networkimage:
                              state.searchResults.isNotEmpty &&
                                  state.searchResults[index].posterPath != null
                              ? state.searchResults[index].posterPath!
                              : "https://via.placeholder.com/150",
                          onpressed: () {},
                        ),
                      );
                    },
                    itemCount: state.searchResults.isNotEmpty ? state.searchResults.length : 0,
                    // shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
