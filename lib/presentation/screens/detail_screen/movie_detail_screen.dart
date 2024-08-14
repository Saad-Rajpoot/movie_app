import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/dependency_injection/injection.dart';
import 'package:movie_app/presentation/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_detail_bloc/movie_detail_event.dart';
import 'package:movie_app/presentation/screens/detail_screen/movie_detail_view.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  MovieDetailScreen(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => getIt<MovieDetailBloc>()..add(FetchDetailMovie(id.toString())),
        child: MovieDetailView(),
      ),
    );
  }
}




