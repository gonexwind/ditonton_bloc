import 'package:ditonton/domain/entities/tv/tv_production_country.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_production_country_model.g.dart';

@immutable
@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCountryModel extends Equatable {
  ProductionCountryModel({
    required this.iso31661,
    required this.name,
  });

  final String? iso31661;
  final String? name;

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCountryModelToJson(this);
  ProductionCountry toEntity() => ProductionCountry(iso31661: iso31661, name: name);

  @override
  List<Object?> get props => [iso31661, name];

  @override
  bool get stringify => true;
}
