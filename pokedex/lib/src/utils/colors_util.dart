import 'package:flutter/material.dart';

class ColorsUtil {
  static final black = getColorByHex('#000000');
  static final white = getColorByHex('#FFFFFF');

  static final darkGrey = getColorByHex('#4A4A4A');
  static final green = getColorByHex('#48D0B0');
  static final red = getColorByHex('#FB6C6C');
  static final yellow = getColorByHex('#FBED6C');

  static Color getColorByHex(String hex) {
    return Color(int.parse("0xFF${hex.replaceAll('#', '')}"));
  }
}
