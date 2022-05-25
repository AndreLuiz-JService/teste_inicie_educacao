import 'package:flutter_test/flutter_test.dart';
import 'package:teste_inicie_educacao/app/modules/start/sub_modules/favoritos/favoritos_store.dart';
 
void main() {
  late FavoritosStore store;

  setUpAll(() {
    store = FavoritosStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}