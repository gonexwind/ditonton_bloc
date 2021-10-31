import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/entities/tv/tv_detail.dart';

part 'tv_local_database_model.g.dart';

@immutable
@JsonSerializable()
class TVLocalDatabaseModel extends Equatable {
  TVLocalDatabaseModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  final int id;
  final String title;
  final String posterPath;
  final String overview;

  factory TVLocalDatabaseModel.fromJson(Map<String, dynamic> json) =>
      _$TVLocalDatabaseModelFromJson(json);

  factory TVLocalDatabaseModel.fromEntity(TVDetail tv) {
    return TVLocalDatabaseModel(
      id: tv.id,
      title: tv.name,
      posterPath: tv.posterPath ?? '',
      overview: tv.overview ?? '',
    );
  }

  Map<String, dynamic> toJson() => _$TVLocalDatabaseModelToJson(this);

  TV toEntity() => TV(
        id: id,
        overview: overview,
        posterPath: posterPath,
        name: title,
      );

  @override
  List<Object> get props => [id, title, posterPath, overview];

  @override
  bool get stringify => true;
}
