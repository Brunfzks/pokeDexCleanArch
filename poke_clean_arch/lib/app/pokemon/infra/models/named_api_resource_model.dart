import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/named_api_resource.dart';

class NamedApiResourceModel implements NamedApiResource {
  @override
  final String name;

  @override
  final String url;
  NamedApiResourceModel({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory NamedApiResourceModel.fromMap(Map<String, dynamic> map) {
    return NamedApiResourceModel(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NamedApiResourceModel.fromJson(String source) =>
      NamedApiResourceModel.fromMap(json.decode(source));
}
