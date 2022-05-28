import 'package:flutter_test/flutter_test.dart';
import 'package:teste_inicie_educacao/app/modules/pokemon_selected/pokemonSelected_store.dart';
 
void main() {
  late PokemonSelectedStore store;

  setUpAll(() {
    store = PokemonSelectedStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}