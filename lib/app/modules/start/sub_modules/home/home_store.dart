import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_inicie_educacao/app/modules/start/sub_modules/home/interfaces/pokemon_api_interface.dart';
import 'package:teste_inicie_educacao/app/modules/start/sub_modules/home/models/pokemon_model.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;
abstract class _HomeStoreBase with Store implements Disposable{
IApiPokemons apiPokemonsRepository;

  _HomeStoreBase(
    IApiPokemons this.apiPokemonsRepository
  ){
    getInitialApi();
  }

  ScrollController gridViewController = ScrollController();

  int offsetCount = 0;

  @observable
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  @observable
  List<Pokemon>? _listPokemons = [];

  List<Pokemon> get listPokemons => _listPokemons!;

  @action
  getInitialApi() async{
    _isLoading = true;
    final newsPokemons = await apiPokemonsRepository.getPokemonsApi(offsetCount);
    _listPokemons = newsPokemons;
    _isLoading = false;
  }

  @action
  addPokemons() async {
    offsetCount += 20;
    final newsPokemons = await apiPokemonsRepository.getPokemonsApi(offsetCount);
    _listPokemons!.addAll(newsPokemons);
  }

  @override
  void dispose() {
    gridViewController.dispose();
  }
}