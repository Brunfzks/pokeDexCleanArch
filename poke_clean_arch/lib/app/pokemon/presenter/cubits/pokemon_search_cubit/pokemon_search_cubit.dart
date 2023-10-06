import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/external/poke_api/pokemon_api_impl.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/official_artwork_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/sprites_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/repositories/pokemon_repository_impl.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/pokemon_search_by_name/pokemon_search_by_name.dart';

part 'pokemon_search_state.dart';

class PokemonSearchCubit extends Cubit<PokemonSearchState> {
  PokemonSearchCubit() : super(PokemonSearchState.initial());

  Future searchPokemon(String pokemonNameSearch) async {
    final result = await PokemonSearchByName(
            repository:
                PokemonRepositoryImpl(datasource: PokemonApi(dio: Dio())))
        .call(ParamsSearchPokemon(nameText: pokemonNameSearch));

    result.fold(
        (PokemonSearchException exception) => {state.error = exception.message},
        (PokemonModel pokemon) {
      emit(
        state.copyWith(pokemon: pokemon),
      );
      state.error = '';
    });
  }
}
