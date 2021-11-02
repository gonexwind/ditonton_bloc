// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_local_database_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TVLocalDatabaseModel _$TVLocalDatabaseModelFromJson(
        Map<String, dynamic> json) =>
    TVLocalDatabaseModel(
      id: json['id'] as int,
      title: json['title'] as String,
      posterPath: json['posterPath'] as String,
      overview: json['overview'] as String,
    );

Map<String, dynamic> _$TVLocalDatabaseModelToJson(
        TVLocalDatabaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'posterPath': instance.posterPath,
      'overview': instance.overview,
    };
