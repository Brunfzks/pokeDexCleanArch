import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon_sprites.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/official_artwork_model.dart';

class PokemonSpritesModel implements PokemonSprites {
  @override
  final String backDefault;

  @override
  final String backShiny;

  @override
  final String frontDefault;

  @override
  final String frontShiny;

  @override
  final OfficialArtworkModel officialArtwork;
  PokemonSpritesModel({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
    required this.officialArtwork,
  });

  Map<String, dynamic> toMap() {
    return {
      'back_default': backDefault,
      'back_shiny': backShiny,
      'front_default': frontDefault,
      'front_shiny': frontShiny,
      'official-artwork': officialArtwork.toMap(),
    };
  }

  factory PokemonSpritesModel.fromMap(Map<String, dynamic> map) {
    return PokemonSpritesModel(
      backDefault: map['back_default'] ?? '',
      backShiny: map['back_shiny'] ?? '',
      frontDefault: map['front_default'] ?? '',
      frontShiny: map['front_shiny'] ?? '',
      officialArtwork:
          OfficialArtworkModel.fromMap(map['other']['official-artwork']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonSpritesModel.fromJson(String source) =>
      PokemonSpritesModel.fromMap(json.decode(source));
}
