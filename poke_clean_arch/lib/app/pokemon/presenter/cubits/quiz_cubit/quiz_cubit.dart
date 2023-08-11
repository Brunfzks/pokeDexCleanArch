import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/external/poke_api/pokemon_api_impl.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/official_artwork_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/sprites_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/repositories/pokemon_repository_impl.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/get_pokemons_quiz.dart/get_pokemon_quiz.dart';

part 'quiz_state.dart';

class PokemonQuizCubit extends Cubit<PokemonQuizState> {
  PokemonQuizCubit() : super(PokemonQuizState.initial());

  void startGame() async {
    emit(
      state.copyWith(status: QuizStatus.loading),
    );
    final result = await PokemonQuizGet(
            repository:
                PokemonRepositoryImpl(datasource: PokemonApi(dio: Dio())))
        .call(ParamsGetPokemonQuiz());

    result.fold(
        (GetPokemonQuizException exception) => {
              emit(
                state.copyWith(
                  status: QuizStatus.error,
                  error: exception.message,
                ),
              )
            }, (List<PokemonModel> pokemon) {
      emit(
        state.copyWith(
          pokemons: pokemon,
          status: QuizStatus.completed,
          pokemonSelected: pokemon[0 + Random().nextInt(3 - 0)],
        ),
      );
    });
  }

  void play(PokemonModel pokemon) {
    if (state.status == QuizStatus.played || state.status == QuizStatus.hit) {
      return;
    }

    if (pokemon.id == state.pokemonSelected.id) {
      emit(
        state.copyWith(status: QuizStatus.hit),
      );
      return;
    }

    emit(
      state.copyWith(status: QuizStatus.played),
    );
  }

  Color returnColor(PokemonModel pokemon) {
    if (state.status == QuizStatus.played || state.status == QuizStatus.hit) {
      if (pokemon.id == state.pokemonSelected.id) {
        return const Color(0xFFFFCC00);
      }
      return Colors.white;
    }
    return Colors.white;
  }
}
