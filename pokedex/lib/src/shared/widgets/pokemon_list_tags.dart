import 'package:flutter/material.dart';
import 'package:pokedex/src/models/PokemonTypeDTO.dart';
import 'package:pokedex/src/utils/colors_util.dart';

class PokemonListTags extends StatelessWidget {
  final List<PokemonTypeDTO> pokemonTypes;
  final bool cardView;

  PokemonListTags({required this.pokemonTypes, this.cardView = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: pokemonTypes.map((e) => _buildTag(e)).toList(),
    );
  }

  Widget _buildTag(PokemonTypeDTO pokemonType) {
    return Flexible(
      child: Container(
        margin: this.cardView
            ? EdgeInsets.only(right: 4)
            : EdgeInsets.only(right: 8),
        padding: this.cardView
            ? EdgeInsets.symmetric(vertical: 4, horizontal: 10)
            : EdgeInsets.symmetric(vertical: 6, horizontal: 11),
        decoration: BoxDecoration(
          color: ColorsUtil.white.withOpacity(0.3),
          border: Border.all(
            color: ColorsUtil.white,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          pokemonType.name,
          style: TextStyle(
            color: ColorsUtil.white,
            fontSize: this.cardView ? 10 : 16,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
