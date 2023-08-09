import 'package:dartz/dartz.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/domain/repository/evolution_chain_search_repository.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/evolution_chain_model.dart';

abstract class IEvolutionChainSearch {
  Future<Either<EvolutionChainSearchException, EvolutionChainModel>> call(
      ParamsEvolutionChainSearch params);
}

class EvolutionChainSearch implements IEvolutionChainSearch {
  EvolutionChainRepository repository;
  EvolutionChainSearch({
    required this.repository,
  });

  @override
  Future<Either<EvolutionChainSearchException, EvolutionChainModel>> call(
      ParamsEvolutionChainSearch params) async {
    if (params.url.isEmpty) {
      return left(EvolutionChainSearchException(message: 'URL VAZIA'));
    }
    return await repository.evolutionChainSearch(params);
  }
}

class ParamsEvolutionChainSearch {
  final String url;
  ParamsEvolutionChainSearch({
    required this.url,
  });
}
