import 'package:teste_inicie_educacao/app/modules/start/sub_modules/home/models/pokemon_model.dart';

abstract class IApiPokemons {
  Future<List<Pokemon>> getPokemonsApi(int offsetCount);
}
