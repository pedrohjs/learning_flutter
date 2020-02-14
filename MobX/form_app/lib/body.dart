import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_app/models/controller.dart';
import 'package:get_it/get_it.dart';

class BodyWidget extends StatelessWidget {

  _textField({String label, onChanged, String Function() errorText}) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        errorText: errorText == null ? null : errorText(),
      ),
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {

    final controller = GetIt.I.get<Controller>();

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Observer(
            builder: (_) {
              return _textField(
                  label: 'Nome',
                  onChanged: controller.client.changeName,
                  errorText: controller.validateName);
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          Observer(
            builder: (_) {
              return _textField(
                  label: 'Email',
                  onChanged: controller.client.changeEmail,
                  errorText: controller.validateEmail);
            },
          ),
          SizedBox(
            height: 50.0,
          ),
          Observer(
            builder: (_) {
              return RaisedButton(
                child: Text('Salvar'),
                onPressed: controller.isValid ? () {} : null,
              );
            },
          ),
        ],
      ),
    );
  }
}
