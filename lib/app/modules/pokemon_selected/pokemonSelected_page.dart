import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_inicie_educacao/app/modules/pokemon_selected/components/iten_nav_bar.dart';
import 'package:teste_inicie_educacao/app/modules/pokemon_selected/pokemonSelected_store.dart';
import 'package:flutter/material.dart';
import 'package:teste_inicie_educacao/app/shared/core/app_images.dart';
import 'package:teste_inicie_educacao/app/shared/core/app_text_styles.dart';
import 'package:teste_inicie_educacao/app/shared/core/appcolors.dart';
import 'components/status_bar.dart';
import 'models/arguments_model.dart';

class PokemonSelectedPage extends StatefulWidget {
  final ArgumentsNavigation arguments;
  const PokemonSelectedPage({
    Key? key,
    required this.arguments,
  }) : super(key: key);
  @override
  PokemonSelectedPageState createState() => PokemonSelectedPageState();
}

class PokemonSelectedPageState extends State<PokemonSelectedPage> {
  final PokemonSelectedStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final pokemon = widget.arguments.pokemon;
    final types = pokemon.types;
    final backGroundColorPokemon = types?.first.cor!.withAlpha(20);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backGroundColorPokemon,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Modular.to.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryBlue,
            )),
        title: SizedBox(
          width: 90,
          child: Image.asset(AppImages.inicie_logo),
        ),
        actions: [
          Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.only(right: 25),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(AppImages.userImage))),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: size.height * 0.4,
              decoration: BoxDecoration(
                  color: backGroundColorPokemon,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20))),
              child: LayoutBuilder(builder: (context, constraints) {
                final maxHeight = constraints.maxHeight;
                return Center(
                  child: SizedBox(
                      height: maxHeight * 0.8,
                      child: Image.network(pokemon.image!)),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pokemon.formatedName,
                              style: AppTextStyles.blue18pxw700,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.favorite_border,
                                  color: AppColors.liteGrey,
                                ),
                                Icon(
                                  Icons.share_outlined,
                                  color: AppColors.liteGrey,
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                child: Text(
                                  'Cod: ${pokemon.formatedId}',
                                  style: AppTextStyles.blue14pxw400,
                                ),
                              ),
                            ),
                            Row(
                              children: types!
                                  .map<Widget>((t) => Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, top: 10),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 25,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: t.cor,
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                          child: Text(
                                            t.name!,
                                            style: AppTextStyles.white12pxw400,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Descrição',
                          style: AppTextStyles.blue16pxw700,
                        ),
                        Text(
                          pokemon.formatedDescription,
                          style: AppTextStyles.blue14pxw600,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        StatusBar(
                          status: pokemon.hp!,
                          name: 'Vida',
                          cor: AppColors.hpColor,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        StatusBar(
                          status: pokemon.attack!,
                          name: 'Ataque',
                          cor: AppColors.attackColor,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        StatusBar(
                          status: pokemon.defense!,
                          name: 'Defesa',
                          cor: AppColors.defenseColor,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        StatusBar(
                          status: pokemon.specialattack!,
                          name: 'Sp. ataque',
                          cor: AppColors.specialAttackColor,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        StatusBar(
                          status: pokemon.specialdefense!,
                          name: 'Sp. defense',
                          cor: AppColors.specialDefenseColor,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        StatusBar(
                          status: pokemon.speed!,
                          name: 'velocidade',
                          cor: AppColors.speedColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ItenNavBar(
                      image: Image.asset(AppImages.icone_home),
                      text: 'Home',
                      ontap: () => widget.arguments.ontap(0)),
                  ItenNavBar(
                      image: Image.asset(AppImages.icone_favorite),
                      text: 'Favoritos',
                      ontap: () => widget.arguments.ontap(1)),
                  ItenNavBar(
                      image: Image.asset(AppImages.icone_peson),
                      text: 'Minha conta',
                      ontap: () => widget.arguments.ontap(2))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
