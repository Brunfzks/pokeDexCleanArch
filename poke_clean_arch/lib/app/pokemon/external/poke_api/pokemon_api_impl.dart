import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';

import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/infra/datasource/pokemon_datasource.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/get_pokemons_quiz.dart/get_pokemon_quiz.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/pokemon_search_by_name/pokemon_search_by_name.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/pokemon_search_infinity/pokemon_search_infinity.dart';

class PokemonApi implements PokemonDataSource {
  Dio dio;
  PokemonApi({
    required this.dio,
  });
  @override
  Future<PokemonModel> pokemonSearchByName(ParamsSearchPokemon params) async {
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

  @override
  Future<List<PokemonModel>> pokemonSearchInfinity(
      ParamsSearchInfinityPokemon params) async {
    try {
      var result = await Dio().get(
          'https://pokeapi.co/api/v2/pokemon?limit=${params.limit ?? 100}&offset=${params.offset ?? 0}');
      if (result.statusCode == 200) {
        var json = result.data['results'];
        List<PokemonModel> listPokemon = [];
        for (var pokemon in json) {
          listPokemon.add(await pokemonSearchByName(
              ParamsSearchPokemon(nameText: pokemon['name'])));
        }
        return listPokemon;
      } else if (result.statusCode == 404) {
        throw PokemonSearchException(message: 'Não Encontrado');
      } else {
        throw Exception();
      }
    } catch (e) {
      throw PokemonSearchException(message: e.toString());
    }
  }

  @override
  Future<List<PokemonModel>> pokemonSearchByIdQuiz(
      ParamsGetPokemonQuiz params) async {
    List<PokemonModel> aux = [];
    for (var i = 0; i <= 3; i++) {
      try {
        var result = await Dio().get(
            'https://pokeapi.co/api/v2/pokemon/${0 + Random().nextInt(1080 - 0)}');
        if (result.statusCode == 200) {
          var json = result.data;
          aux.add(PokemonModel.fromMap(json));
          sleep(const Duration(milliseconds: 500));
        } else if (result.statusCode == 404) {
          throw PokemonSearchException(message: 'Não Encontrado');
        } else {
          throw Exception();
        }
      } catch (e) {
        throw PokemonSearchException(message: e.toString());
      }
    }
    return aux;
  }
}
