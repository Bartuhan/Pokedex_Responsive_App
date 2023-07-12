import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_responsive_app/constant/ui_helper.dart';
import 'package:pokedex_responsive_app/models/pokemon_model.dart';

import '../widgets/poke_information.dart';
import '../widgets/pokemon_name_type.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({Key? key, required this.pokemon}) : super(key: key);
  final PokemonModel pokemon;
  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBody(context)
        : _buildLandscapeBody(context);
  }

  Scaffold _buildLandscapeBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      appBar: buildAppBar(context),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PokemonNameAndType(pokemon: pokemon),
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: pokemon.img!,
                    height: 0.25.sh,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Expanded(flex: 3, child: PokeInformation(pokemon: pokemon))
        ],
      ),
    );
  }

  Scaffold _buildPortraitBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Column(
          children: [
            PokemonNameAndType(pokemon: pokemon),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset(
                      "assets/pokeball.png",
                      height: 100.w,
                      width: 100.w,
                    ),
                  ),
                  Positioned(
                    top: 0.10.sh,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: PokeInformation(pokemon: pokemon),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                      tag: pokemon.id!,
                      child: CachedNetworkImage(
                        imageUrl: pokemon.img!,
                        height: 0.25.sh,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      elevation: 0,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new)),
    );
  }
}
