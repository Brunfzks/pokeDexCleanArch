import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/genus.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/languages_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class GenusModel implements Genus {
  @override
  final String genus;

  @override
  final NamedApiResourceModel language;
  GenusModel({
    required this.genus,
    required this.language,
  });

  Map<String, dynamic> toMap() {
    return {
      'genus': genus,
      'language': language.toMap(),
    };
  }

  factory GenusModel.fromMap(Map<String, dynamic> map) {
    return GenusModel(
      genus: map['genus'] ?? '',
      language: NamedApiResourceModel.fromMap(map['language']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GenusModel.fromJson(String source) =>
      GenusModel.fromMap(json.decode(source));
}
