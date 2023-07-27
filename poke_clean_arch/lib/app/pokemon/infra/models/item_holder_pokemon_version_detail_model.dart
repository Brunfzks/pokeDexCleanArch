import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/item_holder_pokemon_version_detail.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class ItemHolderPokemonVersionDetailModel
    implements ItemHolderPokemonVersionDetail {
  @override
  final int rarity;

  @override
  final NamedApiResourceModel version;
  ItemHolderPokemonVersionDetailModel({
    required this.rarity,
    required this.version,
  });

  Map<String, dynamic> toMap() {
    return {
      'rarity': rarity,
      'version': version.toMap(),
    };
  }

  factory ItemHolderPokemonVersionDetailModel.fromMap(
      Map<String, dynamic> map) {
    return ItemHolderPokemonVersionDetailModel(
      rarity: map['rarity']?.toInt() ?? 0,
      version: NamedApiResourceModel.fromMap(map['version']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemHolderPokemonVersionDetailModel.fromJson(String source) =>
      ItemHolderPokemonVersionDetailModel.fromMap(json.decode(source));
}
