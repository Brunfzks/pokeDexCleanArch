import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/name.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class NameModel implements Name {
  @override
  final NamedApiResourceModel language;

  @override
  final String name;
  NameModel({
    required this.language,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'language': language.toMap(),
      'name': name,
    };
  }

  factory NameModel.fromMap(Map<String, dynamic> map) {
    return NameModel(
      language: NamedApiResourceModel.fromMap(map['language']),
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NameModel.fromJson(String source) =>
      NameModel.fromMap(json.decode(source));
}
