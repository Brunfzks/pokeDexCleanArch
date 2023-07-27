import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/evolution_details.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class EvolutionDetailsModel implements EvolutionDetails {
  @override
  final int gender;

  @override
  final NamedApiResourceModel heldItem;
  @override
  final NamedApiResourceModel item;

  @override
  final NamedApiResourceModel knowMove;

  @override
  final NamedApiResourceModel knowMoveType;

  @override
  final NamedApiResourceModel location;

  @override
  final int minAffection;

  @override
  final int minBeauty;

  @override
  final int minHappiness;

  @override
  final int minLevel;

  @override
  final bool needsOverWorldrain;

  @override
  final NamedApiResourceModel partySpecies;

  @override
  final int relativePhysicalStats;

  @override
  final String timeOfDay;

  @override
  final NamedApiResourceModel tradeSpecies;

  @override
  final NamedApiResourceModel trigger;

  @override
  final bool turnUpsideDown;

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
    return {
      'gender': gender,
      'heldItem': heldItem.toMap(),
      'item': item.toMap(),
      'knowMove': knowMove.toMap(),
      'knowMoveType': knowMoveType.toMap(),
      'location': location.toMap(),
      'minAffection': minAffection,
      'minBeauty': minBeauty,
      'minHappiness': minHappiness,
      'minLevel': minLevel,
      'needsOverWorldrain': needsOverWorldrain,
      'partySpecies': partySpecies.toMap(),
      'relativePhysicalStats': relativePhysicalStats,
      'timeOfDay': timeOfDay,
      'tradeSpecies': tradeSpecies.toMap(),
      'trigger': trigger.toMap(),
      'turnUpsideDown': turnUpsideDown,
    };
  }

  factory EvolutionDetailsModel.fromMap(Map<String, dynamic> map) {
    return EvolutionDetailsModel(
      map['gender']?.toInt() ?? 0,
      NamedApiResourceModel.fromMap(map['held_item']),
      NamedApiResourceModel.fromMap(map['item']),
      NamedApiResourceModel.fromMap(map['known_move']),
      NamedApiResourceModel.fromMap(map['known_move_type']),
      NamedApiResourceModel.fromMap(map['location']),
      map['min_affection']?.toInt() ?? 0,
      map['min_beauty']?.toInt() ?? 0,
      map['min_happiness']?.toInt() ?? 0,
      map['min_level']?.toInt() ?? 0,
      map['needs_overworld_rain'] ?? false,
      NamedApiResourceModel.fromMap(map['party_species']),
      map['relative_physical_stats']?.toInt() ?? 0,
      map['time_of_day'] ?? '',
      NamedApiResourceModel.fromMap(map['trade_species']),
      NamedApiResourceModel.fromMap(map['trigger']),
      map['turn_upside_down'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory EvolutionDetailsModel.fromJson(String source) =>
      EvolutionDetailsModel.fromMap(json.decode(source));
}
