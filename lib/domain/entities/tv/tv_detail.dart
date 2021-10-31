import 'package:equatable/equatable.dart';

import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/tv/tv_created_by.dart';
import 'package:ditonton/domain/entities/tv/tv_last_episode_to_air.dart';
import 'package:ditonton/domain/entities/tv/tv_network.dart';
import 'package:ditonton/domain/entities/tv/tv_production_country.dart';
import 'package:ditonton/domain/entities/tv/tv_season.dart';
import 'package:ditonton/domain/entities/tv/tv_spoken_language.dart';

class TVDetail extends Equatable {
  TVDetail({
    this.backdropPath,
    this.episodeRunTime = const [],
    this.firstAirDate,
    this.homepage,
    this.id = 0,
    this.inProduction = false,
    this.languages = const [],
    this.lastAirDate,
    this.name = '',
    this.nextEpisodeToAir,
    this.numberOfEpisodes = 0,
    this.numberOfSeasons = 0,
    this.originCountry = const [],
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity = 0.0,
    this.posterPath,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage = 0,
    this.voteCount = 0,
    this.createdBy = const [],
    this.lastEpisodeToAir = const LastEpisodeToAir(),
    this.genres = const [],
    this.networks = const [],
    this.productionCompanies = const [],
    this.productionCountries = const [],
    this.seasons = const [],
    this.spokenLanguages = const [],
  });

  final String? backdropPath;
  final List<int> episodeRunTime;
  final DateTime? firstAirDate;
  final String? homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final DateTime? lastAirDate;
  final String name;
  final Map<String, dynamic>? nextEpisodeToAir;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double popularity;
  final String? posterPath;
  final String? status;
  final String? tagline;
  final String? type;
  final double voteAverage;
  final int voteCount;
  final List<CreatedBy> createdBy;
  final LastEpisodeToAir lastEpisodeToAir;
  final List<Genre> genres;
  final List<Network> networks;
  final List<Network> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final List<Season> seasons;
  final List<SpokenLanguage> spokenLanguages;

  @override
  List<Object?> get props {
    return [
      backdropPath,
      episodeRunTime,
      firstAirDate,
      homepage,
      id,
      inProduction,
      languages,
      lastAirDate,
      name,
      nextEpisodeToAir,
      numberOfEpisodes,
      numberOfSeasons,
      originCountry,
      originalLanguage,
      originalName,
      overview,
      popularity,
      posterPath,
      status,
      tagline,
      type,
      voteAverage,
      voteCount,
      createdBy,
      lastEpisodeToAir,
      genres,
      networks,
      productionCompanies,
      productionCountries,
      seasons,
      spokenLanguages,
    ];
  }

  @override
  bool get stringify => true;

  TVDetail copyWith({
    String? backdropPath,
    List<int>? episodeRunTime,
    DateTime? firstAirDate,
    String? homepage,
    int? id,
    bool? inProduction,
    List<String>? languages,
    DateTime? lastAirDate,
    String? name,
    Map<String, dynamic>? nextEpisodeToAir,
    int? numberOfEpisodes,
    int? numberOfSeasons,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    double? popularity,
    String? posterPath,
    String? status,
    String? tagline,
    String? type,
    double? voteAverage,
    int? voteCount,
    List<CreatedBy>? createdBy,
    LastEpisodeToAir? lastEpisodeToAir,
    List<Genre>? genres,
    List<Network>? networks,
    List<Network>? productionCompanies,
    List<ProductionCountry>? productionCountries,
    List<Season>? seasons,
    List<SpokenLanguage>? spokenLanguages,
  }) {
    return TVDetail(
      backdropPath: backdropPath ?? this.backdropPath,
      episodeRunTime: episodeRunTime ?? this.episodeRunTime,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      inProduction: inProduction ?? this.inProduction,
      languages: languages ?? this.languages,
      lastAirDate: lastAirDate ?? this.lastAirDate,
      name: name ?? this.name,
      nextEpisodeToAir: nextEpisodeToAir ?? this.nextEpisodeToAir,
      numberOfEpisodes: numberOfEpisodes ?? this.numberOfEpisodes,
      numberOfSeasons: numberOfSeasons ?? this.numberOfSeasons,
      originCountry: originCountry ?? this.originCountry,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalName: originalName ?? this.originalName,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      type: type ?? this.type,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      createdBy: createdBy ?? this.createdBy,
      lastEpisodeToAir: lastEpisodeToAir ?? this.lastEpisodeToAir,
      genres: genres ?? this.genres,
      networks: networks ?? this.networks,
      productionCompanies: productionCompanies ?? this.productionCompanies,
      productionCountries: productionCountries ?? this.productionCountries,
      seasons: seasons ?? this.seasons,
      spokenLanguages: spokenLanguages ?? this.spokenLanguages,
    );
  }
}
