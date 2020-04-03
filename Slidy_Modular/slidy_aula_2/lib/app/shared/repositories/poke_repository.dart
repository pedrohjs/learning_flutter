import 'package:dio/dio.dart';
import 'package:slidy_aula_2/app/shared/models/pokemon_model.dart';
import 'package:slidy_aula_2/app/shared/utils/constants.dart';

class PokeRepository {

  final Dio dio;

  PokeRepository(this.dio);

  Future<List<PokemonModel>> getAllPokemons() async {
    var response = await dio.get('/pokemon');
    List<PokemonModel> list = [];
    for(var json in response.data['results'] as List) {
      PokemonModel model = PokemonModel(json['name']);
      list.add(model);
    }

    return list;
  }

}