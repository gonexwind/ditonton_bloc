import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/data/models/tv/tv_createdby/tv_createdby_model.dart';
import 'package:ditonton/data/models/tv/tv_last_episode/tv_last_episode_to_air_model.dart';
import 'package:ditonton/data/models/tv/tv_network/tv_network_model.dart';
import 'package:ditonton/data/models/tv/tv_production_country/tv_production_country_model.dart';
import 'package:ditonton/data/models/tv/tv_season/tv_season_model.dart';
import 'package:ditonton/data/models/tv/tv_spoken_language/tv_spoken_language_model.dart';
import 'package:ditonton/domain/entities/tv/tv_detail.dart';

part 'tv_detail_model.g.dart';

@immutable
@JsonSerializable(fieldRename: FieldRename.snake)
class TVDetailResponse extends Equatable {
  TVDetailResponse({
    required this.backdropPath,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.name,
    required this.nextEpisodeToAir,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
    required this.createdBy,
    required this.genres,
    required this.lastEpisodeToAir,
    required this.networks,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
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
  final List<CreatedByModel> createdBy;
  final List<GenreModel> genres;
  final LastEpisodeToAirModel lastEpisodeToAir;
  final List<NetworkModel> networks;
  final List<NetworkModel> productionCompanies;
  final List<ProductionCountryModel> productionCountries;
  final List<SeasonModel> seasons;
  final List<SpokenLanguageModel> spokenLanguages;

  factory TVDetailResponse.fromJson(Map<String, dynamic> json) => _$TVDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TVDetailResponseToJson(this);

  TVDetail toEntity() => TVDetail(
        backdropPath: backdropPath,
        episodeRunTime: episodeRunTime,
        firstAirDate: firstAirDate,
        homepage: homepage,
        id: id,
        inProduction: inProduction,
        languages: languages,
        lastAirDate: lastAirDate,
        name: name,
        nextEpisodeToAir: nextEpisodeToAir,
        numberOfEpisodes: numberOfEpisodes,
        numberOfSeasons: numberOfSeasons,
        originCountry: originCountry,
        originalLanguage: originalLanguage,
        originalName: originalName,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        status: status,
        tagline: tagline,
        type: type,
        voteAverage: voteAverage,
        voteCount: voteCount,
        createdBy: createdBy.map((e) => e.toEntity()).toList(),
        genres: genres.map((e) => e.toEntity()).toList(),
        lastEpisodeToAir: lastEpisodeToAir.toEntity(),
        networks: networks.map((e) => e.toEntity()).toList(),
        productionCompanies: productionCompanies.map((e) => e.toEntity()).toList(),
        productionCountries: productionCountries.map((e) => e.toEntity()).toList(),
        seasons: seasons.map((e) => e.toEntity()).toList(),
        spokenLanguages: spokenLanguages.map((e) => e.toEntity()).toList(),
      );
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
      genres,
      lastEpisodeToAir,
      networks,
      productionCompanies,
      productionCountries,
      seasons,
      spokenLanguages,
    ];
  }

  @override
  bool get stringify => true;
}
