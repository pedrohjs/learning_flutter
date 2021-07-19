import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokedex/src/models/PokemonStatDTO.dart';
import 'package:pokedex/src/utils/colors_util.dart';
import 'package:pokedex/src/utils/extensions/extensions.dart';

class StautsRowWidget extends StatelessWidget {
  final PokemonStatDTO stat;
  const StautsRowWidget({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '${stat.name.length > 2 ? stat.name.capitalize() : stat.name.toUpperCase()}',
              style: TextStyle(
                color: ColorsUtil.darkGrey,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(width: 16),
          Row(
            children: [
              Text(
                '${stat.value}',
                style: TextStyle(
                  color: ColorsUtil.darkGrey,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              LinearPercentIndicator(
                backgroundColor: ColorsUtil.inputBackground,
                progressColor: stat.valueColor,
                animation: true,
                width: 150,
                lineHeight: 8,
                percent: stat.value / 255,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
