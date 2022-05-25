
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'start_store.g.dart';

class StartStore = _StartStoreBase with _$StartStore;

abstract class _StartStoreBase with Store {
  @observable
  int _indexPage = 0;

  int get indexPage => _indexPage;

  @action
  void setindexPage(int index) {
    if (index == 0) {
      Modular.to.navigate('../home/');
    } else if (index == 1) {
      Modular.to.navigate('../favoritos/');
    } else if (index == 2) {
      Modular.to.navigate('../minha_conta/');
    } else {
      Modular.to.navigate('../home/');
    }
    _indexPage = index;
  }
}
