// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/evolution_details.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class EvolutionDetailsModel implements EvolutionDetails {
  @override
  final int? gender;

  @override
  final NamedApiResourceModel? heldItem;
  @override
  final NamedApiResourceModel? item;

  @override
  final NamedApiResourceModel? knowMove;

  @override
  final NamedApiResourceModel? knowMoveType;

  @override
  final NamedApiResourceModel? location;

  @override
  final int? minAffection;

  @override
  final int? minBeauty;

  @override
  final int? minHappiness;

  @override
  final int? minLevel;

  @override
  final bool? needsOverWorldrain;

  @override
  final NamedApiResourceModel? partySpecies;

  @override
  final int? relativePhysicalStats;

  @override
  final String? timeOfDay;

  @override
  final NamedApiResourceModel? tradeSpecies;

  @override
  final NamedApiResourceModel? trigger;

  @override
  final bool? turnUpsideDown;

  EvolutionDetailsModel(
      this.gender,
      this.heldItem,
      this.item,
      this.knowMove,
      this.knowMoveType,
      this.location,
      this.minAffection,
      this.minBeauty,
      this.minHappiness,
      this.minLevel,
      this.needsOverWorldrain,
      this.partySpecies,
      this.relativePhysicalStats,
      this.timeOfDay,
      this.tradeSpecies,
      this.trigger,
      this.turnUpsideDown);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gender': gender,
      'heldItem': heldItem?.toMap(),
      'item': item?.toMap(),
      'knowMove': knowMove?.toMap(),
      'knowMoveType': knowMoveType?.toMap(),
      'location': location?.toMap(),
      'minAffection': minAffection,
      'minBeauty': minBeauty,
      'minHappiness': minHappiness,
      'minLevel': minLevel,
      'needsOverWorldrain': needsOverWorldrain,
      'partySpecies': partySpecies?.toMap(),
      'relativePhysicalStats': relativePhysicalStats,
      'timeOfDay': timeOfDay,
      'tradeSpecies': tradeSpecies?.toMap(),
      'trigger': trigger?.toMap(),
      'turnUpsideDown': turnUpsideDown,
    };
  }

  factory EvolutionDetailsModel.fromMap(Map<String, dynamic> map) {
    return EvolutionDetailsModel(
      map['gender'] != null ? map['gender'] as int : null,
      map['held_item'] != null
          ? NamedApiResourceModel.fromMap(
              map['held_item'] as Map<String, dynamic>)
          : null,
      map['item'] != null
          ? NamedApiResourceModel.fromMap(map['item'] as Map<String, dynamic>)
          : null,
      map['known_move'] != null
          ? NamedApiResourceModel.fromMap(
              map['known_move'] as Map<String, dynamic>)
          : null,
      map['known_move_type'] != null
          ? NamedApiResourceModel.fromMap(
              map['known_move_type'] as Map<String, dynamic>)
          : null,
      map['location'] != null
          ? NamedApiResourceModel.fromMap(
              map['location'] as Map<String, dynamic>)
          : null,
      map['min_affection'] != null ? map['min_affection'] as int : null,
      map['min_beauty'] != null ? map['min_beauty'] as int : null,
      map['min_happiness'] != null ? map['min_happiness'] as int : null,
      map['min_level'] != null ? map['min_level'] as int : null,
      map['needs_overworld_rain'] != null
          ? map['needs_overworld_rain'] as bool
          : null,
      map['party_species'] != null
          ? NamedApiResourceModel.fromMap(
              map['party_species'] as Map<String, dynamic>)
          : null,
      map['relative_physical_stats'] != null
          ? map['relative_physical_stats'] as int
          : null,
      map['time_of_day'] != null ? map['time_of_day'] as String : null,
      map['trade_species'] != null
          ? NamedApiResourceModel.fromMap(
              map['trade_species'] as Map<String, dynamic>)
          : null,
      map['trigger'] != null
          ? NamedApiResourceModel.fromMap(
              map['trigger'] as Map<String, dynamic>)
          : null,
      map['turn_upside_down'] != null ? map['turn_upside_down'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EvolutionDetailsModel.fromJson(String source) =>
      EvolutionDetailsModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
