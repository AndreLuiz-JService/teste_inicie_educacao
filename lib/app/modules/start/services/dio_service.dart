

import 'package:dio/dio.dart';

import '../interfaces/cliente_http_service_interface.dart';

class DioService implements IHttpService {
  Dio? dio;

  DioService([Dio? cliente]) {
    if (cliente == null) {
      this.dio = Dio();
    } else {
      this.dio = cliente;
    }
  }
  @override
  Future<Map<String, dynamic>> getApi(String url) async {
    try {
      final response = await dio!.get(url);
      final list = response.data;
      return list;
    } catch (e) {
      rethrow;
    }
  }
}
//https://pokeapi.co/api/v2/pokemon/5/
