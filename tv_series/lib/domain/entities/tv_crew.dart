import 'package:equatable/equatable.dart';

class Crew extends Equatable {
  final String? job;
  final String? department;
  final String? personId;
  final String? creditId;
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final String? character;
  final int? order;
  const Crew({
    required this.id,
    required this.job,
    required this.department,
    required this.personId,
    required this.creditId,
    required this.adult,
    required this.gender,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.character,
    required this.order,
  });

  @override
  List<Object?> get props {
    return [
      job,
      department,
      personId,
      creditId,
      adult,
      gender,
      id,
      knownForDepartment,
      name,
      originalName,
      popularity,
      profilePath,
      character,
      order,
    ];
  }

  @override
  bool get stringify => true;
}
