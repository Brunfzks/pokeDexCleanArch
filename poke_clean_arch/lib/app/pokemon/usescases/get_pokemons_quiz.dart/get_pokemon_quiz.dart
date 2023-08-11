import 'package:dartz/dartz.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/domain/repository/pokemon_repository.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';

abstract class IPokemonQuizGet {
  Future<Either<GetPokemonQuizException, List<PokemonModel>>> call(
      ParamsGetPokemonQuiz params);
}

class PokemonQuizGet implements IPokemonQuizGet {
  PokemonRepository repository;
  PokemonQuizGet({
    required this.repository,
  });

  @override
  Future<Either<GetPokemonQuizException, List<PokemonModel>>> call(
      ParamsGetPokemonQuiz params) async {
    return await repository.pokemonSearchById(params);
  }
}

class ParamsGetPokemonQuiz {}
