@Timeout(Duration(seconds: 60))

import 'package:test/test.dart';

void main() {
  test('is Worked', () {
    final name = 'Pedro';
    expect(name,
        allOf([equals('Pedro'), isNotNull, isA<String>(), contains('ed')]));
  });

  test('throw error', () {
    expect(() => int.parse('x'), throwsException);
  }, tags: 'web');
}
