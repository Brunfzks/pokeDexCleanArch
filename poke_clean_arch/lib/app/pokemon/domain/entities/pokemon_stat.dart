// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class PokemonStat {
  final NamedApiResourceModel stat;
  final int effort;
  final int baseStat;
  PokemonStat({
    required this.stat,
    required this.effort,
    required this.baseStat,
  });
}
