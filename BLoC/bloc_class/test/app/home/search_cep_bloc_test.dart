import 'package:bloc_class/app/home/search_cep_bloc.dart';
import 'package:bloc_class/app/home/search_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements DioForNative {}

void main() {
  final _dio = DioMock();

  when(() => _dio.get(any())).thenAnswer((_) async => Response(
        data: {},
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ));

  blocTest<SearchCepBloc, SearchCepState>(
    'Busca cidade by cep',
    build: () => SearchCepBloc(_dio),
    act: (bloc) => bloc.add('30494170'),
    expect: () => [
      isA<SearchCepLoading>(),
      isA<SearchCepSuccess>(),
    ],
  );
}
