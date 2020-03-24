import 'package:animation_app/screens/home/widgets/list_data.dart';
import 'package:flutter/material.dart';

class AnimatedListView extends StatelessWidget {

  final Animation<EdgeInsets> listSlidePosition;

  AnimatedListView({@required this.listSlidePosition});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        ListData(
          title: 'Estudar Flutter',
          subtitle: 'Udemy',
          image: AssetImage('images/todo.png'),
          margin: listSlidePosition.value * 1,
        ),
        ListData(
          title: 'Estudar Dart',
          subtitle: 'Fluterando',
          image: AssetImage('images/todo.png'),
          margin: listSlidePosition.value * 0,
        )
      ],
    );
  }
}
