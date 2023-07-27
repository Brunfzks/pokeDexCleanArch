import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/chain_link.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/evolution_details_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class ChainLinkModel implements ChainLink {
  @override
  final List<EvolutionDetailsModel> evolutionDetails;

  @override
  final List<ChainLinkModel> evolvesTo;

  @override
  final bool isBaby;

  @override
  final NamedApiResourceModel species;

  ChainLinkModel(
      this.evolutionDetails, this.evolvesTo, this.isBaby, this.species);

  Map<String, dynamic> toMap() {
    return {
      'evolutionDetails': evolutionDetails.map((x) => x.toMap()).toList(),
      'evolvesTo': evolvesTo,
      'isBaby': isBaby,
      'species': species.toMap(),
    };
  }

  factory ChainLinkModel.fromMap(Map<String, dynamic> map) {
    return ChainLinkModel(
      List<EvolutionDetailsModel>.from(map['evolution_details']
          ?.map((x) => EvolutionDetailsModel.fromMap(x))),
      List.from(map['evolves_to']),
      map['is_baby'] ?? false,
      NamedApiResourceModel.fromMap(map['species']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChainLinkModel.fromJson(String source) =>
      ChainLinkModel.fromMap(json.decode(source));
}
