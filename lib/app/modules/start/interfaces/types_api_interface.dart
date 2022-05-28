

import '../models/type_pokemon_model.dart';

abstract class IApiTypes {
  Future<List<TypePokemon>> getTypessApi();
}
