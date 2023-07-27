import 'package:poke_clean_arch/app/pokemon/infra/models/item_holder_pokemon_version_detail_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class ItemHolderPokemon {
  final NamedApiResourceModel pokemon;
  final List<ItemHolderPokemonVersionDetailModel> versionDetails;
  ItemHolderPokemon({
    required this.pokemon,
    required this.versionDetails,
  });
}
