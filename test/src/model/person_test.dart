import 'package:flutter_test/flutter_test.dart';
import 'package:test_activity/src/model/person.dart';

void main() {
  final person = Person(name: "Samuel", age: 22, height: 1.68, weight: 67);

  group('IMC', () {
    test('IMC deve ser correto', () async {
      expect(person.imc, 23.74);
    });

    test('IMC deve ser um valor double', () async {
      expect(person.imc, isA<double>());
    });
  });

  test('Se a idade for maior ou igual que 18, então isOlder deve ser true',
      () async {
    expect(person.isOlder, true);
  });
}
