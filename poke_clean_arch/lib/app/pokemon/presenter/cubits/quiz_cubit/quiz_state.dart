part of 'quiz_cubit.dart';

enum QuizStatus { initial, completed, error, loading, hit, played }

class PokemonQuizState extends Equatable {
  final List<PokemonModel> pokemons;
  final PokemonModel pokemonSelected;
  final QuizStatus status;

  final String error;

  const PokemonQuizState({
    required this.pokemons,
    required this.status,
    required this.error,
    required this.pokemonSelected,
  });

  factory PokemonQuizState.initial() {
    return PokemonQuizState(
      pokemons: const [],
      status: QuizStatus.initial,
      error: '',
      pokemonSelected: PokemonModel(
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
    );
  }

  @override
  bool get stringify => true;

  PokemonQuizState copyWith({
    List<PokemonModel>? pokemons,
    QuizStatus? status,
    String? error,
    bool? hit,
    PokemonModel? pokemonSelected,
  }) {
    return PokemonQuizState(
      pokemons: pokemons ?? this.pokemons,
      status: status ?? this.status,
      error: error ?? this.error,
      pokemonSelected: pokemonSelected ?? this.pokemonSelected,
    );
  }

  @override
  List<Object> get props => [pokemons, status, error, pokemonSelected];
}
