import 'package:hive_flutter/hive_flutter.dart'; 
import 'package:app_fast_location/src/modules/home/model/cep_model.dart';

class LocalStorage {
  static const String historyBoxName = 'addressHistory';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CepModelAdapter()); 
    await Hive.openBox<CepModel>(historyBoxName);
  }

  static Box<CepModel> getHistoryBox() {
    return Hive.box<CepModel>(historyBoxName);
  }
}
