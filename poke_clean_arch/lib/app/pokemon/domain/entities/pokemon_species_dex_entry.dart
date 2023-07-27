import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class PokemonSpeciesDexEntry {
  final int entryNumber;
  final NamedApiResourceModel pokedex;
  PokemonSpeciesDexEntry({
    required this.entryNumber,
    required this.pokedex,
  });
}
