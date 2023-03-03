import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/Move.dart';

class MoveModel implements Move {
  @override
  final String name;

  @override
  final String url;

  MoveModel({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory MoveModel.fromMap(Map<String, dynamic> map) {
    return MoveModel(
      name: map['move']['name'] ?? '',
      url: map['move']['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MoveModel.fromJson(String source) =>
      MoveModel.fromMap(json.decode(source));
}
