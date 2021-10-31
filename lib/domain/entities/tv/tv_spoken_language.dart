import 'package:equatable/equatable.dart';

class SpokenLanguage extends Equatable {
  final String? englishName;
  final String? iso6391;
  final String? name;
  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  @override
  List<Object?> get props => [englishName, iso6391, name];

  @override
  bool get stringify => true;

  SpokenLanguage copyWith({
    String? englishName,
    String? iso6391,
    String? name,
  }) {
    return SpokenLanguage(
      englishName: englishName ?? this.englishName,
      iso6391: iso6391 ?? this.iso6391,
      name: name ?? this.name,
    );
  }
}
