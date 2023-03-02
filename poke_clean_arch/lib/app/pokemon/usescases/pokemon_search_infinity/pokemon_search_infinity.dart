import 'package:dartz/dartz.dart';
import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/domain/repository/pokemon_repository.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';

abstract class IPokemonSearchInfinity {
  Future<Either<PokemonSearchException, List<PokemonModel>>> call(
      ParamsSearchInfinityPokemon params);
}

class PokemonSearchInfinity implements IPokemonSearchInfinity {
  PokemonRepository repository;
  PokemonSearchInfinity({
    required this.repository,
  });

  @override
  Future<Either<PokemonSearchException, List<PokemonModel>>> call(
      ParamsSearchInfinityPokemon params) async {
    return await repository.pokemonSearchInfinity(params);
  }
}

class ParamsSearchInfinityPokemon {
  final int? limit;
  final int? offset;
  ParamsSearchInfinityPokemon({
    this.limit,
    this.offset,
  });
}
