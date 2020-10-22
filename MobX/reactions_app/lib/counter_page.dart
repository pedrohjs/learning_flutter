import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:reactions_app/counter_page_controller.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final controller = CounterPageController();

  List<ReactionDisposer> disposers;

  @override
  void initState() {
    disposers = [
      reaction<bool>(
        (r) => controller.counter % 2 == 0,
        (isEven) {
          if (isEven)
            return Flushbar(
              title: 'Opa!',
              message: 'É par!',
              duration: Duration(milliseconds: 800),
            ).show(context);
        },
      ),
      when(
        (r) => controller.counter >= 10,
        () => Flushbar(
          title: 'Opa!',
          message: 'É >= 10!',
          duration: Duration(milliseconds: 800),
        ).show(context),
      ),
      autorun((r) => print('${controller.isEven}')),
    ];

    super.initState();
  }

  @override
  void dispose() {
    disposers.forEach((element) => dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX Reactions'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (_) {
                return Text(
                  '${controller.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
