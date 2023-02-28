part of 'pokemon_search_infinity_cubit.dart';

enum PokeStatus { initial, completed, error, loading, loadingMock }

class PokemonSearchInfinityState extends Equatable {
  final List<Pokemon> pokemon;
  final PokeStatus status;

  final String error;

  const PokemonSearchInfinityState({
    required this.pokemon,
    required this.status,
    required this.error,
  });

  factory PokemonSearchInfinityState.initial() {
    return PokemonSearchInfinityState(
      pokemon: [Pokemon(name: '', id: 0, frontImg: '', types: [])],
      status: PokeStatus.initial,
      error: '',
    );
  }

  @override
  String toString() =>
      'PokemonSearchInfinityState(pokemon: $pokemon, status: $status, error: $error)';

  PokemonSearchInfinityState copyWith({
    List<Pokemon>? pokemon,
    PokeStatus? status,
    String? error,
  }) {
    return PokemonSearchInfinityState(
      pokemon: pokemon ?? this.pokemon,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [pokemon, status, error];
}
