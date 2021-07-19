import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/src/models/PokemonDTO.dart';
import 'package:pokedex/src/screens/pokemon/widgets/status_row_widget.dart';
import 'package:pokedex/src/shared/widgets/back_button_widget.dart';
import 'package:pokedex/src/shared/widgets/pokemon_list_tags.dart';
import 'package:pokedex/src/utils/colors_util.dart';

class PokemonDetailScreen extends StatelessWidget {
  final PokemonDTO pokemon;

  PokemonDetailScreen({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pokemon.primaryTypeColor,
      appBar: this._buildAppBar(context),
      body: this._buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: BackButtonWidget(),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 26),
          child: Hero(
            tag: '${pokemon.id}_favorite',
            transitionOnUserGestures: true,
            child: pokemon.isFavorite
                ? SvgPicture.asset(
                    'assets/icons/ic_favorite.svg',
                    color: ColorsUtil.white,
                    height: 24,
                  )
                : SvgPicture.asset(
                    'assets/icons/ic_favorite_border.svg',
                    color: ColorsUtil.white,
                    height: 24,
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: '${pokemon.id}_image',
                transitionOnUserGestures: true,
                child: Image.network(
                  pokemon.imageUrl,
                  height: 260,
                ),
              ),
              SizedBox(height: 24),
              Text(
                '${pokemon.name}',
                style: TextStyle(
                  color: ColorsUtil.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: 8),
              PokemonListTags(pokemonTypes: pokemon.types),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _buildStatus(),
        ),
      ],
    );
  }

  Widget _buildStatus() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
      decoration: BoxDecoration(
        color: ColorsUtil.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Status',
            style: TextStyle(
              color: ColorsUtil.darkGrey,
              fontSize: 24,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(height: 24),
          Column(
            children: this
                .pokemon
                .stats
                .map((e) => StautsRowWidget(stat: e))
                .toList(),
          ),
        ],
      ),
    );
  }
}
