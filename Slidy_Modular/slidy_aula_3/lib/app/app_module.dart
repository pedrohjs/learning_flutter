import 'package:slidy_aula_3/app/modules/login/login_module.dart';
import 'package:slidy_aula_3/app/pages/splash/splash_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:slidy_aula_3/app/pages/splash/splash_page.dart';
import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'shared/utils/constants.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
        Bind((i) => AppController()),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE)))
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SplashPage()),
        Router('/home', module: HomeModule()),
        Router('/login', module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
