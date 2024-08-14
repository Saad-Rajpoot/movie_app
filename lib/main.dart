import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/dependency_injection/injection.dart';
import 'presentation/bloc/connectivity_bloc/connectivity_bloc.dart';
import 'presentation/bloc/movie_list_bloc/movie_list_bloc.dart';
import 'presentation/bloc/movie_list_bloc/movie_list_event.dart';
import 'presentation/screens/home_screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injectionSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => getIt<MovieListBloc>()
              ..add(FetchUpcomingMovies())
              ..add(FetchPopularMovies()),
          ),
          BlocProvider(
            create: (_) => ConnectivityBloc(Connectivity()),
          ),
    ],
    child:MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    )
    );
  }
}

