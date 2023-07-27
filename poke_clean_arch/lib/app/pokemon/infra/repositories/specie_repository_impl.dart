import 'package:dartz/dartz.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/domain/repository/specie_repository.dart';
import 'package:poke_clean_arch/app/pokemon/infra/datasource/specie_datasource.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/species_model.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/species_search_by_di/species_search_by_id.dart';

class SpecieRepositoryImpl implements SpecieRepository {
  final SpecieDataSource datasource;
  SpecieRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<Either<SpeciesSearchException, SpeciesModel>> specieSearchById(
      ParamsSearchIdSpecie params) async {
    try {
      final specie = await datasource.specieSearchById(params);
      return Right(specie);
    } on SpeciesSearchException catch (e) {
      return Left(e);
    } on Exception {
      return left(SpeciesSearchException(message: 'Exception Error'));
    }
  }
}
