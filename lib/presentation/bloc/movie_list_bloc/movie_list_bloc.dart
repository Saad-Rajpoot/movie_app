import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/repositories/database_service.dart';
import 'package:movie_app/presentation/bloc/movie_list_bloc/movie_list_state.dart';
import 'movie_list_event.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieDetailState> {
  final DatabaseService databaseService;

  MovieListBloc(this.databaseService) : super(MovieListInitial()) {
    on<FetchPopularMovies>(_onFetchPopularMovies);
    on<FetchUpcomingMovies>(_onFetchUpcomingMovies);
  }

  void _onFetchPopularMovies(FetchPopularMovies event, Emitter<MovieDetailState> emit) async {
    // Emit loading state
    emit(MovieListLoading());
    try {
      // Fetch popular movies
      final popularMovies = await databaseService.fetchPopularList();
      // Check current state
      if (state is MovieListLoaded) {
        // Update state with both popular and upcoming movies
        final currentState = state as MovieListLoaded;
        emit(MovieListLoaded(
          popularMovies: popularMovies,
          upcomingMovies: currentState.upcomingMovies,
        ));
      } else {
        // First time loading popular movies
        emit(MovieListLoaded(
          popularMovies: popularMovies,
          upcomingMovies: const [],
        ));
      }
    } catch (e) {
      emit(MovieListError(e.toString()));
    }
  }

  void _onFetchUpcomingMovies(FetchUpcomingMovies event, Emitter<MovieDetailState> emit) async {
    // Emit loading state
    emit(MovieListLoading());
    try {
      // Fetch upcoming movies
      final upcomingMovies = await databaseService.fetchUpcomingList();
      // Check current state
      if (state is MovieListLoaded) {
        // Update state with both popular and upcoming movies
        final currentState = state as MovieListLoaded;
        emit(MovieListLoaded(
          popularMovies: currentState.popularMovies,
          upcomingMovies: upcomingMovies,
        ));
      } else {
        // First time loading upcoming movies
        emit(MovieListLoaded(
          popularMovies: const [],
          upcomingMovies: upcomingMovies,
        ));
      }
    } catch (e) {
      emit(MovieListError(e.toString()));
    }
  }
}

