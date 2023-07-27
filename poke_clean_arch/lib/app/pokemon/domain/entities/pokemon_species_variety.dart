import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class PokemonSpeciesVariety {
  final bool isDefault;
  final NamedApiResourceModel pokemon;

  PokemonSpeciesVariety(this.isDefault, this.pokemon);
}
