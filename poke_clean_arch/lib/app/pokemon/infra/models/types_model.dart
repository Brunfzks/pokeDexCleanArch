import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:poke_clean_arch/app/pokemon/domain/entities/type.dart';

class TypeModel implements Types {
  @override
  final String name;
  @override
  final String urlPicture;
  @override
  final Color colorType;
  TypeModel({
    required this.name,
    required this.urlPicture,
    required this.colorType,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'urlPicture': urlPicture,
      'colorType': colorType.value,
    };
  }

  factory TypeModel.fromMap(Map<String, dynamic> map) {
    return TypeModel(
      name: map['type']['name'] ?? '',
      urlPicture: 'assets/types/${map['type']['name']}.svg',
      colorType: retornaColor(map['type']['name']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeModel.fromJson(String source) =>
      TypeModel.fromMap(json.decode(source));
}

Color retornaColor(String name) {
  switch (name) {
    case 'normal':
      return const Color.fromRGBO(168, 167, 122, 1);
    case 'fire':
      return const Color.fromRGBO(238, 129, 48, 1);
    case 'water':
      return const Color.fromRGBO(99, 144, 240, 1);
    case 'electric':
      return const Color.fromRGBO(247, 208, 44, 1);
    case 'grass':
      return const Color.fromRGBO(122, 199, 76, 1);
    case 'ice':
      return const Color.fromRGBO(150, 217, 214, 1);
    case 'fighting':
      return const Color.fromRGBO(194, 46, 40, 1);
    case 'poison':
      return const Color.fromRGBO(163, 62, 161, 1);
    case 'ground':
      return const Color.fromRGBO(226, 191, 101, 1);
    case 'flying':
      return const Color.fromRGBO(169, 143, 243, 1);
    case 'psychic':
      return const Color.fromRGBO(249, 85, 135, 1);
    case 'bug':
      return const Color.fromRGBO(166, 185, 26, 1);
    case 'rock':
      return const Color.fromRGBO(182, 161, 54, 1);
    case 'ghost':
      return const Color.fromRGBO(115, 87, 151, 1);
    case 'dragon':
      return const Color.fromRGBO(111, 53, 252, 1);
    case 'dark':
      return const Color.fromRGBO(12, 87, 70, 1);
    case 'steel':
      return const Color.fromRGBO(183, 183, 206, 1);
    case 'fairy':
      return const Color.fromRGBO(214, 133, 173, 1);
    default:
      return Colors.white;
  }
}
