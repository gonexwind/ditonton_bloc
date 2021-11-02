import 'package:equatable/equatable.dart';

class CreatedBy extends Equatable {
  const CreatedBy({
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

  CreatedBy copyWith({
    int? id,
    String? creditId,
    String? name,
    int? gender,
    String? profilePath,
  }) {
    return CreatedBy(
      id: id ?? this.id,
      creditId: creditId ?? this.creditId,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      profilePath: profilePath ?? this.profilePath,
    );
  }
}
