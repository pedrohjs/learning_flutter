import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/src/models/PokemonDTO.dart';
import 'package:pokedex/src/services/pokemon_service.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final _pokemonService = PokemonService();
  final txtSearch = TextEditingController();

  @observable
  ObservableList<PokemonDTO> pokemons = ObservableList<PokemonDTO>.of([]);

  _HomeControllerBase() {
    this._getPokemons();
  }

  void _getPokemons() {
    this
        ._pokemonService
        .getPokemonsNames(offset: this.pokemons.length)
        .then((value) {
      value.forEach((e) => this.getPokemonByName(name: e));
    });
  }

  void getPokemonByName({required String name, bool clearList = false}) {
    this._pokemonService.getPokemonByName(name: name).then((value) {
      if (clearList) this.pokemons.clear();
      this.pokemons.add(value);
    }).catchError((error) {
      print(error);
    });
  }
}
