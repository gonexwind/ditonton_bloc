import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_model.g.dart';

@immutable
@JsonSerializable(fieldRename: FieldRename.snake)
class TVModel extends Equatable {
  const TVModel({
    this.backdropPath,
    this.firstAirDate = '',
    this.genreIds = const [],
    this.id = 0,
    this.name = '',
    this.originCountry = const [],
    this.originalLanguage = '',
    this.originalName = '',
    this.overview = '',
    this.popularity = 0.0,
    this.posterPath,
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });

  final String? backdropPath;
  final String firstAirDate;
  final List<int> genreIds;
  final int id;
  final String name;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String? posterPath;
  final double voteAverage;
  final int voteCount;

  factory TVModel.fromJson(Map<String, dynamic> json) => _$TVModelFromJson(json);
  Map<String, dynamic> toJson() => _$TVModelToJson(this);
  TV toEntity() {
    return TV(
      backdropPath: backdropPath,
      firstAirDate: firstAirDate,
      genreIds: genreIds,
      id: id,
      name: name,
      originCountry: originCountry,
      originalLanguage: originalLanguage,
      originalName: originalName,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  @override
  List<Object?> get props {
    return [
      backdropPath,
      firstAirDate,
      genreIds,
      id,
      name,
      originCountry,
      originalLanguage,
      originalName,
      overview,
      popularity,
      posterPath,
      voteAverage,
      voteCount,
    ];
  }

  @override
  bool get stringify => true;
}
