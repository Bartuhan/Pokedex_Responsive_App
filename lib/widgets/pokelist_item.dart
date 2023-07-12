import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_responsive_app/constant/constants.dart';
import 'package:pokedex_responsive_app/constant/ui_helper.dart';
import 'package:pokedex_responsive_app/models/pokemon_model.dart';
import 'package:pokedex_responsive_app/pages/pokemon_details.dart';

import 'poke_image_and_ball.dart';

class PokeListItem extends StatelessWidget {
  const PokeListItem({super.key, required this.pokemon});
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PokemonDetails(pokemon: pokemon),
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        elevation: 3,
        shadowColor: Colors.white,
        color: UIHelper.getColorFromType(pokemon.type![0]),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(pokemon.name!, style: Constants.getPokemonNameTextStyle()),
              Chip(
                label: Text(
                  pokemon.type![0],
                  style: Constants.getTypeChipTextStyle(),
                ),
              ),
              PokeImageAndBall(pokemon: pokemon)
            ],
          ),
        ),
      ),
    );
  }
}
