import 'package:court_flix/core/repository/api_constants.dart';
import 'package:court_flix/feature/homePage/Domain/entity/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Sectionwidget extends StatelessWidget {
  final String sectionname;
  final int count;
  final List<MovieEntity> movieList;
  final bool Isloading;

  const Sectionwidget({
    super.key,
    required this.sectionname,
    required this.count,
    required this.movieList,
    required this.Isloading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionname,
          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        SizedBox(
          height: 160,
          width: 400,
          child: Isloading
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: count,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade800,
                        highlightColor: Colors.grey.shade600,
                        child: Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: count,
                  itemBuilder: (context, index) {
                    final movie = movieList[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          '${ApiConstants.imageBaseUrl}${movie.posterPath}',
                          width: 100,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
