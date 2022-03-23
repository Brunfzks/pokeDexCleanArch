import 'package:dartz/dartz.dart';
import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/pokemon_search_by_name.dart';

abstract class PokemonRepository {
  Future<Either<PokemonSearchException, Pokemon>> pokemonSearch(
      ParamsSearchPokemon params);
}
