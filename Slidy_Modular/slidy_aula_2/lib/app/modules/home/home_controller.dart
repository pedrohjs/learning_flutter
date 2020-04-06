import 'package:mobx/mobx.dart';
import 'package:slidy_aula_2/app/modules/home/repositories/models/pokemon_model.dart';
import 'package:slidy_aula_2/app/modules/home/repositories/poke_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {

  final PokeRepository repository;

  @observable
  ObservableFuture<List<PokemonModel>> pokemons;

  _HomeController(this.repository){
    fetchPokemons();
  }

  @action
  fetchPokemons() {
    pokemons = repository.getAllPokemons().asObservable();
  }

}