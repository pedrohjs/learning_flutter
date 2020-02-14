import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_app/body.dart';
import 'package:form_app/models/controller.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  final controller = Controller();

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<Controller>();

    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) {
            return Text(controller.isValid
                ? 'Formulário Validado'
                : 'Formulário Não Validado');
          },
        ),
      ),
      body: BodyWidget(),
    );
  }
}
