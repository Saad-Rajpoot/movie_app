import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/presentation/screens/detail_screen/movie_detail_screen.dart';
import 'package:movie_app/presentation/widgets/movie_card_now_showing.dart';

class UpcomingList extends StatelessWidget {
  final List<Movie> movies;

  const UpcomingList({super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
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
          child: MovieCardNowShowing(
            title: movie.title ?? '',
            rating: movie.voteAverage ?? 0.0,
            posterUrl: movie.backdropPath ?? '',
          ),
        );
      },
    );
  }
}