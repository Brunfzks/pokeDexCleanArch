import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/species.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/api_source_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/description_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/flavor_text_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/genus_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/name_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pal_park_encounter_area_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_species_dex_entry_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_species_variety_model.dart';

class SpeciesModel implements Species {
  @override
  final int baseHappiness;

  @override
  final int captureRate;

  @override
  final NamedApiResourceModel color;

  @override
  final List<NamedApiResourceModel> eggGroups;

  @override
  final ApiSourceModel evolutionChain;

  @override
  final NamedApiResourceModel? evolvesFromSpecies;

  @override
  final List<FlavorTextModel> flavorTextEntries;

  @override
  final List<DescriptionModel> formDescriptions;

  @override
  final bool formsSwtitchable;

  @override
  final int genderRate;

  @override
  final List<GenusModel> genera;

  @override
  final NamedApiResourceModel generation;

  @override
  final NamedApiResourceModel growthRate;

  @override
  final NamedApiResourceModel habitat;

  @override
  final bool hasGenderDifferences;

  @override
  final int hatchCounter;

  @override
  final int id;

  @override
  final bool isLegendary;

  @override
  final bool isMythical;

  @override
  final bool isbaby;

  @override
  final String name;

  @override
  final List<NameModel> names;

  @override
  final int order;

  @override
  final List<PalParkEncounterAreaModel> palParkEcounters;

  @override
  final List<PokemonSeciesDexEntryModel> pokedexNumbers;

  @override
  final NamedApiResourceModel shape;

  @override
  final List<PokemonSpeciesVarietyModel> varieties;
  SpeciesModel({
    required this.baseHappiness,
    required this.captureRate,
    required this.color,
    required this.eggGroups,
    required this.evolutionChain,
    required this.evolvesFromSpecies,
    required this.flavorTextEntries,
    required this.formDescriptions,
    required this.formsSwtitchable,
    required this.genderRate,
    required this.genera,
    required this.generation,
    required this.growthRate,
    required this.habitat,
    required this.hasGenderDifferences,
    required this.hatchCounter,
    required this.id,
    required this.isLegendary,
    required this.isMythical,
    required this.isbaby,
    required this.name,
    required this.names,
    required this.order,
    required this.palParkEcounters,
    required this.pokedexNumbers,
    required this.shape,
    required this.varieties,
  });

  Map<String, dynamic> toMap() {
    return {
      'baseHappiness': baseHappiness,
      'captureRate': captureRate,
      'color': color.toMap(),
      'eggGroups': eggGroups.map((x) => x.toMap()).toList(),
      'evolutionChain': evolutionChain.toMap(),
      'flavorTextEntries': flavorTextEntries.map((x) => x.toMap()).toList(),
      'formDescriptions': formDescriptions.map((x) => x.toMap()).toList(),
      'formsSwtitchable': formsSwtitchable,
      'genderRate': genderRate,
      'genera': genera.map((x) => x.toMap()).toList(),
      'generation': generation.toMap(),
      'growthRate': growthRate.toMap(),
      'habitat': habitat.toMap(),
      'hasGenderDifferences': hasGenderDifferences,
      'hatchCounter': hatchCounter,
      'id': id,
      'isLegendary': isLegendary,
      'isMythical': isMythical,
      'isbaby': isbaby,
      'name': name,
      'names': names.map((x) => x.toMap()).toList(),
      'order': order,
      'palParkEcounters': palParkEcounters.map((x) => x.toMap()).toList(),
      'pokedexNumbers': pokedexNumbers.map((x) => x.toMap()).toList(),
      'shape': shape.toMap(),
      'varieties': varieties.map((x) => x.toMap()).toList(),
    };
  }

  factory SpeciesModel.fromMap(Map<String, dynamic> map) {
    return SpeciesModel(
      baseHappiness: map['base_happiness']?.toInt() ?? 0,
      captureRate: map['capture_rate']?.toInt() ?? 0,
      color: NamedApiResourceModel.fromMap(map['color']),
      eggGroups: List<NamedApiResourceModel>.from(
          map['egg_groups']?.map((x) => NamedApiResourceModel.fromMap(x))),
      evolutionChain: ApiSourceModel.fromMap(map['evolution_chain']),
      evolvesFromSpecies: map['evolves_from_species'] == null
          ? null
          : NamedApiResourceModel.fromMap(map['evolves_from_species']),
      flavorTextEntries: List<FlavorTextModel>.from(
          map['flavor_text_entries']?.map((x) => FlavorTextModel.fromMap(x))),
      formDescriptions: List<DescriptionModel>.from(
          map['form_descriptions']?.map((x) => DescriptionModel.fromMap(x))),
      formsSwtitchable: map['forms_switchable'] ?? false,
      genderRate: map['gender_rate']?.toInt() ?? 0,
      genera: List<GenusModel>.from(
          map['genera']?.map((x) => GenusModel.fromMap(x))),
      generation: NamedApiResourceModel.fromMap(map['generation']),
      growthRate: NamedApiResourceModel.fromMap(map['growth_rate']),
      habitat: NamedApiResourceModel.fromMap(map['habitat']),
      hasGenderDifferences: map['has_gender_differences'] ?? false,
      hatchCounter: map['hatch_counter']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      isLegendary: map['is_legendary'] ?? false,
      isMythical: map['is_mythical'] ?? false,
      isbaby: map['is_baby'] ?? false,
      name: map['name'] ?? '',
      names:
          List<NameModel>.from(map['names']?.map((x) => NameModel.fromMap(x))),
      order: map['order']?.toInt() ?? 0,
      palParkEcounters: List<PalParkEncounterAreaModel>.from(
          map['pal_park_encounters']
              ?.map((x) => PalParkEncounterAreaModel.fromMap(x))),
      pokedexNumbers: List<PokemonSeciesDexEntryModel>.from(
          map['pokedex_numbers']
              ?.map((x) => PokemonSeciesDexEntryModel.fromMap(x))),
      shape: NamedApiResourceModel.fromMap(map['shape']),
      varieties: List<PokemonSpeciesVarietyModel>.from(
          map['varieties']?.map((x) => PokemonSpeciesVarietyModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SpeciesModel.fromJson(String source) =>
      SpeciesModel.fromMap(json.decode(source));
}
