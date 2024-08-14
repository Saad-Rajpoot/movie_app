class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3/movie/';
  static const String imageBaseUrl = 'http://image.tmdb.org/t/p/original';
  static const String apiKey = 'a00ebc7f31179cd0772206a77728970e';
  static const String authorizationToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMDBlYmM3ZjMxMTc5Y2QwNzcyMjA2YTc3NzI4OTcwZSIsIm5iZiI6MTcyMzU2NTk5OC4wOTA2MjEsInN1YiI6IjY2YmI4NWRiZDVlMDhmZTQ3ZjJkM2YyNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KTiPykDZRfhzIorLG4IVR8jeBdT0N9ioxEKEUXi7LL0';
  static const String upcomingMoviesEndpoint = 'upcoming$params';
  static const String popularMoviesEndpoint = 'popular$params';
  static const String params = '$languageParam&page=1';
  static const String languageParam = '?language=en-US';
  static const String headerParam = 'application/json';
}