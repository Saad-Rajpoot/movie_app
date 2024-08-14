import 'package:movie_app/core/constants/api_constant.dart';
import 'package:movie_app/core/error_handling/exceptions.dart';
import 'package:movie_app/core/network_handling/dio_client.dart';
import 'package:movie_app/data/model/movie_json.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/data/model/movie_detail_json.dart';
import 'package:movie_app/domain/entities/movie_detail.dart';
import 'package:movie_app/domain/repositories/database_service.dart';

class MovieDatabaseService implements DatabaseService {
  final DioClient dioClient;

  MovieDatabaseService(this.dioClient);

  @override
  Future<List<Movie>> fetchPopularList() async {
    final response = await dioClient.get(ApiConstants.popularMoviesEndpoint);
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['results'];
      return data.map((json) => MovieJson.fromJson(json).toDomain()).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<Movie>> fetchUpcomingList() async {
    final response = await dioClient.get(ApiConstants.upcomingMoviesEndpoint);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['results'];
      return data.map((json) => MovieJson.fromJson(json).toDomain()).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieDetail> fetchByMovieId(String id) async {
    final response = await dioClient.get('${ApiConstants.baseUrl}$id');
    if (response.statusCode == 200) {
      MovieDetail movieDetailJson = MovieDetailJson.fromJson(response.data).toDomain();
      return movieDetailJson;
    } else {
      throw ServerException();
    }
  }
}