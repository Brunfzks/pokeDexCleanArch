import 'package:dartz/dartz.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/evolution_chain_model.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/evolution_chain_search/evolution_chain_search.dart';

abstract class EvolutionChainRepository {
  Future<Either<EvolutionChainSearchException, EvolutionChainModel>>
      evolutionChainSearch(ParamsEvolutionChainSearch params);
}
