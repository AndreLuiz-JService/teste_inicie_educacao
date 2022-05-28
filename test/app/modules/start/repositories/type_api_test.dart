
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_inicie_educacao/app/modules/start/repository/types_pokemon_api.dart';
import 'package:teste_inicie_educacao/app/modules/start/services/dio_service.dart';

void main() {
  final ApiTypesRepository repository = ApiTypesRepository(DioService());

  test('deve retorna uma lista de types', () async{
    final listType = await repository.getTypessApi();
    expect(listType[2].name, 'flying');
  },);
}