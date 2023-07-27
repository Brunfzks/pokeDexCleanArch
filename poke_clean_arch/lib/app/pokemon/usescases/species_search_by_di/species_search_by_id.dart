import 'package:dartz/dartz.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/domain/repository/specie_repository.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/species_model.dart';

abstract class ISpeciesSearchById {
  Future<Either<SpeciesSearchException, SpeciesModel>> call(
      ParamsSearchIdSpecie params);
}

class SpeciesSearchById implements ISpeciesSearchById {
  SpecieRepository repository;
  SpeciesSearchById({
    required this.repository,
  });

  @override
  Future<Either<SpeciesSearchException, SpeciesModel>> call(
      ParamsSearchIdSpecie params) async {
    if (params.url.isEmpty) {
      return left(SpeciesSearchException(message: 'URL VAZIA'));
    }
    return await repository.specieSearchById(params);
  }
}

class ParamsSearchIdSpecie {
  final String url;
  ParamsSearchIdSpecie({
    required this.url,
  });
}
