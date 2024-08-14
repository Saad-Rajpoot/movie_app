import 'package:equatable/equatable.dart';

abstract class MovieListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchPopularMovies extends MovieListEvent {}

class FetchUpcomingMovies extends MovieListEvent {}

class FetchMovieById extends MovieListEvent {
  final String id;

  FetchMovieById(this.id);
}
