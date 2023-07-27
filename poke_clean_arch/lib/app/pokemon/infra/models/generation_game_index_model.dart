import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/generation_game_index.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class GenerationGameIndexModel implements GenerationGameIndex {
  @override
  final int gameIndex;

  @override
  final NamedApiResourceModel generation;
  GenerationGameIndexModel({
    required this.gameIndex,
    required this.generation,
  });

  Map<String, dynamic> toMap() {
    return {
      'gameIndex': gameIndex,
      'generation': generation.toMap(),
    };
  }

  factory GenerationGameIndexModel.fromMap(Map<String, dynamic> map) {
    return GenerationGameIndexModel(
      gameIndex: map['gameIndex']?.toInt() ?? 0,
      generation: NamedApiResourceModel.fromMap(map['generation']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GenerationGameIndexModel.fromJson(String source) =>
      GenerationGameIndexModel.fromMap(json.decode(source));
}
