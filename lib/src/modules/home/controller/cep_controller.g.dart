// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CepController on _CepControllerBase, Store {
  late final _$cepModelAtom =
      Atom(name: '_CepControllerBase.cepModel', context: context);

  @override
  CepModel? get cepModel {
    _$cepModelAtom.reportRead();
    return super.cepModel;
  }

  @override
  set cepModel(CepModel? value) {
    _$cepModelAtom.reportWrite(value, super.cepModel, () {
      super.cepModel = value;
    });
  }

  late final _$historyAtom =
      Atom(name: '_CepControllerBase.history', context: context);

  @override
  ObservableList<CepModel> get history {
    _$historyAtom.reportRead();
    return super.history;
  }

  @override
  set history(ObservableList<CepModel> value) {
    _$historyAtom.reportWrite(value, super.history, () {
      super.history = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CepControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$searchCepAsyncAction =
      AsyncAction('_CepControllerBase.searchCep', context: context);

  @override
  Future<void> searchCep(String cep) {
    return _$searchCepAsyncAction.run(() => super.searchCep(cep));
  }

  late final _$_CepControllerBaseActionController =
      ActionController(name: '_CepControllerBase', context: context);

  @override
  void loadHistory() {
    final _$actionInfo = _$_CepControllerBaseActionController.startAction(
        name: '_CepControllerBase.loadHistory');
    try {
      return super.loadHistory();
    } finally {
      _$_CepControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cepModel: ${cepModel},
history: ${history},
isLoading: ${isLoading}
    ''';
  }
}
