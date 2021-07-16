import 'package:flutter/material.dart';
import 'package:pokedex/src/models/PokemonTypeDTO.dart';
import 'package:pokedex/src/utils/extensions/extensions.dart';

class PokemonDTO {
  late int id;
  late String name;
  late String imageUrl;
  late List<PokemonTypeDTO> types;
  late bool isFavorite;

  PokemonDTO.map(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.name = this.name.capitalize();
    this.imageUrl = 'https://pokeres.bastionbot.org/images/pokemon/$id.png';

    var listTypes = json['types'] as List;
    this.types = listTypes.map((e) => PokemonTypeDTO.map(e)).toList();
    this.types.sort((a, b) => a.slot.compareTo(b.slot));

    this.isFavorite = false;
  }

  Color get primaryTypeColor => this.types.first.color;
}
