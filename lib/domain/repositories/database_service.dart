import 'dart:async';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/entities/movie_detail.dart';

abstract class DatabaseService {
  Future<List<Movie>> fetchUpcomingList();
  Future<List<Movie>> fetchPopularList();
  Future<MovieDetail> fetchByMovieId(String id);
}