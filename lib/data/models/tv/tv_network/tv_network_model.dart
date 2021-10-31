import 'package:ditonton/domain/entities/tv/tv_network.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_network_model.g.dart';

@immutable
@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkModel extends Equatable {
  NetworkModel({
    required this.name,
    required this.id,
    this.logoPath,
    required this.originCountry,
  });

  final String? name;
  final int id;
  final String? logoPath;
  final String? originCountry;

  factory NetworkModel.fromJson(Map<String, dynamic> json) => _$NetworkModelFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkModelToJson(this);
  Network toEntity() => Network(
        name: name,
        id: id,
        logoPath: logoPath,
        originCountry: originCountry,
      );

  @override
  List<Object?> get props => [name, id, logoPath, originCountry];

  @override
  bool get stringify => true;
}
