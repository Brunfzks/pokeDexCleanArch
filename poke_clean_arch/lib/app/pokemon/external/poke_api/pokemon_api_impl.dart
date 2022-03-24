import 'package:dio/dio.dart';

import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/infra/datasource/pokemon_datasource.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/pokemon_search_by_name.dart';

class PokemonApi implements PokemonDataSource {
  Dio dio;
  PokemonApi({
    required this.dio,
  });
  @override
  Future<Pokemon> pokemonSearchByName(ParamsSearchPokemon params) async {
    var result = await Dio()
        .get('https://pokeapi.co/api/v2/pokemon/${params.nameText}/');
    if (result.statusCode == 200) {
      var json = result.data;
      return PokemonModel.fromMap(json);
    } else if (result.statusCode == 404) {
      throw PokemonSearchException(message: 'Não Encontrado');
    } else {
      throw Exception();
    }
  }
}
