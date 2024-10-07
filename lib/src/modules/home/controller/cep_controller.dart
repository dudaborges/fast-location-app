import 'package:app_fast_location/src/modules/home/model/cep_model.dart';
import 'package:app_fast_location/src/modules/home/service/cep_service.dart';
import 'package:mobx/mobx.dart';

part 'cep_controller.g.dart';

class CepController = _CepControllerBase with _$CepController;

abstract class _CepControllerBase with Store {
  final CepService cepService;

  _CepControllerBase(this.cepService);

  @observable
  CepModel? cepModel;

  @observable
  ObservableList<CepModel> history = ObservableList<CepModel>();

  @observable
  bool isLoading = false;

  @action
  Future<void> searchCep(String cep) async {
    isLoading = true;
    try {
      cepModel = await cepService.fetchCep(cep);
      if (cepModel != null) {
        history.add(cepModel!); 
        cepService.localRepository.saveCep(cepModel!);
      }
    } catch (e) {
    } finally {
      isLoading = false;
    }
  }

  @action
  void loadHistory() {
    history.addAll(cepService.getHistory());
  }
}
