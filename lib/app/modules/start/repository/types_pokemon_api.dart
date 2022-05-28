

import '../interfaces/cliente_http_service_interface.dart';
import '../interfaces/types_api_interface.dart';
import '../models/type_pokemon_model.dart';

class ApiTypesRepository implements IApiTypes {
  final IHttpService service;

  ApiTypesRepository(this.service);

  @override
  Future<List<TypePokemon>> getTypessApi() async {
    try {
      // nessa requisição vamos pegar os dados de cada type de pokemon
      final data = await service.getApi(
          "https://pokeapi.co/api/v2/type/");
      final results = data['results'];
      
      List<TypePokemon> listTypes = [];
      // nesse for vamos percorres os resultados da requisição para pegar os nomes de cada type
      for (var resultTypes in results) {
        final type = TypePokemon.fromMap(resultTypes);
        listTypes.add(type);
      }
      return listTypes;
    } catch (e) {
      rethrow;
    }
  }
}
