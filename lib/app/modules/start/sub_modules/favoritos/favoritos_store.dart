import 'package:mobx/mobx.dart';

part 'favoritos_store.g.dart';

class FavoritosStore = _FavoritosStoreBase with _$FavoritosStore;
abstract class _FavoritosStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}