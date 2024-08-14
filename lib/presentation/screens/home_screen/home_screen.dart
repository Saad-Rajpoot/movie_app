import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/connectivity_bloc/connectivity_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_list_bloc/movie_list_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_list_bloc/movie_list_state.dart';
import 'package:movie_app/presentation/widgets/custom_app_bar.dart';
import 'package:movie_app/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:movie_app/presentation/widgets/movie_card_now_showing.dart';
import 'package:movie_app/presentation/widgets/movie_card_popular.dart';
import 'package:movie_app/presentation/widgets/section_header.dart';
import 'upcoming_list.dart';
import 'popular_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          if (state is ConnectivityOffline) {
            return const Center(
              child: Text(
                  'You are offline. Please check your internet connection.'),
            );
          }

          // Continue showing the movie lists when online
          return ListView(
            children: [
              SectionHeader(title: 'Now Showing', onPressed: () {}),
              SizedBox(
                height: 300,
                child: BlocBuilder<MovieListBloc, MovieDetailState>(
                  builder: (context, state) {
                    if (state is MovieListLoading) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => ShimmerMovieCard(),
                      );
                    } else if (state is MovieListLoaded) {
                      return UpcomingList(movies: state.upcomingMovies);
                    } else if (state is MovieListError) {
                      return Center(child: Text('Error: ${state.message}'));
                    }
                    return Container();
                  },
                ),

              ),
              SectionHeader(title: 'Popular', onPressed: () {}),
              BlocBuilder<MovieListBloc, MovieDetailState>(
                builder: (context, state) {
                  if (state is MovieListLoading) {
                    return ListView.builder(
                      itemCount: 5,
                      physics: const NeverScrollableScrollPhysics(),
                      // Prevent GridView from scrolling independently
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          ShimmerMovieCardPopular(),
                    );
                  } else if (state is MovieListLoaded) {
                    return PopularList(movies: state.popularMovies);
                  } else if (state is MovieListError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }
                  return Container();
                },
              ),
            ],
          );
        }
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}