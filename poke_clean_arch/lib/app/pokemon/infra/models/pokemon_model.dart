import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/domain/entities/type.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/types_model.dart';

class PokemonModel implements Pokemon {
  @override
  final String name;
  @override
  final int id;
  @override
  final String frontImg;
  @override
  final List<TypeModel> types;

  const PokemonModel({
    required this.name,
    required this.id,
    required this.frontImg,
    required this.types,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'frontImg': frontImg,
      'types': types.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      name: map['name'] ?? '',
      id: map['id']?.toInt() ?? 0,
      frontImg: map['sprites']['front_default'] ?? '',
      types:
          List<TypeModel>.from(map['types']?.map((x) => TypeModel.fromMap(x))),
    );
  }

  static String retornaIdTratado(String id) {
    var aux = id.length;

    switch (aux) {
      case 1:
        return '#00$id';
      case 2:
        return '#0$id';
      default:
        return '#$id';
    }
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));
}
