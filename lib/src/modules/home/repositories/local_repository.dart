import 'package:hive/hive.dart';
import 'package:app_fast_location/src/modules/home/model/cep_model.dart';
import 'package:app_fast_location/src/shared/storage/local_storage.dart';

class LocalRepository {
  final Box<CepModel> _box = LocalStorage.getHistoryBox();

  void saveCep(CepModel cep) {
    _box.add(cep); // Adiciona o CEP à caixa
  }

  List<CepModel> getHistory() {
    return _box.values.toList();
  }
}
