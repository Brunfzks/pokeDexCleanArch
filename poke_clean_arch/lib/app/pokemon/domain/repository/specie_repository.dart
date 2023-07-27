import 'package:dartz/dartz.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/species_model.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/species_search_by_di/species_search_by_id.dart';

abstract class SpecieRepository {
  Future<Either<SpeciesSearchException, SpeciesModel>> specieSearchById(
      ParamsSearchIdSpecie params);
}
