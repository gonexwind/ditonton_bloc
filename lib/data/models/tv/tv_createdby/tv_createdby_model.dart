import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:ditonton/domain/entities/tv/tv_created_by.dart';

part 'tv_createdby_model.g.dart';

@immutable
@JsonSerializable(fieldRename: FieldRename.snake)
class CreatedByModel extends Equatable {
  CreatedByModel({
    this.id,
    this.creditId,
    this.name,
    this.gender,
    this.profilePath,
  });

  final int? id;
  final String? creditId;
  final String? name;
  final int? gender;
  final String? profilePath;

  factory CreatedByModel.fromJson(Map<String, dynamic> json) => _$CreatedByModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreatedByModelToJson(this);

  CreatedBy toEntity() {
    return CreatedBy(
      id: id,
      creditId: creditId,
      name: name,
      gender: gender,
      profilePath: profilePath,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      creditId,
      name,
      gender,
      profilePath,
    ];
  }

  @override
  bool get stringify => true;
}
