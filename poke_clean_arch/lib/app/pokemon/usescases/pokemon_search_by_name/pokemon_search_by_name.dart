import 'package:dartz/dartz.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/domain/repository/pokemon_repository.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';

abstract class IPokemonSearch {
  Future<Either<PokemonSearchException, PokemonModel>> call(
      ParamsSearchPokemon params);
}

class PokemonSearchByName implements IPokemonSearch {
  PokemonRepository repository;
  PokemonSearchByName({
    required this.repository,
  });

  @override
  Future<Either<PokemonSearchException, PokemonModel>> call(
      ParamsSearchPokemon params) async {
    if (params.nameText.isEmpty) {
      return left(PokemonSearchException(message: 'Texto Vazio'));
    }

    return await repository.pokemonSearch(params);
  }
}

class ParamsSearchPokemon {
  final String nameText;
  ParamsSearchPokemon({
    required this.nameText,
  });
}
