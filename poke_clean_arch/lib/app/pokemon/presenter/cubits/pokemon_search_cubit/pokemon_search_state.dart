// ignore_for_file: must_be_immutable

part of 'pokemon_search_cubit.dart';

class PokemonSearchState extends Equatable {
  final PokemonModel pokemon;

  late String error = '';

  PokemonSearchState({
    required this.pokemon,
  });

  factory PokemonSearchState.initial() {
    return PokemonSearchState(
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
    ));
  }

  @override
  List<Object?> get props => [pokemon];

  @override
  String toString() => 'PokemonSearchState(pokemonSearch: $pokemon)';

  PokemonSearchState copyWith({
    PokemonModel? pokemon,
  }) {
    return PokemonSearchState(
      pokemon: pokemon ?? this.pokemon,
    );
  }
}
