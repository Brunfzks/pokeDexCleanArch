import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon_species_variety.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class PokemonSpeciesVarietyModel implements PokemonSpeciesVariety {
  @override
  final bool isDefault;

  @override
  final NamedApiResourceModel pokemon;

  PokemonSpeciesVarietyModel(
    this.isDefault,
    this.pokemon,
  );

  Map<String, dynamic> toMap() {
    return {
      'isDefault': isDefault,
      'pokemon': pokemon.toMap(),
    };
  }

  factory PokemonSpeciesVarietyModel.fromMap(Map<String, dynamic> map) {
    return PokemonSpeciesVarietyModel(
      map['is_default'] ?? false,
      NamedApiResourceModel.fromMap(map['pokemon']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonSpeciesVarietyModel.fromJson(String source) =>
      PokemonSpeciesVarietyModel.fromMap(json.decode(source));
}
