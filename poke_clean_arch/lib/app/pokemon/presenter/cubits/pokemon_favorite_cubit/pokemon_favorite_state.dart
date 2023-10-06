part of 'pokemon_favorite_cubit.dart';

enum PokeFavoriteStatus {
  initial,
  completed,
  error,
  loading,
}

class PokemonFavoriteState extends Equatable {
  final List<PokemonModel> pokemon;
  final PokeFavoriteStatus status;
  final String error;

  const PokemonFavoriteState({
    required this.pokemon,
    required this.status,
    required this.error,
  });

  factory PokemonFavoriteState.initial() {
    return PokemonFavoriteState(
      pokemon: [],
      status: PokeFavoriteStatus.initial,
      error: '',
    );
  }

  @override
  String toString() =>
      'PokemonFavoriteState(pokemon: $pokemon, status: $status, error: $error)';

  PokemonFavoriteState copyWith({
    List<PokemonModel>? pokemon,
    PokeFavoriteStatus? status,
    String? error,
  }) {
    return PokemonFavoriteState(
      pokemon: pokemon ?? this.pokemon,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [pokemon, status, error];
}
