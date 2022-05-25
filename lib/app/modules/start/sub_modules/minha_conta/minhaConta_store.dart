import 'package:mobx/mobx.dart';

part 'minhaConta_store.g.dart';

class MinhaContaStore = _MinhaContaStoreBase with _$MinhaContaStore;
abstract class _MinhaContaStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}