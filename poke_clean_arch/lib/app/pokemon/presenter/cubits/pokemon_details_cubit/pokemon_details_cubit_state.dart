import 'package:equatable/equatable.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/api_source_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/official_artwork_model.dart';

import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/species_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/sprites_model.dart';

enum PokeDetailStatus {
  initial,
  completed,
  error,
  loading,
}

class PokemonDetailState extends Equatable {
  final PokeDetailStatus status;
  final SpeciesModel specie;
  final String error;
  final PokemonModel pokemon;

  const PokemonDetailState({
    required this.status,
    required this.specie,
    required this.error,
    required this.pokemon,
  });

  factory PokemonDetailState.initial() {
    return PokemonDetailState(
      pokemon: PokemonModel(
        name: '',
        id: 0,
        sprites: PokemonSpritesModel(
          backDefault: '',
          backShiny: '',
          frontDefault: '',
          frontShiny: '',
          officialArtwork: OfficialArtworkModel(
            frontDefault: '',
            frontShiny: '',
          ),
        ),
        types: [],
        abilities: [],
        height: 0,
        weight: 0,
        moves: [],
        species: NamedApiResourceModel(name: '', url: ''),
        stats: [],
      ),
      status: PokeDetailStatus.initial,
      error: '',
      specie: SpeciesModel(
        baseHappiness: 0,
        captureRate: 0,
        color: NamedApiResourceModel(name: '', url: ''),
        eggGroups: [],
        evolutionChain: ApiSourceModel(url: ''),
        evolvesFromSpecies: NamedApiResourceModel(name: '', url: ''),
        flavorTextEntries: [],
        formDescriptions: [],
        formsSwtitchable: false,
        genderRate: 0,
        genera: [],
        generation: NamedApiResourceModel(name: '', url: ''),
        growthRate: NamedApiResourceModel(name: '', url: ''),
        habitat: NamedApiResourceModel(name: '', url: ''),
        hasGenderDifferences: false,
        hatchCounter: 0,
        id: 0,
        isLegendary: false,
        isMythical: false,
        isbaby: false,
        name: '',
        names: [],
        order: 0,
        palParkEcounters: [],
        pokedexNumbers: [],
        shape: NamedApiResourceModel(name: '', url: ''),
        varieties: [],
      ),
    );
  }

  @override
  String toString() {
    return 'PokemonDetailState(status: $status, specie: $specie, error: $error, pokemon: $pokemon)';
  }

  PokemonDetailState copyWith({
    PokeDetailStatus? status,
    SpeciesModel? specie,
    String? error,
    PokemonModel? pokemon,
  }) {
    return PokemonDetailState(
      status: status ?? this.status,
      specie: specie ?? this.specie,
      error: error ?? this.error,
      pokemon: pokemon ?? this.pokemon,
    );
  }

  @override
  List<Object> get props => [status, specie, error, pokemon];
}
