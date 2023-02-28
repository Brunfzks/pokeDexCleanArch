import 'package:dartz/dartz.dart';

import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/domain/repository/pokemon_repository.dart';
import 'package:poke_clean_arch/app/pokemon/infra/datasource/pokemon_datasource.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/pokemon_search_by_name/pokemon_search_by_name.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/pokemon_search_infinity/pokemon_search_infinity.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDataSource datasource;
  PokemonRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<Either<PokemonSearchException, Pokemon>> pokemonSearch(
      ParamsSearchPokemon params) async {
    try {
      final pokemon = await datasource.pokemonSearchByName(params);
      return Right(pokemon);
    } on PokemonSearchException catch (e) {
      return Left(e);
    } on Exception {
      return left(PokemonSearchException(message: 'Exception Error'));
    }
  }

  @override
  Future<Either<PokemonSearchException, List<Pokemon>>> pokemonSearchInfinity(
      ParamsSearchInfinityPokemon params) async {
    try {
      final listPokemon = await datasource.pokemonSearchInfinity(params);
      return Right(listPokemon);
    } on PokemonSearchException catch (e) {
      return Left(e);
    } on Exception {
      return left(PokemonSearchException(message: 'Exception Error'));
    }
  }
}
