import 'package:flutter_test/flutter_test.dart';
import 'package:teste_inicie_educacao/app/modules/start/sub_modules/home/home_store.dart';
 
void main() {
  late HomeStore store;

  setUpAll(() {
    store = HomeStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}