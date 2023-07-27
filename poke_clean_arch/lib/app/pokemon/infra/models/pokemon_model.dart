import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';

import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/ability_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/move_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/sprites_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/types_model.dart';

class PokemonModel implements Pokemon {
  @override
  final String name;
  @override
  final int id;
  @override
  final PokemonSpritesModel sprites;
  @override
  final List<TypeModel> types;
  @override
  final List<AbilityModel> abilities;
  @override
  final double height;
  @override
  final double weight;
  @override
  final List<MoveModel> moves;
  @override
  final NamedApiResourceModel species;

  const PokemonModel({
    required this.name,
    required this.id,
    required this.sprites,
    required this.types,
    required this.abilities,
    required this.height,
    required this.weight,
    required this.moves,
    required this.species,
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

  Gradient retornaGradiente() {
    if (types.length == 2) {
      return LinearGradient(
        colors: [types[0].colorType, types[1].colorType],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [
          0.2,
          0.9,
        ],
      );
    }
    return LinearGradient(colors: [
      types[0].colorType,
      types[0].colorType,
    ]);
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
      'sprites': sprites.toMap(),
      'types': types.map((x) => x.toMap()).toList(),
      'abilities': abilities.map((x) => x.toMap()).toList(),
      'height': height,
      'weight': weight,
      'moves': moves.map((x) => x.toMap()).toList(),
      'species': species.toMap(),
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      name: map['name'] ?? '',
      id: map['id']?.toInt() ?? 0,
      sprites: PokemonSpritesModel.fromMap(map['sprites']),
      types:
          List<TypeModel>.from(map['types']?.map((x) => TypeModel.fromMap(x))),
      abilities: List<AbilityModel>.from(
          map['abilities']?.map((x) => AbilityModel.fromMap(x))),
      height: map['height']?.toDouble() ?? 0.0,
      weight: map['weight']?.toDouble() ?? 0.0,
      moves:
          List<MoveModel>.from(map['moves']?.map((x) => MoveModel.fromMap(x))),
      species: NamedApiResourceModel.fromMap(map['species']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));
}
