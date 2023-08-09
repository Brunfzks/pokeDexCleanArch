// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon_stat.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class PokemonStatModel implements PokemonStat {
  @override
  final int baseStat;

  @override
  final int effort;

  @override
  final NamedApiResourceModel stat;

  PokemonStatModel(this.baseStat, this.effort, this.stat);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'baseStat': baseStat,
      'effort': effort,
      'stat': stat.toMap(),
    };
  }

  factory PokemonStatModel.fromMap(Map<String, dynamic> map) {
    return PokemonStatModel(
      map['base_stat'] as int,
      map['effort'] as int,
      NamedApiResourceModel.fromMap(map['stat'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonStatModel.fromJson(String source) =>
      PokemonStatModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
