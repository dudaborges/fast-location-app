import 'package:dio/dio.dart';

class DioClient {
  Dio dio = Dio();

  DioClient() {
    dio.options.baseUrl = 'https://viacep.com.br/ws/';
  }

  Future<Response> getCepData(String cep) async {
    try {
      final response = await dio.get('$cep/json/');
      return response;
    } catch (e) {
      throw Exception('Erro ao buscar o CEP: $e');
    }
  }
}
