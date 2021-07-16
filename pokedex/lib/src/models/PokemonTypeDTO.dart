import 'package:flutter/material.dart';
import 'package:pokedex/src/utils/colors_util.dart';
import 'package:pokedex/src/utils/extensions/extensions.dart';

enum PokemonType {
  Normal,
  Grass,
  Fire,
  Water,
  Fighting,
  Flying,
  Poison,
  Ground,
  Rock,
  Bug,
  Ghost,
  Electric,
  Psychic,
  Ice,
  Dragon,
  Dark,
  Steel,
  Fairy,
  Food,
  Slug,
  Plastic,
  Wind,
  Crystal,
  Light,
  Undefined
}

class PokemonTypeDTO {
  late int slot;
  late String name;
  late PokemonType type;
  late Color color;

  PokemonTypeDTO.map(Map<String, dynamic> json) {
    this.slot = json['slot'];
    this.name = json['type']['name'];
    this.name = this.name.capitalize();
    this.type = this._getTypeByName();
    this.color = this._getColorByType();
  }

  PokemonType _getTypeByName() {
    PokemonType type;
    switch (name) {
      case 'Normal':
        type = PokemonType.Normal;
        break;
      case 'Grass':
        type = PokemonType.Grass;
        break;
      case 'Fire':
        type = PokemonType.Fire;
        break;
      case 'Water':
        type = PokemonType.Water;
        break;
      case 'Fighting':
        type = PokemonType.Fighting;
        break;
      case 'Flying':
        type = PokemonType.Flying;
        break;
      case 'Poison':
        type = PokemonType.Poison;
        break;
      case 'Ground':
        type = PokemonType.Ground;
        break;
      case 'Rock':
        type = PokemonType.Rock;
        break;
      case 'Bug':
        type = PokemonType.Bug;
        break;
      case 'Ghost':
        type = PokemonType.Ghost;
        break;
      case 'Electric':
        type = PokemonType.Electric;
        break;
      case 'Psychic':
        type = PokemonType.Psychic;
        break;
      case 'Ice':
        type = PokemonType.Ice;
        break;
      case 'Dragon':
        type = PokemonType.Dragon;
        break;
      case 'Dark':
        type = PokemonType.Dark;
        break;
      case 'Steel':
        type = PokemonType.Steel;
        break;
      case 'Fairy':
        type = PokemonType.Fairy;
        break;
      case 'Food':
        type = PokemonType.Food;
        break;
      case 'Slug':
        type = PokemonType.Slug;
        break;
      case 'Plastic':
        type = PokemonType.Plastic;
        break;
      case 'Wind':
        type = PokemonType.Wind;
        break;
      case 'Crystal':
        type = PokemonType.Crystal;
        break;
      case 'Light':
        type = PokemonType.Light;
        break;
      default:
        type = PokemonType.Undefined;
    }
    return type;
  }

  Color _getColorByType() {
    Color color;
    switch (type) {
      case PokemonType.Normal:
        color = ColorsUtil.normalPokemon;
        break;
      case PokemonType.Grass:
        color = ColorsUtil.grassPokemon;
        break;
      case PokemonType.Fire:
        color = ColorsUtil.firePokemon;
        break;
      case PokemonType.Water:
        color = ColorsUtil.waterPokemon;
        break;
      case PokemonType.Fighting:
        color = ColorsUtil.fightingPokemon;
        break;
      case PokemonType.Flying:
        color = ColorsUtil.flyingPokemon;
        break;
      case PokemonType.Poison:
        color = ColorsUtil.poisonPokemon;
        break;
      case PokemonType.Ground:
        color = ColorsUtil.groundPokemon;
        break;
      case PokemonType.Rock:
        color = ColorsUtil.rockPokemon;
        break;
      case PokemonType.Bug:
        color = ColorsUtil.bugPokemon;
        break;
      case PokemonType.Ghost:
        color = ColorsUtil.ghostPokemon;
        break;
      case PokemonType.Electric:
        color = ColorsUtil.electricPokemon;
        break;
      case PokemonType.Psychic:
        color = ColorsUtil.psychicPokemon;
        break;
      case PokemonType.Ice:
        color = ColorsUtil.icePokemon;
        break;
      case PokemonType.Dragon:
        color = ColorsUtil.dragonPokemon;
        break;
      case PokemonType.Dark:
        color = ColorsUtil.darkPokemon;
        break;
      case PokemonType.Steel:
        color = ColorsUtil.steelPokemon;
        break;
      case PokemonType.Fairy:
        color = ColorsUtil.fairyPokemon;
        break;
      case PokemonType.Food:
        color = ColorsUtil.foodPokemon;
        break;
      case PokemonType.Slug:
        color = ColorsUtil.slugPokemon;
        break;
      case PokemonType.Plastic:
        color = ColorsUtil.plasticPokemon;
        break;
      case PokemonType.Wind:
        color = ColorsUtil.windPokemon;
        break;
      case PokemonType.Crystal:
        color = ColorsUtil.crystalPokemon;
        break;
      case PokemonType.Light:
        color = ColorsUtil.lightPokemon;
        break;
      default:
        color = Colors.transparent;
    }
    return color;
  }
}
