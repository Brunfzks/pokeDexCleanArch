import 'package:poke_clean_arch/app/pokemon/infra/models/ability_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/move_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/sprites_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/types_model.dart';

class Pokemon {
  final String name;
  final int id;
  final PokemonSpritesModel sprites;
  final double height;
  final double weight;
  final List<TypeModel> types;
  final List<AbilityModel> abilities;
  final List<MoveModel> moves;
  final NamedApiResourceModel species;

  Pokemon({
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
}
