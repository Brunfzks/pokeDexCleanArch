// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/evolution_chain.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/chain_link_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class EvolutionChainModel implements EvolutionChain {
  @override
  final NamedApiResourceModel? babyTriggerItem;

  @override
  final ChainLinkModel chain;

  @override
  final int id;
  EvolutionChainModel({
    this.babyTriggerItem,
    required this.chain,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'babyTriggerItem': babyTriggerItem?.toMap(),
      'chain': chain.toMap(),
      'id': id,
    };
  }

  factory EvolutionChainModel.fromMap(Map<String, dynamic> map) {
    return EvolutionChainModel(
      babyTriggerItem: map['babyTriggerItem'] != null
          ? NamedApiResourceModel.fromMap(
              map['babyTriggerItem'] as Map<String, dynamic>)
          : null,
      chain: ChainLinkModel.fromMap(map['chain'] as Map<String, dynamic>),
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory EvolutionChainModel.fromJson(String source) =>
      EvolutionChainModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
