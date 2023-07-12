import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/constants.dart';
import '../models/pokemon_model.dart';

class PokemonNameAndType extends StatelessWidget {
  const PokemonNameAndType({
    super.key,
    required this.pokemon,
  });

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(pokemon.name!,
                  style: Constants.getPokemonDetailNameTextStyle()),
              Text("#${pokemon.num!}",
                  style: Constants.getPokemonDetailNameTextStyle()),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Chip(
              label: Text(
                pokemon.type!.length > 1
                    ? "${pokemon.type![0]} , ${pokemon.type![1]}"
                    : pokemon.type![0],
                style: Constants.getTypeChipTextStyle(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
