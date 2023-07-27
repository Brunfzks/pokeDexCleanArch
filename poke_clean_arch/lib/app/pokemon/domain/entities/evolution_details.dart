import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class EvolutionDetails {
  final int gender;
  final NamedApiResourceModel item;
  final NamedApiResourceModel trigger;
  final NamedApiResourceModel heldItem;
  final NamedApiResourceModel knowMove;
  final NamedApiResourceModel knowMoveType;
  final NamedApiResourceModel location;
  final int minLevel;
  final int minHappiness;
  final int minBeauty;
  final int minAffection;
  final bool needsOverWorldrain;
  final NamedApiResourceModel partySpecies;
  final int relativePhysicalStats;
  final String timeOfDay;
  final NamedApiResourceModel tradeSpecies;
  final bool turnUpsideDown;
  EvolutionDetails({
    required this.gender,
    required this.item,
    required this.trigger,
    required this.heldItem,
    required this.knowMove,
    required this.knowMoveType,
    required this.location,
    required this.minLevel,
    required this.minHappiness,
    required this.minBeauty,
    required this.minAffection,
    required this.needsOverWorldrain,
    required this.partySpecies,
    required this.relativePhysicalStats,
    required this.timeOfDay,
    required this.tradeSpecies,
    required this.turnUpsideDown,
  });
}