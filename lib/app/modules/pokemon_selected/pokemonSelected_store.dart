import 'package:mobx/mobx.dart';

part 'pokemonSelected_store.g.dart';

class PokemonSelectedStore = _PokemonSelectedStoreBase with _$PokemonSelectedStore;
abstract class _PokemonSelectedStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}