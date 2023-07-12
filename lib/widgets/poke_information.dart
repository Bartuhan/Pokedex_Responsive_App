import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/constants.dart';
import '../models/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  const PokeInformation({
    super.key,
    required this.pokemon,
  });

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: ScreenUtil().orientation == Orientation.portrait
              ? const BorderRadius.vertical(top: Radius.circular(20))
              : BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildInformationRow("Name", pokemon.name),
            buildInformationRow("Height", pokemon.height),
            buildInformationRow("Weight", pokemon.weight),
            buildInformationRow("Spanw Time", pokemon.spawnTime),
            buildInformationRow("Weaknesses", pokemon.weaknesses),
            buildInformationRow("Pre Evolution", pokemon.prevEvolution),
            buildInformationRow("Next Evolution", pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }

  Row buildInformationRow(String labelText, dynamic pokemonDetails) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          labelText,
          style: Constants.getPokemonInfoLabelTextStyle(),
        ),
        if (pokemonDetails is List && pokemonDetails.isNotEmpty)
          Text(
            pokemonDetails.join(' , '),
            style: Constants.getPokemonInfoTextStyle(),
          )
        else if (pokemonDetails.toString() == "[]")
          Text(
            "Not Available",
            style: Constants.getPokemonInfoTextStyle(),
          )
        else
          Text(
            pokemonDetails.toString(),
            style: Constants.getPokemonInfoTextStyle(),
          )
      ],
    );
  }
}
