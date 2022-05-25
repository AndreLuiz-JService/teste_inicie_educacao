import 'package:teste_inicie_educacao/app/modules/start/sub_modules/home/home_Page.dart';
import 'package:teste_inicie_educacao/app/modules/start/sub_modules/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_inicie_educacao/app/modules/start/sub_modules/home/interfaces/cliente_http_service_interface.dart';
import 'package:teste_inicie_educacao/app/modules/start/sub_modules/home/interfaces/pokemon_api_interface.dart';
import 'package:teste_inicie_educacao/app/modules/start/sub_modules/home/repository/pokemon_api.dart';
import 'package:teste_inicie_educacao/app/modules/start/sub_modules/home/services/dio_service.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore(
          i.get<IApiPokemons>(),
        )),
    Bind.lazySingleton<IApiPokemons>(
        (i) => ApiPokemonRepository(i.get<IHttpService>())),
    Bind.lazySingleton<IHttpService>((i) => DioService()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
  ];
}
