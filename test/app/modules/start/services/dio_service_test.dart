
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_inicie_educacao/app/modules/start/services/dio_service.dart';

void main() {
  final DioService dioService = DioService(Dio());
  test(
    'deve retorna o nome do pokemon passado',
    () async {
      final pokemondata =
          await dioService.getApi("https://pokeapi.co/api/v2/pokemon/5/");
      expect(pokemondata['name'], 'charmeleon');
    },
  );
}
