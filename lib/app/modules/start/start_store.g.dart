// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StartStore on _StartStoreBase, Store {
  Computed<List<Pokemon>>? _$listPokemonsComputed;

  @override
  List<Pokemon> get listPokemons => (_$listPokemonsComputed ??=
          Computed<List<Pokemon>>(() => super.listPokemons,
              name: '_StartStoreBase.listPokemons'))
      .value;

  late final _$filterNameAtom =
      Atom(name: '_StartStoreBase.filterName', context: context);

  @override
  String get filterName {
    _$filterNameAtom.reportRead();
    return super.filterName;
  }

  @override
  set filterName(String value) {
    _$filterNameAtom.reportWrite(value, super.filterName, () {
      super.filterName = value;
    });
  }

  late final _$filterTypeAtom =
      Atom(name: '_StartStoreBase.filterType', context: context);

  @override
  TypePokemon? get filterType {
    _$filterTypeAtom.reportRead();
    return super.filterType;
  }

  @override
  set filterType(TypePokemon? value) {
    _$filterTypeAtom.reportWrite(value, super.filterType, () {
      super.filterType = value;
    });
  }

  late final _$_listPokemonsAtom =
      Atom(name: '_StartStoreBase._listPokemons', context: context);

  @override
  ObservableList<Pokemon> get _listPokemons {
    _$_listPokemonsAtom.reportRead();
    return super._listPokemons;
  }

  @override
  set _listPokemons(ObservableList<Pokemon> value) {
    _$_listPokemonsAtom.reportWrite(value, super._listPokemons, () {
      super._listPokemons = value;
    });
  }

  late final _$_listTypesAtom =
      Atom(name: '_StartStoreBase._listTypes', context: context);

  @override
  List<TypePokemon>? get _listTypes {
    _$_listTypesAtom.reportRead();
    return super._listTypes;
  }

  @override
  set _listTypes(List<TypePokemon>? value) {
    _$_listTypesAtom.reportWrite(value, super._listTypes, () {
      super._listTypes = value;
    });
  }

  late final _$_isInitialLoadingAtom =
      Atom(name: '_StartStoreBase._isInitialLoading', context: context);

  @override
  bool get _isInitialLoading {
    _$_isInitialLoadingAtom.reportRead();
    return super._isInitialLoading;
  }

  @override
  set _isInitialLoading(bool value) {
    _$_isInitialLoadingAtom.reportWrite(value, super._isInitialLoading, () {
      super._isInitialLoading = value;
    });
  }

  late final _$_loadingAddPokenosAtom =
      Atom(name: '_StartStoreBase._loadingAddPokenos', context: context);

  @override
  bool get _loadingAddPokenos {
    _$_loadingAddPokenosAtom.reportRead();
    return super._loadingAddPokenos;
  }

  @override
  set _loadingAddPokenos(bool value) {
    _$_loadingAddPokenosAtom.reportWrite(value, super._loadingAddPokenos, () {
      super._loadingAddPokenos = value;
    });
  }

  late final _$_indexPageAtom =
      Atom(name: '_StartStoreBase._indexPage', context: context);

  @override
  int get _indexPage {
    _$_indexPageAtom.reportRead();
    return super._indexPage;
  }

  @override
  set _indexPage(int value) {
    _$_indexPageAtom.reportWrite(value, super._indexPage, () {
      super._indexPage = value;
    });
  }

  late final _$getInitialApiAsyncAction =
      AsyncAction('_StartStoreBase.getInitialApi', context: context);

  @override
  Future getInitialApi() {
    return _$getInitialApiAsyncAction.run(() => super.getInitialApi());
  }

  late final _$addPokemonsAsyncAction =
      AsyncAction('_StartStoreBase.addPokemons', context: context);

  @override
  Future addPokemons() {
    return _$addPokemonsAsyncAction.run(() => super.addPokemons());
  }

  late final _$_StartStoreBaseActionController =
      ActionController(name: '_StartStoreBase', context: context);

  @override
  dynamic setFilterName(String value) {
    final _$actionInfo = _$_StartStoreBaseActionController.startAction(
        name: '_StartStoreBase.setFilterName');
    try {
      return super.setFilterName(value);
    } finally {
      _$_StartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilterType(TypePokemon value) {
    final _$actionInfo = _$_StartStoreBaseActionController.startAction(
        name: '_StartStoreBase.setFilterType');
    try {
      return super.setFilterType(value);
    } finally {
      _$_StartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInitalIndex(int index) {
    final _$actionInfo = _$_StartStoreBaseActionController.startAction(
        name: '_StartStoreBase.setInitalIndex');
    try {
      return super.setInitalIndex(index);
    } finally {
      _$_StartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setindexPage(int index) {
    final _$actionInfo = _$_StartStoreBaseActionController.startAction(
        name: '_StartStoreBase.setindexPage');
    try {
      return super.setindexPage(index);
    } finally {
      _$_StartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filterName: ${filterName},
filterType: ${filterType},
listPokemons: ${listPokemons}
    ''';
  }
}
