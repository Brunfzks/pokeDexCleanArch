import 'package:poke_clean_arch/app/pokemon/domain/entities/Ability.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/ability_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/types_model.dart';

class Pokemon {
  final String name;
  final int id;
  final String frontImg;
  final double height;
  final double weight;
  final List<TypeModel> types;
  final List<AbilityModel> abilities;

  Pokemon({
    required this.name,
    required this.id,
    required this.frontImg,
    required this.types,
    required this.abilities,
    required this.height,
    required this.weight,
  });
}
