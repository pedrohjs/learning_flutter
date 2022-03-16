import 'package:bloc_class/app/home/search_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCepBloc extends Bloc<String, SearchCepState> {
  final Dio _dio;

  SearchCepBloc(this._dio) : super(const SearchCepSuccess({})) {
    on<String>(_searchCep);
  }

  void _searchCep(String event, Emitter<SearchCepState> emit) async {
    emit(const SearchCepLoading());
    try {
      final response = await _dio.get('https://viacep.com.br/ws/$event/json/');
      emit(SearchCepSuccess(response.data));
    } catch (e) {
      emit(const SearchCepError('Deu ruim!!!'));
    }
  }
}
