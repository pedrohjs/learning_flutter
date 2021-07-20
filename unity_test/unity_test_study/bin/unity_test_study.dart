import 'package:unity_test_study/person.dart';

void main(List<String> arguments) {
  final person = Person(name: 'Pedro', age: 25, height: 1.79, weight: 55);

  print('Imc deve vir 17.17: ${person.imc == 17.17}');
  print(person.imc);
}
