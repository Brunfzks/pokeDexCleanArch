import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon_sprites.dart';

class OfficialArtworkModel implements OfficialArtwork {
  @override
  final String frontDefault;

  @override
  final String frontShiny;
  OfficialArtworkModel({
    required this.frontDefault,
    required this.frontShiny,
  });

  Map<String, dynamic> toMap() {
    return {
      'front_default': frontDefault,
      'front_shiny': frontShiny,
    };
  }

  factory OfficialArtworkModel.fromMap(Map<String, dynamic> map) {
    return OfficialArtworkModel(
      frontDefault: map['front_default'] ?? '',
      frontShiny: map['front_shiny'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OfficialArtworkModel.fromJson(String source) =>
      OfficialArtworkModel.fromMap(json.decode(source));
}
