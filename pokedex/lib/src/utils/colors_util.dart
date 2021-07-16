import 'package:flutter/material.dart';

class ColorsUtil {
  static final black = getColorByHex('#000000');
  static final white = getColorByHex('#FFFFFF');
  static final background = getColorByHex('#FCFCFC');
  static final inputBackground = getColorByHex('#F7F7F7');

  static final lightGrey = getColorByHex('#CCCCCC');
  static final darkGrey = getColorByHex('#4A4A4A');
  static final green = getColorByHex('#48D0B0');
  static final red = getColorByHex('#FB6C6C');
  static final yellow = getColorByHex('#FBED6C');
  static final blue = getColorByHex('#4E97D1');

  static final normalPokemon = getColorByHex('#E4F1DC');
  static final grassPokemon = getColorByHex('#7AC45B');
  static final firePokemon = getColorByHex('#EB4E45');
  static final waterPokemon = getColorByHex('#41A1FA');
  static final fightingPokemon = getColorByHex('#B35650');
  static final flyingPokemon = getColorByHex('#7298F7');
  static final poisonPokemon = getColorByHex('#A25A94');
  static final groundPokemon = getColorByHex('#D2B464');
  static final rockPokemon = getColorByHex('#BCAD72');
  static final bugPokemon = getColorByHex('#AFBF45');
  static final ghostPokemon = getColorByHex('#6E6DBB');
  static final electricPokemon = getColorByHex('#F8CD4B');
  static final psychicPokemon = getColorByHex('#E5659F');
  static final icePokemon = getColorByHex('#81DEFA');
  static final dragonPokemon = getColorByHex('#8274D8');
  static final darkPokemon = getColorByHex('#855F52');
  static final steelPokemon = getColorByHex('#B3B2C4');
  static final fairyPokemon = getColorByHex('#E69EEE');
  static final foodPokemon = getColorByHex('#65C279');
  static final slugPokemon = getColorByHex('#66C176');
  static final plasticPokemon = getColorByHex('#9190BC');
  static final windPokemon = getColorByHex('#D8AF6D');
  static final crystalPokemon = getColorByHex('#69B5C3');
  static final lightPokemon = getColorByHex('#DADB25');

  static Color getColorByHex(String hex) {
    return Color(int.parse("0xFF${hex.replaceAll('#', '')}"));
  }
}
