import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon.dart';

class PokemonModel implements Pokemon {
  @override
  final String name;
  @override
  final int id;
  @override
  final String frontImg;
  const PokemonModel({
    required this.name,
    required this.id,
    required this.frontImg,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'frontImg': frontImg,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      name: map['name'] ?? '',
      id: map['id']?.toInt() ?? 0,
      frontImg: map['sprites']['front_default'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));
}
