import 'package:test/expect.dart';
import 'package:test/test.dart';
import 'package:unity_test_study/person.dart';

void main() {
  final person = Person(name: 'Pedro', age: 25, height: 1.79, weight: 55);

  test('Cálculo IMC', () {
    expect(person.imc, 17.17);
  });

  test('Maior de idade (deve ter pelo menos 18 anos)', () {
    expect(person.isOlder, true);
  });
}
