
import 'package:teste_inicie_educacao/app/modules/start/start_Page.dart';
import 'package:teste_inicie_educacao/app/modules/start/start_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_inicie_educacao/app/modules/start/sub_modules/favoritos/favoritos_module.dart';
import 'package:teste_inicie_educacao/app/modules/start/sub_modules/home/home_module.dart';
import 'package:teste_inicie_educacao/app/modules/start/sub_modules/minha_conta/minhaConta_module.dart';

class StartModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => StartStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const StartPage(), children: [
      ModuleRoute('/home/', module: HomeModule()),
      ModuleRoute('/favoritos/', module: FavoritosModule()),
      ModuleRoute('/minha_conta/', module: MinhaContaModule()),
    ]),
  ];
}
