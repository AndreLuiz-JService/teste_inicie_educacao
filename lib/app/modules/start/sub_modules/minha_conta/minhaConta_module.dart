import 'package:teste_inicie_educacao/app/modules/start/sub_modules/minha_conta/minhaConta_Page.dart';
import 'package:teste_inicie_educacao/app/modules/start/sub_modules/minha_conta/minhaConta_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MinhaContaModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MinhaContaStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => MinhaContaPage()),
  ];
}
