import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constant/ui_helper.dart';
import '../models/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  const PokeImageAndBall({
    super.key,
    required this.pokemon,
  });

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/pokeball.png",
              height: UIHelper.getCalculatePokeImgAndBall(),
              width: UIHelper.getCalculatePokeImgAndBall(),
              fit: BoxFit.fitHeight,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Hero(
              tag: pokemon.id!,
              child: CachedNetworkImage(
                imageUrl: pokemon.img!,
                height: UIHelper.getCalculatePokeImgAndBall(),
                width: UIHelper.getCalculatePokeImgAndBall(),
                fit: BoxFit.fitHeight,
                placeholder: (context, url) => const CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
