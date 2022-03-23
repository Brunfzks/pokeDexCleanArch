import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/infra/datasource/pokemon_datasource.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/pokemon_search_by_name.dart';

class PokemonApi implements PokemonDataSource {
  @override
  Future<Pokemon> pokemonSearchByName(ParamsSearchPokemon params) {
    // TODO: implement pokemonSearchByName
    throw UnimplementedError();
  }
}
