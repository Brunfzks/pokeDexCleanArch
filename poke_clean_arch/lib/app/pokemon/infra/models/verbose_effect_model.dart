import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/verbose_effect.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class VerboseEffectModel implements VerboseEffect {
  @override
  final String effect;

  @override
  final NamedApiResourceModel language;

  @override
  final String shortEffect;
  VerboseEffectModel({
    required this.effect,
    required this.language,
    required this.shortEffect,
  });

  Map<String, dynamic> toMap() {
    return {
      'effect': effect,
      'language': language.toMap(),
      'shortEffect': shortEffect,
    };
  }

  factory VerboseEffectModel.fromMap(Map<String, dynamic> map) {
    return VerboseEffectModel(
      effect: map['effect'] ?? '',
      language: NamedApiResourceModel.fromMap(map['language']),
      shortEffect: map['shortEffect'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VerboseEffectModel.fromJson(String source) =>
      VerboseEffectModel.fromMap(json.decode(source));
}
