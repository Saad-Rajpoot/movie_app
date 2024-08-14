import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/repositories/database_service.dart';
import 'package:movie_app/presentation/bloc/movie_detail_bloc/movie_detail_event.dart';
import 'package:movie_app/presentation/bloc/movie_detail_bloc/movie_detail_state.dart';


class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final DatabaseService databaseService;

  MovieDetailBloc(this.databaseService) : super(MovieDetailInitial()) {
    on<FetchDetailMovie>(_onFetchMovieById);
  }

  void _onFetchMovieById(FetchDetailMovie event, Emitter<MovieDetailState> emit) async {
    emit(MovieDetailLoading());
    try {
      final movie = await databaseService.fetchByMovieId(event.id);
      emit(MovieDetailLoaded(movie));
    } catch (e) {
      emit(MovieDetailError(e.toString()));
    }
  }
}