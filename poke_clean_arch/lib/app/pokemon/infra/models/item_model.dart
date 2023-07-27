import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/item.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/generation_game_index_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/item_holder_pokemon_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/item_sprites_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/name_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/verbose_effect_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/version_group_flavor_text.dart';

class ItemModel implements Item {
  @override
  final List<NamedApiResourceModel> attributes;

  @override
  final NamedApiResourceModel category;

  @override
  final int cost;

  @override
  final List<VerboseEffectModel> effectEntries;

  @override
  final List<VersionGroupFlavorTextModel> flavorTextEntries;

  @override
  final NamedApiResourceModel flingEffect;

  @override
  final int flingPower;

  @override
  final List<GenerationGameIndexModel> gameIndices;

  @override
  final List<ItemHolderPokemonModel> heldByPokemon;

  @override
  final int id;

  @override
  final ItemSpritesModel itemSprites;

  @override
  final String name;

  @override
  final List<NameModel> names;

  ItemModel(
      this.attributes,
      this.category,
      this.cost,
      this.effectEntries,
      this.flavorTextEntries,
      this.flingEffect,
      this.flingPower,
      this.gameIndices,
      this.heldByPokemon,
      this.id,
      this.itemSprites,
      this.name,
      this.names);

  Map<String, dynamic> toMap() {
    return {
      'attributes': attributes.map((x) => x.toMap()).toList(),
      'category': category.toMap(),
      'cost': cost,
      'effectEntries': effectEntries.map((x) => x.toMap()).toList(),
      'flavorTextEntries': flavorTextEntries.map((x) => x.toMap()).toList(),
      'flingEffect': flingEffect.toMap(),
      'flingPower': flingPower,
      'gameIndices': gameIndices.map((x) => x.toMap()).toList(),
      'heldByPokemon': heldByPokemon.map((x) => x.toMap()).toList(),
      'id': id,
      'itemSprites': itemSprites.toMap(),
      'name': name,
      'names': names.map((x) => x.toMap()).toList(),
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      List<NamedApiResourceModel>.from(
          map['attributes']?.map((x) => NamedApiResourceModel.fromMap(x))),
      NamedApiResourceModel.fromMap(map['category']),
      map['cost']?.toInt() ?? 0,
      List<VerboseEffectModel>.from(
          map['effect_entries']?.map((x) => VerboseEffectModel.fromMap(x))),
      List<VersionGroupFlavorTextModel>.from(map['flavor_text_entries']
          ?.map((x) => VersionGroupFlavorTextModel.fromMap(x))),
      NamedApiResourceModel.fromMap(map['fling_effect']),
      map['fling_power']?.toInt() ?? 0,
      List<GenerationGameIndexModel>.from(
          map['game_indices']?.map((x) => GenerationGameIndexModel.fromMap(x))),
      List<ItemHolderPokemonModel>.from(map['held_by_pokemon']
          ?.map((x) => ItemHolderPokemonModel.fromMap(x))),
      map['id']?.toInt() ?? 0,
      ItemSpritesModel.fromMap(map['sprites']),
      map['name'] ?? '',
      List<NameModel>.from(map['names']?.map((x) => NameModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source));
}
