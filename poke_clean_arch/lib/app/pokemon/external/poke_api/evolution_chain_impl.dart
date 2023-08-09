// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';

import 'package:poke_clean_arch/app/pokemon/infra/datasource/evolution_chain_datasouce.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/evolution_chain_model.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/evolution_chain_search/evolution_chain_search.dart';

class EvolutionChainApi implements EvolutionChainDataSource {
  Dio dio;
  EvolutionChainApi({
    required this.dio,
  });
  @override
  Future<EvolutionChainModel> evolutionChainSearch(
      ParamsEvolutionChainSearch params) async {
    var result = await Dio().get(params.url);
    if (result.statusCode == 200) {
      var json = result.data;
      return EvolutionChainModel.fromMap(json);
    } else if (result.statusCode == 404) {
      throw EvolutionChainSearchException(message: 'Não Encontrado');
    } else {
      throw Exception();
    }
  }
}
