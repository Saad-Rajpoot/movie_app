import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/api_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/core/constants/app_constant.dart';
import 'package:shimmer/shimmer.dart';

class MovieCardNowShowing extends StatelessWidget {
  final String title;
  final double rating;
  final String posterUrl;

  const MovieCardNowShowing({super.key,
    required this.title,
    required this.rating,
    required this.posterUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 2 / 3, // Maintain aspect ratio
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl: '${ApiConstants.imageBaseUrl}$posterUrl',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(height: 2),
            Flexible(
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 16),
                  Text('$rating/10 IMDb', style: AppConstants.starTextStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class ShimmerMovieCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 2 / 3,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 14,
                width: 60,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
