import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/languages.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/name_model.dart';

class LanguagesModel implements Languages {
  @override
  final int id;

  @override
  final String iso3166;

  @override
  final String iso639;

  @override
  final String name;

  @override
  final List<NameModel> names;

  @override
  final bool official;

  LanguagesModel(
      this.id, this.iso3166, this.iso639, this.name, this.names, this.official);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'iso3166': iso3166,
      'iso639': iso639,
      'name': name,
      'names': names.map((x) => x.toMap()).toList(),
      'official': official,
    };
  }

  factory LanguagesModel.fromMap(Map<String, dynamic> map) {
    return LanguagesModel(
      map['id']?.toInt() ?? 0,
      map['iso3166'] ?? '',
      map['iso639'] ?? '',
      map['name'] ?? '',
      List<NameModel>.from(map['names']?.map((x) => NameModel.fromMap(x))),
      map['official'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory LanguagesModel.fromJson(String source) =>
      LanguagesModel.fromMap(json.decode(source));
}
