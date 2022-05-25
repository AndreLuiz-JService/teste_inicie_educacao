import 'package:teste_inicie_educacao/app/modules/start/sub_modules/home/interfaces/pokemon_api_interface.dart';
import 'package:teste_inicie_educacao/app/modules/start/sub_modules/home/models/pokemon_model.dart';

import '../interfaces/cliente_http_service_interface.dart';

class ApiPokemonRepository implements IApiPokemons {
  final IHttpService service;

  ApiPokemonRepository(this.service);

  @override
  Future<List<Pokemon>> getPokemonsApi(int offsetCount) async {
    try {
      // nessa requisição pegaremos os links dos dados de cada pokemon
      final data = await service.getApi(
          "https://pokeapi.co/api/v2/pokemon/?limit=20&offset=$offsetCount");
      final results = data['results'];
      
      List<Pokemon> Listpokemons = [];

      // nesse for vamos percorres os resultados da requisição para pegar os dados de cada pokemon
      for (var resultPokemon in results) {
        final urlPokemon = resultPokemon['url'];
        var pokemonData = await service.getApi(urlPokemon);
        final pokemon = Pokemon.fromMap(pokemonData);
        final pokemonEspecies = await service
            .getApi("https://pokeapi.co/api/v2/pokemon-species/${pokemon.id}/");
            
        pokemon.setEspecies(pokemonEspecies);
        Listpokemons.add(pokemon);
      }

      return Listpokemons;
    } catch (e) {
      rethrow;
    }
  }
}
