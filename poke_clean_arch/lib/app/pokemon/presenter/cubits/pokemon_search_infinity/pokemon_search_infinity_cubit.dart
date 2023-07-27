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
import 'package:poke_clean_arch/app/pokemon/usescases/pokemon_search_infinity/pokemon_search_infinity.dart';

part 'pokemon_search_infinity_state.dart';

class PokemonSearchInfinityCubit extends Cubit<PokemonSearchInfinityState> {
  PokemonSearchInfinityCubit() : super(PokemonSearchInfinityState.initial());

  final int qtdPaginas = 1279;

  void searchPokemoninfinity(int limit, int offset) async {
    emit(
      state.copyWith(status: PokeStatus.loading),
    );
    final result = await PokemonSearchInfinity(
            repository:
                PokemonRepositoryImpl(datasource: PokemonApi(dio: Dio())))
        .call(ParamsSearchInfinityPokemon(limit: limit, offset: offset));

    result.fold(
        (PokemonSearchException exception) => {
              emit(
                state.copyWith(
                  status: PokeStatus.error,
                  error: exception.message,
                ),
              )
            }, (List<PokemonModel> pokemon) {
      emit(
        state.copyWith(
          pokemon: pokemon,
          status: PokeStatus.completed,
        ),
      );
    });
  }

  void mockFecth() async {
    if (state.pokemon.length == qtdPaginas) {
      return;
    }
    emit(
      state.copyWith(status: PokeStatus.loadingMock),
    );

    final result = await PokemonSearchInfinity(
            repository:
                PokemonRepositoryImpl(datasource: PokemonApi(dio: Dio())))
        .call(ParamsSearchInfinityPokemon(
            limit: 100, offset: state.pokemon.length));

    result.fold(
        (PokemonSearchException exception) => {
              emit(
                state.copyWith(
                  status: PokeStatus.error,
                  error: exception.message,
                ),
              )
            }, (List<PokemonModel> pokemon) {
      state.pokemon.addAll(pokemon);
      emit(
        state.copyWith(
          pokemon: state.pokemon,
          status: PokeStatus.completed,
        ),
      );
    });
  }
}
