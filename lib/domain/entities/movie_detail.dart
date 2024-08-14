class MovieDetail {
  final bool? adult;
  final String? backdropPath;
  final BelongsToCollectionMovieDetail? belongsToCollection;
  final int? budget;
  final List<GenreMovieDetail>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompanyMovieDetail>? productionCompanies;
  final List<ProductionCountryMovieDetail>? productionCountries;
  final DateTime? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguageMovieDetail>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  MovieDetail({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

}

class BelongsToCollectionMovieDetail {
  final int? id;
  final String? name;
  final String? posterPath;
  final String? backdropPath;

  BelongsToCollectionMovieDetail({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

}

class GenreMovieDetail {
  final int? id;
  final String? name;

  GenreMovieDetail({
    this.id,
    this.name,
  });

}

class ProductionCompanyMovieDetail {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  ProductionCompanyMovieDetail({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

}

class ProductionCountryMovieDetail {
  final String? iso31661;
  final String? name;

  ProductionCountryMovieDetail({
    this.iso31661,
    this.name,
  });

}

class SpokenLanguageMovieDetail {
  final String? englishName;
  final String? iso6391;
  final String? name;

  SpokenLanguageMovieDetail({
    this.englishName,
    this.iso6391,
    this.name,
  });

}
