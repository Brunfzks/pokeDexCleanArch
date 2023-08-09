import 'package:dartz/dartz.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/domain/repository/evolution_chain_search_repository.dart';
import 'package:poke_clean_arch/app/pokemon/infra/datasource/evolution_chain_datasouce.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/evolution_chain_model.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/evolution_chain_search/evolution_chain_search.dart';

class EvolutionChainRepositoryImpl implements EvolutionChainRepository {
  final EvolutionChainDataSource datasource;
  EvolutionChainRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<EvolutionChainSearchException, EvolutionChainModel>>
      evolutionChainSearch(ParamsEvolutionChainSearch params) async {
    try {
      final listPokemon = await datasource.evolutionChainSearch(params);
      return Right(listPokemon);
    } on EvolutionChainSearchException catch (e) {
      return Left(e);
    } on Exception {
      return left(EvolutionChainSearchException(message: 'Exception Error'));
    }
  }
}
