import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon_species_dex_entry.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class PokemonSeciesDexEntryModel implements PokemonSpeciesDexEntry {
  @override
  final int entryNumber;

  @override
  final NamedApiResourceModel pokedex;
  PokemonSeciesDexEntryModel({
    required this.entryNumber,
    required this.pokedex,
  });

  Map<String, dynamic> toMap() {
    return {
      'entryNumber': entryNumber,
      'pokedex': pokedex.toMap(),
    };
  }

  factory PokemonSeciesDexEntryModel.fromMap(Map<String, dynamic> map) {
    return PokemonSeciesDexEntryModel(
      entryNumber: map['entry_number']?.toInt() ?? 0,
      pokedex: NamedApiResourceModel.fromMap(map['pokedex']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonSeciesDexEntryModel.fromJson(String source) =>
      PokemonSeciesDexEntryModel.fromMap(json.decode(source));
}
