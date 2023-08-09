import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class EvolutionDetails {
  final int? gender;
  final NamedApiResourceModel? item;
  final NamedApiResourceModel? trigger;
  final NamedApiResourceModel? heldItem;
  final NamedApiResourceModel? knowMove;
  final NamedApiResourceModel? knowMoveType;
  final NamedApiResourceModel? location;
  final int? minLevel;
  final int? minHappiness;
  final int? minBeauty;
  final int? minAffection;
  final bool? needsOverWorldrain;
  final NamedApiResourceModel? partySpecies;
  final int? relativePhysicalStats;
  final String? timeOfDay;
  final NamedApiResourceModel? tradeSpecies;
  final bool? turnUpsideDown;
  EvolutionDetails({
    this.gender,
    this.item,
    this.trigger,
    this.heldItem,
    this.knowMove,
    this.knowMoveType,
    this.location,
    this.minLevel,
    this.minHappiness,
    this.minBeauty,
    this.minAffection,
    this.needsOverWorldrain,
    this.partySpecies,
    this.relativePhysicalStats,
    this.timeOfDay,
    this.tradeSpecies,
    this.turnUpsideDown,
  });
}
