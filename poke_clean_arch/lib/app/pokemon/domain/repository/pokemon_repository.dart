import 'package:dartz/dartz.dart';
import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/pokemon_search_by_name/pokemon_search_by_name.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/pokemon_search_infinity/pokemon_search_infinity.dart';

abstract class PokemonRepository {
  Future<Either<PokemonSearchException, PokemonModel>> pokemonSearch(
      ParamsSearchPokemon params);

  Future<Either<PokemonSearchException, List<PokemonModel>>>
      pokemonSearchInfinity(ParamsSearchInfinityPokemon params);
}
