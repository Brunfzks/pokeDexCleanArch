import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/evolution_chain.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/chain_link_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class EvolutionChainModel implements EvolutionChain {
  @override
  final NamedApiResourceModel babyTriggerItem;

  @override
  final ChainLinkModel chain;

  @override
  final int id;
  EvolutionChainModel({
    required this.babyTriggerItem,
    required this.chain,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      '': babyTriggerItem.toMap(),
      'chain': chain.toMap(),
      'id': id,
    };
  }

  factory EvolutionChainModel.fromMap(Map<String, dynamic> map) {
    return EvolutionChainModel(
      babyTriggerItem: NamedApiResourceModel.fromMap(map['baby_trigger_item']),
      chain: ChainLinkModel.fromMap(map['chain']),
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory EvolutionChainModel.fromJson(String source) =>
      EvolutionChainModel.fromMap(json.decode(source));
}
