import 'package:counter_app/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MyHomePage extends StatelessWidget {
  final controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobx'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Nome'),
                onChanged: controller.changeName,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Sobrenome'),
                onChanged: controller.changeLastName,
              ),
              SizedBox(
                height: 20.0,
              ),
              Observer(
                builder: (_) {
                  return Text(
                    '${controller.fullName}',
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
