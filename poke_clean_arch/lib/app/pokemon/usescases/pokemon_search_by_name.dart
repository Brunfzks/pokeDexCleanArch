import 'package:dartz/dartz.dart';
import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/domain/repository/pokemon_repository.dart';

abstract class IPokemonSearch {
  Future<Either<PokemonSearchException, Pokemon>> call(
      ParamsSearchPokemon params);
}

class PokemonSearch implements IPokemonSearch {
  PokemonRepository repository;
  PokemonSearch({
    required this.repository,
  });

  @override
  Future<Either<PokemonSearchException, Pokemon>> call(
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
