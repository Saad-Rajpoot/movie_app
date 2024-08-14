import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network_handling/dio_client.dart';
import 'package:movie_app/data/repositories/movie_database_service.dart';
import 'package:movie_app/domain/repositories/database_service.dart';
import 'package:movie_app/presentation/bloc/connectivity_bloc/connectivity_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_list_bloc/movie_list_bloc.dart';

final getIt = GetIt.instance;

void injectionSetup() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt()));
  getIt.registerLazySingleton<DatabaseService>(() => MovieDatabaseService(getIt()));
  getIt.registerFactory(() => MovieListBloc(getIt()));
  getIt.registerFactory(() => MovieDetailBloc(getIt()));
  getIt.registerFactory(() => ConnectivityBloc(getIt()));
}
