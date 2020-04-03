import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_aula_2/app/app_widget.dart';
import 'package:slidy_aula_2/app/pages/home/home_controller.dart';
import 'package:slidy_aula_2/app/pages/home/home_page.dart';
import 'package:slidy_aula_2/app/shared/repositories/poke_repository.dart';
import 'package:slidy_aula_2/app/shared/utils/constants.dart';

class AppModule extends MainModule {

  @override
  List<Bind> get binds => [
    Bind((i) => HomeController(i.get<PokeRepository>())),
    Bind((i) => PokeRepository(i.get<Dio>())),
    Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE)))
  ];

  @override
  List<Router> get routers => [
    Router('/', child: (_, args) => HomePage()),
  ];

  @override
  Widget get bootstrap => AppWidget();

}