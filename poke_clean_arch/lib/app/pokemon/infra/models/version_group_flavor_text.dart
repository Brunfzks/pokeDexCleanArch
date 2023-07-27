import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/version_group_flavor_text.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class VersionGroupFlavorTextModel implements VersionGroupFlavorText {
  @override
  final NamedApiResourceModel language;

  @override
  final String text;

  @override
  final NamedApiResourceModel versionGroup;
  VersionGroupFlavorTextModel({
    required this.language,
    required this.text,
    required this.versionGroup,
  });

  Map<String, dynamic> toMap() {
    return {
      'language': language.toMap(),
      'text': text,
      'versionGroup': versionGroup.toMap(),
    };
  }

  factory VersionGroupFlavorTextModel.fromMap(Map<String, dynamic> map) {
    return VersionGroupFlavorTextModel(
      language: NamedApiResourceModel.fromMap(map['language']),
      text: map['text'] ?? '',
      versionGroup: NamedApiResourceModel.fromMap(map['versionGroup']),
    );
  }

  String toJson() => json.encode(toMap());

  factory VersionGroupFlavorTextModel.fromJson(String source) =>
      VersionGroupFlavorTextModel.fromMap(json.decode(source));
}
