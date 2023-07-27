import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/effect.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class EffectModel implements Effect {
  @override
  final String effect;

  @override
  final NamedApiResourceModel language;
  EffectModel({
    required this.effect,
    required this.language,
  });

  Map<String, dynamic> toMap() {
    return {
      'effect': effect,
      'language': language.toMap(),
    };
  }

  factory EffectModel.fromMap(Map<String, dynamic> map) {
    return EffectModel(
      effect: map['effect'] ?? '',
      language: NamedApiResourceModel.fromMap(map['language']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EffectModel.fromJson(String source) =>
      EffectModel.fromMap(json.decode(source));
}
