import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:poke_clean_arch/app/pokemon/domain/entities/Ability.dart';
import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/domain/entities/type.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/ability_model.dart';
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
  @override
  final List<AbilityModel> abilities;
  @override
  final double height;
  @override
  final double weight;

  const PokemonModel({
    required this.name,
    required this.id,
    required this.frontImg,
    required this.types,
    required this.abilities,
    required this.height,
    required this.weight,
  });

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

  String retornaAbilities() {
    String aux = '';
    for (int i = 0; i < abilities.length; i++) {
      aux += i != abilities.length - 1
          ? '${StringUtils.capitalize(abilities[i].name)}, '
          : StringUtils.capitalize(abilities[i].name);
    }
    return aux;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'frontImg': frontImg,
      'types': types.map((x) => x.toMap()).toList(),
      'abilities': abilities.map((x) => x.toMap()).toList(),
      'height': height,
      'weight': weight,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      name: map['name'] ?? '',
      id: map['id']?.toInt() ?? 0,
      frontImg: map['sprites']['front_default'] ?? '',
      types:
          List<TypeModel>.from(map['types']?.map((x) => TypeModel.fromMap(x))),
      abilities: List<AbilityModel>.from(
          map['abilities']?.map((x) => AbilityModel.fromMap(x))),
      height: map['height']?.toDouble() / 10 ?? 0.0,
      weight: map['weight']?.toDouble() / 10 ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));
}
