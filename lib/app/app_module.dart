import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_inicie_educacao/app/modules/pokemon_selected/pokemonSelected_module.dart';
import 'package:teste_inicie_educacao/app/modules/start/start_module.dart';

import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/start/', module: StartModule()),
    ModuleRoute('/pokemon_select/', module: PokemonSelectedModule()),
  ];

}