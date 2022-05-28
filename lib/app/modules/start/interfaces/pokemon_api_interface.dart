

import '../models/pokemon_model.dart';

abstract class IApiPokemons {
  Future<List<Pokemon>> getPokemonsApi(int offsetCount);
}
