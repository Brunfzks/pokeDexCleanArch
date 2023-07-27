import 'package:poke_clean_arch/app/pokemon/infra/models/api_source_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/description_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/flavor_text_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/genus_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/name_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pal_park_encounter_area_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_species_dex_entry_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_species_variety_model.dart';

class Species {
  final int id;
  final String name;
  final int order;
  final int genderRate;
  final int captureRate;
  final int baseHappiness;
  final bool isbaby;
  final bool isLegendary;
  final bool isMythical;
  final int hatchCounter;
  final bool hasGenderDifferences;
  final bool formsSwtitchable;
  final NamedApiResourceModel growthRate;
  final List<PokemonSeciesDexEntryModel> pokedexNumbers;
  final List<NamedApiResourceModel> eggGroups;
  final NamedApiResourceModel color;
  final NamedApiResourceModel shape;
  final NamedApiResourceModel? evolvesFromSpecies;
  final ApiSourceModel evolutionChain;
  final NamedApiResourceModel habitat;
  final NamedApiResourceModel generation;
  final List<NameModel> names;
  final List<PalParkEncounterAreaModel> palParkEcounters;
  final List<FlavorTextModel> flavorTextEntries;
  final List<DescriptionModel> formDescriptions;
  final List<GenusModel> genera;
  final List<PokemonSpeciesVarietyModel> varieties;
  Species({
    required this.id,
    required this.name,
    required this.order,
    required this.genderRate,
    required this.captureRate,
    required this.baseHappiness,
    required this.isbaby,
    required this.isLegendary,
    required this.isMythical,
    required this.hatchCounter,
    required this.hasGenderDifferences,
    required this.formsSwtitchable,
    required this.growthRate,
    required this.pokedexNumbers,
    required this.eggGroups,
    required this.color,
    required this.shape,
    this.evolvesFromSpecies,
    required this.evolutionChain,
    required this.habitat,
    required this.generation,
    required this.names,
    required this.palParkEcounters,
    required this.flavorTextEntries,
    required this.formDescriptions,
    required this.genera,
    required this.varieties,
  });
}
