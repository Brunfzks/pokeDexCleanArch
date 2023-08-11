import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/external/poke_api/evolution_chain_impl.dart';
import 'package:poke_clean_arch/app/pokemon/external/poke_api/pokemon_api_impl.dart';
import 'package:poke_clean_arch/app/pokemon/external/poke_api/specie_api_impl.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/chain_link_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/evolution_chain_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/species_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/repositories/evolution_chain_repository_impl.dart';
import 'package:poke_clean_arch/app/pokemon/infra/repositories/pokemon_repository_impl.dart';
import 'package:poke_clean_arch/app/pokemon/infra/repositories/specie_repository_impl.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/cubits/pokemon_details_cubit/pokemon_details_cubit_state.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/evolution_chain_search/evolution_chain_search.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/pokemon_search_by_name/pokemon_search_by_name.dart';
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
      searchEvolutionChain();
    });
  }

  void searchEvolutionChain() async {
    emit(
      state.copyWith(status: PokeDetailStatus.loading),
    );
    final result = await EvolutionChainSearch(
            repository: EvolutionChainRepositoryImpl(
                datasource: EvolutionChainApi(dio: Dio())))
        .call(ParamsEvolutionChainSearch(url: state.specie.evolutionChain.url));

    result.fold(
        (EvolutionChainSearchException exception) => {
              emit(
                state.copyWith(
                  status: PokeDetailStatus.error,
                  error: exception.message,
                ),
              )
            }, (EvolutionChainModel evolutionChain) {
      emit(
        state.copyWith(
          evolutionChain: evolutionChain,
          status: PokeDetailStatus.completed,
        ),
      );
      getPokeEvolutions();
    });
  }

  void getPokeEvolutions() async {
    emit(
      state.copyWith(status: PokeDetailStatus.loading),
    );
    bool hasEvolution = true;
    final List<PokemonModel> aux = [];
    ChainLinkModel chain = state.evolutionChain.chain;
    do {
      final result = await PokemonSearchByName(
              repository:
                  PokemonRepositoryImpl(datasource: PokemonApi(dio: Dio())))
          .call(ParamsSearchPokemon(nameText: chain.species.name));

      result.fold(
          (PokemonSearchException exception) => {
                state.copyWith(
                    error: exception.message, status: PokeDetailStatus.error)
              }, (PokemonModel pokemon) {
        aux.add(pokemon);
      });

      if (chain.evolvesTo.isEmpty) {
        hasEvolution = false;
      } else {
        chain = chain.evolvesTo[0];
      }
    } while (hasEvolution);
    emit(state.copyWith(
      evolutions: aux,
      status: PokeDetailStatus.completed,
    ));
  }
}
