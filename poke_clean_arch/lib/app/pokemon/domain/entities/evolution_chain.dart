import 'package:poke_clean_arch/app/pokemon/infra/models/chain_link_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class EvolutionChain {
  final NamedApiResourceModel? babyTriggerItem;
  final int id;
  final ChainLinkModel chain;
  EvolutionChain({
    this.babyTriggerItem,
    required this.id,
    required this.chain,
  });
}
