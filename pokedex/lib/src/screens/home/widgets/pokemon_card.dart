import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/src/models/PokemonDTO.dart';
import 'package:pokedex/src/screens/pokemon/pokemon_detail_screen.dart';
import 'package:pokedex/src/shared/widgets/pokemon_list_tags.dart';
import 'package:pokedex/src/utils/colors_util.dart';

class PokemonCard extends StatelessWidget {
  final PokemonDTO pokemon;

  PokemonCard({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (_) => PokemonDetailScreen(pokemon: pokemon)));
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: pokemon.primaryTypeColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _formatedNumber(),
                  style: TextStyle(color: ColorsUtil.white, fontSize: 10),
                ),
                Text(
                  '${pokemon.name}',
                  style: TextStyle(
                    color: ColorsUtil.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 10),
                PokemonListTags(pokemonTypes: pokemon.types, cardView: true),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: '${pokemon.id}_image',
                    transitionOnUserGestures: true,
                    child: Image.network(
                      pokemon.imageUrl,
                      height: 60,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Hero(
                  tag: '${pokemon.id}_favorite',
                  transitionOnUserGestures: true,
                  child: SvgPicture.asset(
                    pokemon.isFavorite
                        ? 'assets/icons/ic_favorite.svg'
                        : 'assets/icons/ic_favorite_border.svg',
                    color: ColorsUtil.white,
                    height: 16,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatedNumber() {
    String formaterNumber = '${pokemon.id}';
    if (formaterNumber.length == 1)
      return '#00$formaterNumber';
    else if (formaterNumber.length == 2)
      return '#0$formaterNumber';
    else
      return '#$formaterNumber';
  }
}
