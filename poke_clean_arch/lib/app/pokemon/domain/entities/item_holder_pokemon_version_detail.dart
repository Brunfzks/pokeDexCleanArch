import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class ItemHolderPokemonVersionDetail {
  final int rarity;
  final NamedApiResourceModel version;
  ItemHolderPokemonVersionDetail({
    required this.rarity,
    required this.version,
  });
}
