import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ComingSoonCardSkeleton extends StatelessWidget {
  const ComingSoonCardSkeleton({super.key});

  Widget skeleton({required double width, required double height, double radius = 4}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade900,
      highlightColor: Colors.grey.shade700,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          skeleton(width: 70, height: 10),
          const SizedBox(height: 6),
          skeleton(width: 150, height: 20),
          const SizedBox(height: 8),
          skeleton(width: double.infinity, height: 10),
          const SizedBox(height: 5),

          skeleton(width: double.infinity, height: 10),
          const SizedBox(height: 5),
          skeleton(width: 220, height: 10),
          const SizedBox(height: 10),
          Row(
            children: [
              skeleton(width: 45, height: 9),
              const SizedBox(width: 8),
              skeleton(width: 8, height: 8, radius: 10),
              const SizedBox(width: 8),
              skeleton(width: 55, height: 9),
              const SizedBox(width: 8),
              skeleton(width: 8, height: 8, radius: 10),
              const SizedBox(width: 8),
              skeleton(width: 50, height: 9),
            ],
          ),
          const SizedBox(height: 10),
          skeleton(width: double.infinity, height: 170, radius: 4),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  skeleton(width: 20, height: 20, radius: 20),
                  const SizedBox(height: 4),
                  skeleton(width: 50, height: 8),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                children: [
                  skeleton(width: 20, height: 20, radius: 20),
                  const SizedBox(height: 4),
                  skeleton(width: 30, height: 8),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          Container(height: 1, color: Colors.white12),
        ],
      ),
    );
  }
}
