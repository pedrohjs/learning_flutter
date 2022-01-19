import 'dart:async';
import 'package:bloc_class/app/home/search_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCepBloc extends Bloc<String, SearchCepState> {
  SearchCepBloc() : super(const SearchCepSuccess({}));

  @override
  Stream<SearchCepState> mapEventToState(String event) async* {
    yield const SearchCepLoading();
    try {
      final response = await Dio().get('https://viacep.com.br/ws/$event/json/');
      yield SearchCepSuccess(response.data);
    } catch (e) {
      yield const SearchCepError('Deu ruim!!!');
    }
  }
}
