import 'package:teste_inicie_educacao/app/modules/start/sub_modules/favoritos/favoritos_Page.dart';
import 'package:teste_inicie_educacao/app/modules/start/sub_modules/favoritos/favoritos_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FavoritosStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const  FavoritosPage()),
  ];
}
