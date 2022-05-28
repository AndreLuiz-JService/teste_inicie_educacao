
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_inicie_educacao/app/modules/start/repository/pokemon_api.dart';
import 'package:teste_inicie_educacao/app/modules/start/services/dio_service.dart';

void main() {
  final ApiPokemonRepository repository = ApiPokemonRepository(DioService());

  test('deve retorna uma lista de pokemons', () async{
    final listPokemons = await repository.getPokemonsApi(0);
    expect(listPokemons[4].name, 'charmeleon');
    expect(listPokemons[4].id, 5);
    expect(listPokemons[4].generation, 'generation-i');
    expect(listPokemons[4].hp, 58);
    expect(listPokemons[4].description, 'When it swings\nits burning tail,\nit elevates the\ftemperature to\nunbearably high\nlevels.');
  },);
}