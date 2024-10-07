import 'package:dio/dio.dart';
import 'package:app_fast_location/src/http/dio_client.dart';
import 'package:app_fast_location/src/modules/home/model/cep_model.dart';

class CepRepository {
  final DioClient dioClient;

  CepRepository(this.dioClient);

  Future<CepModel> getCep(String cep) async {
    final response = await dioClient.getCepData(cep);
    return CepModel.fromJson(response.data);
  }
}
