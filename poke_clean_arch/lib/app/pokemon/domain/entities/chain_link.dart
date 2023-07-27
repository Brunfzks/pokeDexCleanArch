import 'package:poke_clean_arch/app/pokemon/infra/models/chain_link_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/evolution_details_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class ChainLink {
  final bool isBaby;
  final NamedApiResourceModel species;
  final List<EvolutionDetailsModel> evolutionDetails;
  final List<ChainLinkModel> evolvesTo;
  ChainLink({
    required this.isBaby,
    required this.species,
    required this.evolutionDetails,
    required this.evolvesTo,
  });
}
