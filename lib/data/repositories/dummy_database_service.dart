import 'package:movie_app/core/network_handling/dio_client.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/entities/movie_detail.dart';
import 'package:movie_app/domain/repositories/database_service.dart';

class DummyDatabaseService implements DatabaseService {
  final DioClient dioClient;

  DummyDatabaseService(this.dioClient);
  @override
  Future<List<Movie>> fetchPopularList() async {
    return [
      Movie(
        adult: false,
        backdropPath: "https://mir-s3-cdn-cf.behance.net/project_modules/hd/84f0ea133455823.65f1b5d357550.png",
        genreIds: [16, 10751, 35, 28],
        id: 519182,
        originalLanguage: "en",
        originalTitle: "Despicable Me 4",
        overview:
        "Gru and Lucy and their girls—Margo, Edith and Agnes—welcome a new member to the Gru family, Gru Jr., who is intent on tormenting his dad. Gru also faces a new nemesis in Maxime Le Mal and his femme fatale girlfriend Valentina, forcing the family to go on the run.",
        popularity: 3499.057,
        posterPath: "https://mir-s3-cdn-cf.behance.net/project_modules/hd/84f0ea133455823.65f1b5d357550.png",
        releaseDate: DateTime.now(),
        title: "Despicable Me 4",
        video: false,
        voteAverage: 7.33,
        voteCount: 935,
      ),
      Movie(
        adult: false,
        backdropPath: "https://mir-s3-cdn-cf.behance.net/project_modules/hd/84f0ea133455823.65f1b5d357550.png",
        genreIds: [16, 10751, 35, 28],
        id: 519182,
        originalLanguage: "en",
        originalTitle: "Despicable Me 4",
        overview:
        "Gru and Lucy and their girls—Margo, Edith and Agnes—welcome a new member to the Gru family, Gru Jr., who is intent on tormenting his dad. Gru also faces a new nemesis in Maxime Le Mal and his femme fatale girlfriend Valentina, forcing the family to go on the run.",
        popularity: 3499.057,
        posterPath: "https://mir-s3-cdn-cf.behance.net/project_modules/hd/84f0ea133455823.65f1b5d357550.png",
        releaseDate: DateTime.now(),
        title: "Despicable Me 12",
        video: false,
        voteAverage: 7.33,
        voteCount: 935,
      )
    ];
  }

  @override
  Future<List<Movie>> fetchUpcomingList() async {
   return [
     Movie(
       adult: false,
       backdropPath: "https://mir-s3-cdn-cf.behance.net/project_modules/hd/84f0ea133455823.65f1b5d357550.png",
       genreIds: [16, 10751, 35, 28],
       id: 519182,
       originalLanguage: "en",
       originalTitle: "Despicable Me 4",
       overview:
       "Gru and Lucy and their girls—Margo, Edith and Agnes—welcome a new member to the Gru family, Gru Jr., who is intent on tormenting his dad. Gru also faces a new nemesis in Maxime Le Mal and his femme fatale girlfriend Valentina, forcing the family to go on the run.",
       popularity: 3499.057,
       posterPath: "https://mir-s3-cdn-cf.behance.net/project_modules/hd/84f0ea133455823.65f1b5d357550.png",
       releaseDate: DateTime.now(),
       title: "Despicable Me 1",
       video: false,
       voteAverage: 7.33,
       voteCount: 935,
     ),
     Movie(
       adult: false,
       backdropPath: "https://mir-s3-cdn-cf.behance.net/project_modules/hd/84f0ea133455823.65f1b5d357550.png",
       genreIds: [16, 10751, 35, 28],
       id: 519182,
       originalLanguage: "en",
       originalTitle: "Despicable Me 4",
       overview:
       "Gru and Lucy and their girls—Margo, Edith and Agnes—welcome a new member to the Gru family, Gru Jr., who is intent on tormenting his dad. Gru also faces a new nemesis in Maxime Le Mal and his femme fatale girlfriend Valentina, forcing the family to go on the run.",
       popularity: 3499.057,
       posterPath: "https://mir-s3-cdn-cf.behance.net/project_modules/hd/84f0ea133455823.65f1b5d357550.png",
       releaseDate: DateTime.now(),
       title: "Despicable Me 39",
       video: false,
       voteAverage: 7.33,
       voteCount: 935,
     )
    ];
  }

  @override
  Future<MovieDetail> fetchByMovieId(String id) async  {
   return MovieDetail(
     adult: false,
     backdropPath: "/path/to/backdrop.jpg",

     budget: 200000000,
     homepage: "https://www.example.com",
     id: 123456,
     imdbId: "tt1234567",
     originCountry: ["US"],
     originalLanguage: "en",
     originalTitle: "Example Movie Title",
     overview: "This is a brief overview of the movie. It describes the plot and main events.",
     popularity: 1500.5,
     posterPath: "/path/to/poster.jpg",
     releaseDate: DateTime.now(),
     revenue: 1000000000,
     runtime: 120,
     status: "Released",
     tagline: "This is the movie tagline",
     title: "Example Movie Title",
     video: false,
     voteAverage: 8.5,
     voteCount: 20000,
   );

  }
}