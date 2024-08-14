import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_detail_bloc/movie_detail_state.dart';
import 'package:movie_app/presentation/screens/detail_screen/movie_detail_content.dart';

class MovieDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        if (state is MovieDetailLoading) {
          return const MovieDetailShimmerEffect();
        } else if (state is MovieDetailLoaded) {
          final movie = state.movie;
          return MovieDetailContent(movie: movie);
        } else if (state is MovieDetailError) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }
}