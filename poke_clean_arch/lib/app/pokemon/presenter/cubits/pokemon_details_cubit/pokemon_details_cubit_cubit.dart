import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/external/poke_api/specie_api_impl.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/species_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/repositories/specie_repository_impl.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/cubits/pokemon_details_cubit/pokemon_details_cubit_state.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/species_search_by_di/species_search_by_id.dart';

class PokemonDetailsCubitCubit extends Cubit<PokemonDetailState> {
  PokemonDetailsCubitCubit() : super(PokemonDetailState.initial());

  void catchPokemonModel(PokemonModel pokemon) {
    emit(state.copyWith(pokemon: pokemon));
  }

  void searchSpecieId() async {
    emit(
      state.copyWith(status: PokeDetailStatus.loading),
    );
    final result = await SpeciesSearchById(
            repository: SpecieRepositoryImpl(datasource: SpecieApi(dio: Dio())))
        .call(ParamsSearchIdSpecie(url: state.pokemon.species.url));

    result.fold(
        (SpeciesSearchException exception) => {
              emit(
                state.copyWith(
                  status: PokeDetailStatus.error,
                  error: exception.message,
                ),
              )
            }, (SpeciesModel specie) {
      emit(
        state.copyWith(
          specie: specie,
          status: PokeDetailStatus.completed,
        ),
      );
    });
  }
}
