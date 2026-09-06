import 'package:court_flix/core/extensions/sizedbox_extension.dart';
import 'package:court_flix/core/repository/api_constants.dart';
import 'package:flutter/material.dart';

class ComingSoonCard extends StatelessWidget {
  final String seasonText;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> genres;

  final VoidCallback? onRemind;
  final VoidCallback? onShare;

  const ComingSoonCard({
    super.key,
    required this.seasonText,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.genres,
    this.onRemind,
    this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(seasonText, style: const TextStyle(color: Colors.white70, fontSize: 14)),
          8.height,
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          8.height,
          Text(
            description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.4),
          ),
          10.height,
          Wrap(
            spacing: 8,
            children: List.generate(genres.length, (index) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    genres[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  if (index != genres.length - 1)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text("•", style: TextStyle(color: Colors.white70)),
                    ),
                ],
              );
            }),
          ),
          14.height,
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              '${ApiConstants.imageBaseUrl}$imageUrl',
              width: double.infinity,
              height: 210,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Container(
                  height: 210,
                  color: Colors.grey.shade900,
                  child: const Center(child: CircularProgressIndicator(color: Colors.white)),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 210,
                  color: Colors.grey.shade900,
                  child: const Icon(Icons.movie, color: Colors.white54, size: 50),
                );
              },
            ),
          ),
          10.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: onRemind,
                child: Column(
                  children: [
                    const Icon(Icons.notifications_none, color: Colors.white, size: 27),
                    4.height,
                    const Text("Remind Me", style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
              ),
              35.width,
              GestureDetector(
                onTap: onShare,
                child: Column(
                  children: [
                    const Icon(Icons.share, color: Colors.white, size: 27),
                    4.height,
                    const Text("Share", style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          15.height,
          Container(height: 1, color: Colors.white10),
        ],
      ),
    );
  }
}
