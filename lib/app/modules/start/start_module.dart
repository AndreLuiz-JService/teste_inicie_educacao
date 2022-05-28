
import 'package:teste_inicie_educacao/app/modules/start/start_page.dart';
import 'package:teste_inicie_educacao/app/modules/start/start_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/cliente_http_service_interface.dart';
import 'interfaces/pokemon_api_interface.dart';
import 'interfaces/types_api_interface.dart';
import 'repository/pokemon_api.dart';
import 'repository/types_pokemon_api.dart';
import 'services/dio_service.dart';

class StartModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
        (i) => StartStore(i.get<IApiPokemons>(), i.get<IApiTypes>())),
    Bind.lazySingleton<IApiPokemons>(
        (i) => ApiPokemonRepository(i.get<IHttpService>())),
    Bind.lazySingleton<IApiTypes>(
        (i) => ApiTypesRepository(i.get<IHttpService>())),
    Bind.lazySingleton<IHttpService>((i) => DioService()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) =>  StartPage()),
  ];
}
