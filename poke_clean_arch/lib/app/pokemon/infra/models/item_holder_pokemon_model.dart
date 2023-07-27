import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/item_holder_pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/item_holder_pokemon_version_detail_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class ItemHolderPokemonModel implements ItemHolderPokemon {
  @override
  final NamedApiResourceModel pokemon;

  @override
  final List<ItemHolderPokemonVersionDetailModel> versionDetails;
  ItemHolderPokemonModel({
    required this.pokemon,
    required this.versionDetails,
  });

  Map<String, dynamic> toMap() {
    return {
      'pokemon': pokemon.toMap(),
      'versionDetails': versionDetails.map((x) => x.toMap()).toList(),
    };
  }

  factory ItemHolderPokemonModel.fromMap(Map<String, dynamic> map) {
    return ItemHolderPokemonModel(
      pokemon: NamedApiResourceModel.fromMap(map['pokemon']),
      versionDetails: List<ItemHolderPokemonVersionDetailModel>.from(
          map['version_details']
              ?.map((x) => ItemHolderPokemonVersionDetailModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemHolderPokemonModel.fromJson(String source) =>
      ItemHolderPokemonModel.fromMap(json.decode(source));
}
