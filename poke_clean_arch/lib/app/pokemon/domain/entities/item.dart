import 'package:poke_clean_arch/app/pokemon/infra/models/generation_game_index_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/item_holder_pokemon_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/item_sprites_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/name_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/verbose_effect_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/version_group_flavor_text.dart';

class Item {
  final int id;
  final String name;
  final int cost;
  final int flingPower;
  final NamedApiResourceModel flingEffect;
  final List<NamedApiResourceModel> attributes;
  final List<VerboseEffectModel> effectEntries;
  final List<VersionGroupFlavorTextModel> flavorTextEntries;
  final List<GenerationGameIndexModel> gameIndices;
  final List<NameModel> names;
  final ItemSpritesModel itemSprites;
  final List<ItemHolderPokemonModel> heldByPokemon;
  final NamedApiResourceModel category;
  Item({
    required this.id,
    required this.name,
    required this.cost,
    required this.flingPower,
    required this.flingEffect,
    required this.attributes,
    required this.effectEntries,
    required this.flavorTextEntries,
    required this.gameIndices,
    required this.names,
    required this.itemSprites,
    required this.heldByPokemon,
    required this.category,
  });
}
