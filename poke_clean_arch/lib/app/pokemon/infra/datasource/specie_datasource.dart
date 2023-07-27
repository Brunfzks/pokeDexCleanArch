import 'package:poke_clean_arch/app/pokemon/infra/models/species_model.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/species_search_by_di/species_search_by_id.dart';

abstract class SpecieDataSource {
  Future<SpeciesModel> specieSearchById(ParamsSearchIdSpecie params);
}
