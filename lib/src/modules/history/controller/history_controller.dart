import 'package:mobx/mobx.dart';
import 'package:hive/hive.dart';
import 'package:app_fast_location/src/shared/storage/local_storage.dart';
import 'package:app_fast_location/src/modules/home/model/cep_model.dart';

part 'history_controller.g.dart';

class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
  Box<CepModel>? historyBox; 

  @observable
  ObservableList<CepModel> addressHistory = ObservableList<CepModel>();

  void init() async {
    historyBox = LocalStorage.getHistoryBox(); 
    loadHistory();
  }

  @action
  void loadHistory() {
    if (historyBox != null) {
      final history = historyBox!.values.toList();
      addressHistory = ObservableList.of(history);
    }
  }
}
