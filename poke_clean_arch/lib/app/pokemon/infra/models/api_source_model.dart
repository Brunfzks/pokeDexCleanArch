import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/api_source.dart';

class ApiSourceModel implements ApiSource {
  @override
  final String url;
  ApiSourceModel({
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  factory ApiSourceModel.fromMap(Map<String, dynamic> map) {
    return ApiSourceModel(
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiSourceModel.fromJson(String source) =>
      ApiSourceModel.fromMap(json.decode(source));
}
