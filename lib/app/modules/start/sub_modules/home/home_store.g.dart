// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$_isLoadingAtom =
      Atom(name: '_HomeStoreBase._isLoading', context: context);

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_listPokemonsAtom =
      Atom(name: '_HomeStoreBase._listPokemons', context: context);

  @override
  List<Pokemon>? get _listPokemons {
    _$_listPokemonsAtom.reportRead();
    return super._listPokemons;
  }

  @override
  set _listPokemons(List<Pokemon>? value) {
    _$_listPokemonsAtom.reportWrite(value, super._listPokemons, () {
      super._listPokemons = value;
    });
  }

  late final _$getInitialApiAsyncAction =
      AsyncAction('_HomeStoreBase.getInitialApi', context: context);

  @override
  Future getInitialApi() {
    return _$getInitialApiAsyncAction.run(() => super.getInitialApi());
  }

  late final _$addPokemonsAsyncAction =
      AsyncAction('_HomeStoreBase.addPokemons', context: context);

  @override
  Future addPokemons() {
    return _$addPokemonsAsyncAction.run(() => super.addPokemons());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
