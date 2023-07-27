import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/description.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class DescriptionModel implements Description {
  @override
  final NamedApiResourceModel language;

  @override
  final String name;

  DescriptionModel(this.language, this.name);

  Map<String, dynamic> toMap() {
    return {
      'language': language.toMap(),
      'name': name,
    };
  }

  factory DescriptionModel.fromMap(Map<String, dynamic> map) {
    return DescriptionModel(
      NamedApiResourceModel.fromMap(map['language']),
      map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DescriptionModel.fromJson(String source) =>
      DescriptionModel.fromMap(json.decode(source));
}
