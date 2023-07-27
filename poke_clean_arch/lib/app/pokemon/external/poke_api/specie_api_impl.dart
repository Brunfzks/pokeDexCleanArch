import 'package:dio/dio.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/infra/datasource/specie_datasource.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/species_model.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/species_search_by_di/species_search_by_id.dart';

class SpecieApi implements SpecieDataSource {
  Dio dio;
  SpecieApi({
    required this.dio,
  });
  @override
  Future<SpeciesModel> specieSearchById(ParamsSearchIdSpecie params) async {
    var result = await Dio().get(params.url);
    if (result.statusCode == 200) {
      var json = result.data;
      return SpeciesModel.fromMap(json);
    } else if (result.statusCode == 404) {
      throw SpeciesSearchException(message: 'Não Encontrado');
    } else {
      throw Exception();
    }
  }
}
