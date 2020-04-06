import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_aula_2/app/app_widget.dart';
import 'package:slidy_aula_2/app/modules/home/home_module.dart';
import 'package:slidy_aula_2/app/shared/utils/constants.dart';

class AppModule extends MainModule {

  @override
  List<Bind> get binds => [
    Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE)))
  ];

  @override
  List<Router> get routers => [
    Router('/', module: HomeModulo())
  ];

  @override
  Widget get bootstrap => AppWidget();

}