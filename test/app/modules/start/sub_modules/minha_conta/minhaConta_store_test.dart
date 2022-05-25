import 'package:flutter_test/flutter_test.dart';
import 'package:teste_inicie_educacao/app/modules/start/sub_modules/minha_conta/minhaConta_store.dart';
 
void main() {
  late MinhaContaStore store;

  setUpAll(() {
    store = MinhaContaStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}