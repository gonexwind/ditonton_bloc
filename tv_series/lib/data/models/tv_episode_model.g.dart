// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_episode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) => EpisodeModel(
      airDate: _validDateTimeFromJson(json['air_date'] as String?),
      episodeNumber: json['episode_number'] as int?,
      crew: (json['crew'] as List<dynamic>?)
              ?.map((e) => CrewModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      guestStars: (json['guest_stars'] as List<dynamic>?)
              ?.map((e) => CrewModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      id: json['id'] as int?,
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      productionCode: json['production_code'] as String?,
      seasonNumber: json['season_number'] as int?,
      stillPath: json['still_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
    );

Map<String, dynamic> _$EpisodeModelToJson(EpisodeModel instance) =>
    <String, dynamic>{
      'air_date': instance.airDate?.toIso8601String(),
      'episode_number': instance.episodeNumber,
      'crew': instance.crew,
      'guest_stars': instance.guestStars,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'production_code': instance.productionCode,
      'season_number': instance.seasonNumber,
      'still_path': instance.stillPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
