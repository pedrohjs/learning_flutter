import 'package:flutter/material.dart';
import 'package:pokedex/src/utils/colors_util.dart';

class PokemonStatDTO {
  late String name;
  late int value;

  PokemonStatDTO.map(Map<String, dynamic> json) {
    this.name = json['stat']['name'];
    this.value = json['base_stat'];
  }

  Color get valueColor {
    if (this.value < 70)
      return ColorsUtil.red;
    else if (this.value < 150)
      return ColorsUtil.yellow;
    else
      return ColorsUtil.green;
  }
}
