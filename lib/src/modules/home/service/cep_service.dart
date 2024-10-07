import 'package:app_fast_location/src/modules/home/model/cep_model.dart';
import 'package:app_fast_location/src/modules/home/repositories/cep_repository.dart';
import 'package:app_fast_location/src/modules/home/repositories/local_repository.dart';

class CepService {
  final CepRepository cepRepository;
  final LocalRepository localRepository;

  CepService(this.cepRepository, this.localRepository);

  Future<CepModel> fetchCep(String cep) async {
    final cepData = await cepRepository.getCep(cep);
    localRepository.saveCep(cepData);
    return cepData;
  }

  List<CepModel> getHistory() {
    return localRepository.getHistory();
  }
}
