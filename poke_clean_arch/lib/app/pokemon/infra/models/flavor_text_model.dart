import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/flavor_text.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class FlavorTextModel implements FlavorText {
  @override
  final String flavorText;

  @override
  final NamedApiResourceModel language;

  @override
  final NamedApiResourceModel version;
  FlavorTextModel({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  Map<String, dynamic> toMap() {
    return {
      'flavorText': flavorText,
      'language': language.toMap(),
      'version': version.toMap(),
    };
  }

  factory FlavorTextModel.fromMap(Map<String, dynamic> map) {
    return FlavorTextModel(
      flavorText: map['flavor_text'].replaceAll('\n', ' ') ?? '',
      language: NamedApiResourceModel.fromMap(map['language']),
      version: NamedApiResourceModel.fromMap(map['version']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FlavorTextModel.fromJson(String source) =>
      FlavorTextModel.fromMap(json.decode(source));
}
