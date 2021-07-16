import 'package:dio/dio.dart';
import 'package:pokedex/src/models/PokemonDTO.dart';

class PokemonService {
  late Dio _dio;
  BaseOptions _baseOptions = BaseOptions(
    baseUrl: 'https://pokeapi.co/api/v2/',
    connectTimeout: 60000,
    receiveTimeout: 60000,
    sendTimeout: 60000,
  );

  PokemonService() {
    _dio = Dio(_baseOptions);
  }

  Future<List<String>> getPokemonsNames({required int offset, int limit = 10}) {
    return this
        ._dio
        .get('pokemon?limit=$limit&offset=$offset')
        .then((response) {
      var list = response.data['results'] as List;
      List<String> pokemonNames =
          list.map((e) => e['name'].toString()).toList();
      return pokemonNames;
    }).catchError((error) {
      throw error;
    });
  }

  Future<PokemonDTO> getPokemonByName({required String name}) {
    return this._dio.get('pokemon/$name').then((response) {
      return PokemonDTO.map(response.data);
    }).catchError((error) {
      throw error;
    });
  }
}
