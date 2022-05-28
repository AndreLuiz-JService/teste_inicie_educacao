import 'package:teste_inicie_educacao/app/modules/pokemon_selected/pokemonSelected_page.dart';
import 'package:teste_inicie_educacao/app/modules/pokemon_selected/pokemonSelected_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PokemonSelectedModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PokemonSelectedStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => PokemonSelectedPage(
              arguments: args.data,
            )),
  ];
}
