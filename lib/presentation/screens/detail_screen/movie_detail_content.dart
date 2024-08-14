import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/api_constant.dart';
import 'package:movie_app/core/constants/app_constant.dart';
import 'package:movie_app/domain/entities/movie_detail.dart';
import 'package:movie_app/presentation/widgets/section_header.dart';
import 'package:shimmer/shimmer.dart';


class MovieDetailContent extends StatelessWidget {
  final MovieDetail movie;

  const MovieDetailContent({required this.movie});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // App bar with background image
        SliverAppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          forceMaterialTransparency: true,
          expandedHeight: 260,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: CachedNetworkImage(
              imageUrl: '${ApiConstants.imageBaseUrl}${movie.posterPath}',
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
        // Main content
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            movie.originalTitle ?? '',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Merriweather',
                            ),
                          ),
                        ),
                        Icon(Icons.bookmark_outline)
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text('${movie.voteAverage.toString()}/10 IMDb',
                            style: AppConstants.starTextStyle),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Wrap(
                        spacing: 5.0,
                        children: movie.genres!
                            .map((genre) => Chip(
                            shape: StadiumBorder(
                                side: BorderSide(
                                    color: Colors.transparent)),
                            backgroundColor: Color(0xffDBE3FF),
                            padding: EdgeInsets.zero,
                            label: Text(genre.name.toString())))
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _buildColumn(
                          title: 'Length',
                          description: AppConstants.formatDuration(
                              movie.releaseDate!, false),
                        ),
                        _buildColumn(
                          title: 'Language',
                          description:
                          movie.spokenLanguages!.first.name ?? '',
                        ),
                        _buildColumn(
                          title: 'Rating',
                          description: 'PG-${movie.voteCount.toString()}',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Merriweather',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      movie.overview ?? '',
                      style: TextStyle(
                          fontSize: 14,
                          color: const Color(0xff9C9C9C).withOpacity(0.8),
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Mulish'),
                    ),
                    SectionHeader(title: 'Cast', onPressed: () {}),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: movie.productionCompanies!.length,
                        itemBuilder: (context, index) {
                          final movieDetail = movie.productionCompanies![index];
                          return Container(
                            width: 130,
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Container(
                                    color: Colors.grey.shade200,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                      '${ApiConstants.imageBaseUrl}${movieDetail.logoPath}',
                                      width: 130,
                                      height: 130,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Container(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  movieDetail.name ?? '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColumn({required String title, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              color: Color(0Xff9C9C9C),
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
        Text(
          description,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class MovieDetailShimmerEffect extends StatelessWidget {
  const MovieDetailShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 240,
            color: Colors.grey,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 24,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 20,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 50,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 100,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
