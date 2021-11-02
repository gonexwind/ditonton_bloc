import 'package:equatable/equatable.dart';

class Network extends Equatable {
  const Network({
    required this.name,
    required this.id,
    this.logoPath,
    required this.originCountry,
  });

  final String? name;
  final int id;
  final String? logoPath;
  final String? originCountry;

  @override
  List<Object?> get props => [name, id, logoPath, originCountry];

  @override
  bool get stringify => true;

  Network copyWith({
    String? name,
    int? id,
    String? logoPath,
    String? originCountry,
  }) {
    return Network(
      name: name ?? this.name,
      id: id ?? this.id,
      logoPath: logoPath ?? this.logoPath,
      originCountry: originCountry ?? this.originCountry,
    );
  }
}
