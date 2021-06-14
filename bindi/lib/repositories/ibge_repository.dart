import 'package:bindi/models/uf.dart';
import 'package:dio/dio.dart';

class IBGERepository {
  Future<List<UF>> getUFListFromApi() async {
    const enpoint =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados';

    try {
      final response = await Dio().get<List>(enpoint);

      final ufList = response.data.map<UF>((j) => UF.fromJson(j)).toList()
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

      return ufList;
    } on DioError {
      return Future.error('Falha ao obter lista de Estados');
    }
  }

  getCityListFromApi() {}
}
