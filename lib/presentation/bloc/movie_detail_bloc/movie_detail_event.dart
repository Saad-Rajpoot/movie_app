import 'package:equatable/equatable.dart';

abstract class MovieDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchDetailMovie extends MovieDetailEvent {
  final String id;

  FetchDetailMovie(this.id);
}
