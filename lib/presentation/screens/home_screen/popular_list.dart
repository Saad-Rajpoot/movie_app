import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/presentation/screens/detail_screen/movie_detail_screen.dart';
import 'package:movie_app/presentation/widgets/movie_card_popular.dart';

class PopularList extends StatelessWidget {
  final List<Movie> movies;

  const PopularList({super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(), // Prevent GridView from scrolling independently
        shrinkWrap: true,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailScreen(movies[index].id),
                ),
              );
            },
            child:MovieCardPopular(
              title: movie.title ?? '',
              rating: movie.voteAverage ?? 0.0,
              posterUrl: movie.backdropPath ?? '',
              duration: movie.releaseDate,
              genre: movie.genreIds ?? [],
            ),
          );
        },
      ),
    );
  }
}