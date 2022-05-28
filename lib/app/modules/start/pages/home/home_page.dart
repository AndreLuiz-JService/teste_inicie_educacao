import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_inicie_educacao/app/modules/pokemon_selected/models/arguments_model.dart';
import 'package:teste_inicie_educacao/app/modules/start/models/pokemon_model.dart';
import 'package:teste_inicie_educacao/app/modules/start/start_store.dart';
import 'package:teste_inicie_educacao/app/shared/core/app_images.dart';
import 'package:teste_inicie_educacao/app/shared/core/app_text_styles.dart';
import 'package:teste_inicie_educacao/app/shared/core/appcolors.dart';

class HomePage extends StatefulWidget {
  final StartStore store;
  const HomePage({Key? key, required this.store}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Scaffold(
      drawer: const Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            height: 180,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  width: width * 0.2,
                  right: -20,
                  child: Image.asset(AppImages.back_bools),
                ),
                Center(
                  child: Container(
                    width: width * 0.9,
                    height: 180,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: AppColors.primaryRed.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 20, 25, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Pokedéx\n',
                                  style: AppTextStyles.blue18pxw700,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Todas as espécies de pokemons\n',
                                        style: AppTextStyles.blue14pxw400),
                                    TextSpan(
                                        text: 'esperando por você!',
                                        style: AppTextStyles.blue14pxw400),
                                  ],
                                ),
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: width * 0.5,
                                child: LayoutBuilder(
                                    builder: (context, constraints) {
                                  final maxWidth = constraints.maxWidth;

                                  return Stack(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: maxWidth * 0.8,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 10,
                                                color: Colors.grey.shade400,
                                                offset: Offset(0, 4)),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 35,
                                            width: maxWidth * 0.8,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                        left: Radius.circular(
                                                            5))),
                                            child: TextField(
                                              onChanged:
                                                  widget.store.setFilterName,
                                              textAlign: TextAlign.center,
                                              style: AppTextStyles.blue16pxw700,
                                              cursorColor: AppColors.primaryRed,
                                              maxLines: 1,
                                              decoration: const InputDecoration(
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                          Container(
                                            height: 35,
                                            width: maxWidth * 0.2,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryRed,
                                              borderRadius:
                                                  const BorderRadius.horizontal(
                                                      right:
                                                          Radius.circular(5)),
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 15,
                                                    spreadRadius: 2,
                                                    color: AppColors.primaryRed,
                                                    offset: const Offset(0, 4)),
                                              ],
                                            ),
                                            child: SizedBox(
                                                width: (maxWidth * 0.2) * 0.4,
                                                child: Image.asset(
                                                    AppImages.searche)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }),
                              )
                            ],
                          ),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              final maxHeight = constraints.maxHeight;
                              return Stack(
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: Container(
                                        height: 4,
                                        width: maxHeight * 0.5,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                  spreadRadius: 1,
                                                  color: AppColors.primaryRed,
                                                  blurRadius: 10)
                                            ]),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.topRight,
                                      height: 100,
                                      child: Image.asset(
                                          AppImages.pikachu_home_page)),
                                ],
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12, left: 25),
                  child: Text(
                    'Tipo',
                    style: AppTextStyles.blue16pxw700,
                  ),
                ),
                Observer(builder: (_) {
                  return widget.store.isInitialLoading
                      ? LinearProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation(AppColors.primaryRed),
                        )
                      : Container(
                          height: 25,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final bool isLastIndex =
                                  index == widget.store.listTypes.length - 1;
                              final double left = index == 0 ? 20 : 5;
                              final double right = isLastIndex ? 20 : 5;
                              final typePokemon = widget.store.listTypes[index];
                              return GestureDetector(
                                onTap: () =>
                                    widget.store.setFilterType(typePokemon),
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(left, 0, right, 0),
                                  child: Container(
                                    height: 25,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: typePokemon.cor,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        typePokemon.name!,
                                        style: AppTextStyles.white14pxw400,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: widget.store.listTypes.length,
                          ),
                        );
                })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 35, 25, 10),
            child: Text(
              'Mais Procurados',
              style: AppTextStyles.blue16pxw700,
            ),
          ),
          Expanded(
            child: Observer(builder: (_) {
              return widget.store.isInitialLoading
                  ? Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.transparent,
                          valueColor:
                              AlwaysStoppedAnimation(AppColors.primaryRed),
                        ),
                      ),
                    )
                  : widget.store.listPokemons.isEmpty &&
                          widget.store.hasErrorApi
                      ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: AppColors.primaryRed),
                                onPressed: () {
                                  widget.store
                                      .getInitialApi(context: context);
                                },
                                child: Text(
                                  'carregar Dados',
                                  style: AppTextStyles.white18pxw700,
                                )),
                          ],
                        ),
                      )
                      : Stack(
                          children: [
                            GridView.builder(
                              controller: widget.store.gridViewController,
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisExtent: 130,
                                mainAxisSpacing: 12,
                              ),
                              itemBuilder: (context, index) {
                                if (widget.store.listPokemons.length - 1 ==
                                        index ||
                                    widget.store.listPokemons.isEmpty) {
                                  widget.store.addPokemons(context);
                                }

                                bool indexpar() {
                                  if (index == 0 || (index % 2 == 0)) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                }

                                Pokemon pokemon = Pokemon();
                                if (widget.store.listPokemons.isNotEmpty) {
                                  pokemon = widget.store.listPokemons[index];
                                }

                                return widget.store.listPokemons.isEmpty
                                    ? SizedBox()
                                    : Center(
                                        child: InkWell(
                                          onTap: () {
                                            Modular.to.pushNamed(
                                                '/pokemon_select/',
                                                arguments: ArgumentsNavigation(
                                                    ontap: (int index) {
                                                      Modular.to.pop(context);
                                                      widget.store
                                                          .setindexPage(index);
                                                    },
                                                    pokemon: pokemon));
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                indexpar() ? 25 : 0,
                                                0,
                                                indexpar() ? 0 : 25,
                                                0),
                                            child: Container(
                                              height: 120,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      blurRadius: 5,
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.15),
                                                      offset: Offset(0, 4)),
                                                ],
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 12, 8, 12),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          pokemon.formatedName,
                                                          style: AppTextStyles
                                                              .blue16pxw700,
                                                        ),
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          decoration: BoxDecoration(
                                                              color: pokemon
                                                                  .types![0]
                                                                  .cor!,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical: 4,
                                                                    horizontal:
                                                                        12),
                                                            child: Text(
                                                              pokemon.types![0]
                                                                  .name!,
                                                              style: AppTextStyles
                                                                  .white14pxw400,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 4,
                                                                  top: 4),
                                                          child: Text(
                                                            pokemon.formatedId,
                                                            style: AppTextStyles
                                                                .blue12pxw400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                        child: Image.network(
                                                      pokemon.image!,
                                                    ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                              },
                              itemCount: widget.store.listPokemons.isEmpty
                                  ? 1
                                  : widget.store.listPokemons.length,
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Visibility(
                                  visible: widget.store.loadingAddPokenos,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: CircularProgressIndicator(
                                          backgroundColor: Colors.transparent,
                                          valueColor: AlwaysStoppedAnimation(
                                              AppColors.primaryRed),
                                        ),
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        );
            }),
          ),
        ],
      ),
    );
  }
}
