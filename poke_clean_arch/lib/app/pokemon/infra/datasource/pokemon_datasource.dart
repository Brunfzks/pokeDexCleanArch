import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/get_pokemons_quiz.dart/get_pokemon_quiz.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/pokemon_search_by_name/pokemon_search_by_name.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/pokemon_search_infinity/pokemon_search_infinity.dart';

abstract class PokemonDataSource {
  Future<PokemonModel> pokemonSearchByName(ParamsSearchPokemon params);
  Future<List<PokemonModel>> pokemonSearchInfinity(
      ParamsSearchInfinityPokemon params);
  Future<List<PokemonModel>> pokemonSearchByIdQuiz(ParamsGetPokemonQuiz params);
}
