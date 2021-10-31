import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:ditonton/data/models/tv/tv_crew/tv_crew_model.dart';
import 'package:ditonton/domain/entities/tv/tv_episode.dart';

part 'tv_episode_model.g.dart';

DateTime? _validDateTimeFromJson(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  final result = DateTime.tryParse(value);
  return result;
}

@immutable
@JsonSerializable(fieldRename: FieldRename.snake)
class EpisodeModel extends Equatable {
  const EpisodeModel({
    this.airDate,
    this.episodeNumber,
    this.crew = const [],
    this.guestStars = const [],
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.seasonNumber,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  });

  @JsonKey(fromJson: _validDateTimeFromJson)
  final DateTime? airDate;
  final int? episodeNumber;
  final List<CrewModel> crew;
  final List<CrewModel> guestStars;
  final int? id;
  final String? name;
  final String? overview;
  final String? productionCode;
  final int? seasonNumber;
  final String? stillPath;
  final double? voteAverage;
  final int? voteCount;

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => _$EpisodeModelFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
  Episode toEntity() {
    return Episode(
      airDate: airDate,
      episodeNumber: episodeNumber,
      crew: crew.map((e) => e.toEntity()).toList(),
      guestStars: guestStars.map((e) => e.toEntity()).toList(),
      id: id,
      name: name,
      overview: overview,
      productionCode: productionCode,
      seasonNumber: seasonNumber,
      stillPath: stillPath,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  @override
  List<Object?> get props {
    return [
      airDate,
      episodeNumber,
      crew,
      guestStars,
      id,
      name,
      overview,
      productionCode,
      seasonNumber,
      stillPath,
      voteAverage,
      voteCount,
    ];
  }

  @override
  bool get stringify => true;
}
