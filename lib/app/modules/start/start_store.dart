import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_inicie_educacao/app/shared/core/app_text_styles.dart';

import 'interfaces/pokemon_api_interface.dart';
import 'interfaces/types_api_interface.dart';
import 'models/pokemon_model.dart';
import 'models/type_pokemon_model.dart';
part 'start_store.g.dart';

class StartStore = _StartStoreBase with _$StartStore;

abstract class _StartStoreBase with Store implements Disposable {
  IApiPokemons apiPokemonsRepository;
  IApiTypes apiTypesRepository;

  _StartStoreBase(
    IApiPokemons this.apiPokemonsRepository,
    IApiTypes this.apiTypesRepository,
  ) {
    getInitialApi();
  }

  @observable
  String filterName = '';
  @action
  setFilterName(String value) => filterName = value;

  @observable
  TypePokemon? filterType;
  @action
  setFilterType(TypePokemon value) {
    if (value == filterType) {
      filterType = null;
    } else {
      filterType = value;
    }
  }

  @observable
  ObservableList<Pokemon> _listPokemons = <Pokemon>[].asObservable();
  //metodo que filtra a lista de pokemons
  @computed
  List<Pokemon> get listPokemons {
    ObservableList<Pokemon> filterPokemon = _listPokemons;
    //aqui filtramos a lista encima do nome do pokemon
    if (filterName.isNotEmpty) {
      filterPokemon = filterPokemon
          .where(
              (p) => p.name!.toLowerCase().contains(filterName.toLowerCase()))
          .toList()
          .asObservable();
    }
    //aqui filtramos a lista encima do tipo do pokemon
    if (filterType != null) {
      filterPokemon = filterPokemon
          .where((p) => p.types!
              .where((t) => t.name == filterType!.name)
              .toList()
              .isNotEmpty)
          .toList()
          .asObservable();
    }
    return filterPokemon;
  }

  @observable
  List<TypePokemon>? _listTypes = [];
  List<TypePokemon> get listTypes => _listTypes!;

  ScrollController gridViewController = ScrollController();

  @observable
  bool _isInitialLoading = false;
  bool get isInitialLoading => _isInitialLoading;

  @observable
  bool _loadingAddPokenos = false;
  bool get loadingAddPokenos => _loadingAddPokenos;

  @observable
  bool _isLastPage = false;
  bool get isLastPage => _isLastPage;

  @observable
  bool _hasErrorApi = false;
  bool get hasErrorApi => _hasErrorApi;

  int _offsetCount = 0;
  //função que busca os dados inicias da aplicação
  //nessa função pegamos os tipos de pokemons e a primeira pagina da api de pokemons
  @action
  getInitialApi({BuildContext? context}) async {
    _isInitialLoading = true;
    try {
      final initialPokemons =
          await apiPokemonsRepository.getPokemonsApi(_offsetCount);
      _listPokemons.addAll(initialPokemons);
      _offsetCount += 20;
      final types = await apiTypesRepository.getTypessApi();
      _listTypes = types;
      if(_hasErrorApi){
        _hasErrorApi = false;
      }
    } catch (e) {
      _hasErrorApi = true;
      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Erro ao carregar os dados, verifique sua conexão',
            style: AppTextStyles.white14pxw400,
          ),
          dismissDirection: DismissDirection.horizontal,
          backgroundColor: Colors.red,
        ));
      }
    } finally {
      _isInitialLoading = false;
    }
  }

  //função chamada quando o usuario chega ao final da lista
  //a função busca mais uma pagina na api de pokemons
  @action
  addPokemons(BuildContext context) async {
    if (_loadingAddPokenos || _isLastPage) {
      return;
    }
    try {
      _loadingAddPokenos = true;
      final newsPokemons =
          await apiPokemonsRepository.getPokemonsApi(_offsetCount);
      _listPokemons.addAll(newsPokemons);
      _offsetCount += 20;
    } catch (e) {
      if (e.toString() == 'Last Page') {
        _isLastPage = true;
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Erro ao carregar os Pokemons, verifique sua conexão',
          style: AppTextStyles.white14pxw400,
        ),
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: Colors.red,
      ));
    } finally {
      _loadingAddPokenos = false;
    }
  }

  // seção que controla a PageView
  PageController pageViewController = PageController();
  @observable
  int _indexPage = 0;
  int get indexPage => _indexPage;

  @action
  setInitalIndex(int index) {
    pageViewController = PageController(initialPage: index);
    _indexPage = index;
  }

  @action
  void setindexPage(int index) {
    pageViewController.jumpToPage(index);
    _indexPage = index;
  }

  //DIspode dos controllers

  @override
  void dispose() {
    gridViewController.dispose();
    pageViewController.dispose();
  }
}
