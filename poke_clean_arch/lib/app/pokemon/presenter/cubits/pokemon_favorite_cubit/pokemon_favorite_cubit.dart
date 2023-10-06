// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_function_literals_in_foreach_calls
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/cubits/pokemon_search_cubit/pokemon_search_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/external/shared_preferences/shared_preferences_impl.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/repositories/shared_preferences_repository_impl.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/shared_preferences_get/shared_preferences_get.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/shared_preferences_save/shared_preferences_save.dart';

part 'pokemon_favorite_state.dart';

class PokemonFavoriteCubit extends Cubit<PokemonFavoriteState> {
  PokemonFavoriteCubit(
    this.pokemonSearchCubit,
  ) : super(PokemonFavoriteState.initial());

  final PokemonSearchCubit pokemonSearchCubit;

  void favorite(PokemonModel pokemonSave) {
    var favorites = state.pokemon;

    var aux = favorites.where((element) => element.id == pokemonSave.id);

    if (aux.isNotEmpty) {
      favorites.removeWhere((pokemon) => pokemon.id == pokemonSave.id);
    } else {
      favorites.add(pokemonSave);
    }

    emit(
      state.copyWith(status: PokeFavoriteStatus.loading, pokemon: favorites),
    );

    saveFavoritesPokemon();
  }

  void loadFavorites() async {
    emit(
      state.copyWith(
        status: PokeFavoriteStatus.loading,
      ),
    );

    final result = await SharedPreferencesGet(
            repository: SharedPreferencesRepositoryImpl(
                datasource: SharedPreferencesImpl(
                    sharedPreferences: await SharedPreferences.getInstance())))
        .call(
      ParamnsSharedPreferencesGet(
        key: 'favorites',
      ),
    );

    result.fold(
        (SahredPreferencesExption exception) => {
              emit(
                state.copyWith(
                  status: PokeFavoriteStatus.error,
                  error: exception.message,
                ),
              )
            }, (String ids) {
      if (ids.isNotEmpty) {
        List aux = jsonDecode(ids);
        List<PokemonModel> pokemons = [];

        aux.forEach((element) async {
          await pokemonSearchCubit.searchPokemon(element.toString());
          pokemons.add(pokemonSearchCubit.state.pokemon);
        });

        emit(
          state.copyWith(
            pokemon: pokemons,
            status: PokeFavoriteStatus.completed,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: PokeFavoriteStatus.initial,
          ),
        );
      }
    });
  }

  void saveFavoritesPokemon() async {
    emit(
      state.copyWith(
        status: PokeFavoriteStatus.loading,
      ),
    );
    final result = await SharedPreferencesSave(
            repository: SharedPreferencesRepositoryImpl(
                datasource: SharedPreferencesImpl(
                    sharedPreferences: await SharedPreferences.getInstance())))
        .call(ParamnsSharedPreferencesSave(
            key: 'favorites',
            value: jsonEncode(List<int>.from(state.pokemon.map((x) => x.id)))));

    result.fold(
        (SahredPreferencesExption exception) => {
              emit(
                state.copyWith(
                  status: PokeFavoriteStatus.error,
                  error: exception.message,
                ),
              )
            }, (bool prefs) {
      emit(
        state.copyWith(
          status: PokeFavoriteStatus.completed,
        ),
      );
    });
  }
}
