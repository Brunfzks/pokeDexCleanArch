import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/pokemon_search_by_name.dart';

abstract class PokemonDataSource {
  Future<Pokemon> pokemonSearchByName(ParamsSearchPokemon params);
}
