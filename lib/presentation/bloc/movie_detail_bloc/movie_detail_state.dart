import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_detail.dart';

abstract class MovieDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetail movie;

  MovieDetailLoaded(this.movie);

  @override
  List<Object?> get props => [movie];
}

class MovieDetailError extends MovieDetailState {
  final String message;

  MovieDetailError(this.message);

  @override
  List<Object?> get props => [message];
}