import 'package:equatable/equatable.dart';

class ProductionCountry extends Equatable {
  const ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  final String? iso31661;
  final String? name;

  @override
  List<Object?> get props => [iso31661, name];

  @override
  bool get stringify => true;

  ProductionCountry copyWith({
    String? iso31661,
    String? name,
  }) {
    return ProductionCountry(
      iso31661: iso31661 ?? this.iso31661,
      name: name ?? this.name,
    );
  }
}
