part of 'pokemon_search_infinity_cubit.dart';

enum PokeStatus { initial, completed, error, loading, loadingMock }

class PokemonSearchInfinityState extends Equatable {
  final List<PokemonModel> pokemon;
  final PokeStatus status;

  final String error;

  const PokemonSearchInfinityState({
    required this.pokemon,
    required this.status,
    required this.error,
  });

  factory PokemonSearchInfinityState.initial() {
    return PokemonSearchInfinityState(
      pokemon: [
        PokemonModel(
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
        )
      ],
      status: PokeStatus.initial,
      error: '',
    );
  }

  @override
  String toString() =>
      'PokemonSearchInfinityState(pokemon: $pokemon, status: $status, error: $error)';

  PokemonSearchInfinityState copyWith({
    List<PokemonModel>? pokemon,
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
