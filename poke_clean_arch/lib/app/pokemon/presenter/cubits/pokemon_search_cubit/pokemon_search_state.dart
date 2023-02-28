part of 'pokemon_search_cubit.dart';

class PokemonSearchState extends Equatable {
  final Pokemon pokemon;

  late String error = '';

  PokemonSearchState({
    required this.pokemon,
  });

  factory PokemonSearchState.initial() {
    return PokemonSearchState(
      pokemon: Pokemon(name: '', id: 0, frontImg: '', types: []),
    );
  }

  @override
  List<Object?> get props => [pokemon];

  @override
  String toString() => 'PokemonSearchState(pokemonSearch: $pokemon)';

  PokemonSearchState copyWith({
    Pokemon? pokemon,
  }) {
    return PokemonSearchState(
      pokemon: pokemon ?? this.pokemon,
    );
  }
}
