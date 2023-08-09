import 'package:poke_clean_arch/app/pokemon/infra/models/evolution_chain_model.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/evolution_chain_search/evolution_chain_search.dart';

abstract class EvolutionChainDataSource {
  Future<EvolutionChainModel> evolutionChainSearch(
      ParamsEvolutionChainSearch params);
}
