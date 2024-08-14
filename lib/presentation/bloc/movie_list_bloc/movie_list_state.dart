import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie.dart';

abstract class MovieDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieListInitial extends MovieDetailState {}

class MovieListLoading extends MovieDetailState {}

class MovieListLoaded extends MovieDetailState {
  final List<Movie> popularMovies;
  final List<Movie> upcomingMovies;

  MovieListLoaded({required this.popularMovies, required this.upcomingMovies});

  @override
  List<Object?> get props => [popularMovies, upcomingMovies];
}

class MovieListError extends MovieDetailState {
  final String message;

  MovieListError(this.message);

  @override
  List<Object?> get props => [message];
}

