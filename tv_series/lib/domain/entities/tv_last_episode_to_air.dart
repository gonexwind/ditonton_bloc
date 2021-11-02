import 'package:equatable/equatable.dart';

class LastEpisodeToAir extends Equatable {
  final DateTime? airDate;
  final int episodeNumber;
  final int id;
  final String? name;
  final String? overview;
  final String? productionCode;
  final int seasonNumber;
  final String? stillPath;
  final double voteAverage;
  final int voteCount;

  const LastEpisodeToAir({
    this.airDate,
    this.episodeNumber = 0,
    this.id = 0,
    this.name,
    this.overview,
    this.productionCode,
    this.seasonNumber = 0,
    this.stillPath,
    this.voteAverage = 0,
    this.voteCount = 0,
  });

  @override
  List<Object?> get props {
    return [
      airDate,
      episodeNumber,
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

  LastEpisodeToAir copyWith({
    DateTime? airDate,
    int? episodeNumber,
    int? id,
    String? name,
    String? overview,
    String? productionCode,
    int? seasonNumber,
    String? stillPath,
    double? voteAverage,
    int? voteCount,
  }) {
    return LastEpisodeToAir(
      airDate: airDate ?? this.airDate,
      episodeNumber: episodeNumber ?? this.episodeNumber,
      id: id ?? this.id,
      name: name ?? this.name,
      overview: overview ?? this.overview,
      productionCode: productionCode ?? this.productionCode,
      seasonNumber: seasonNumber ?? this.seasonNumber,
      stillPath: stillPath ?? this.stillPath,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }
}
