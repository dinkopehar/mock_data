import 'package:mock_data/src/constants.dart';
import 'package:mock_data/mock_data.dart';
import 'package:test/test.dart';

void main() {
  group('mockString tests', () {

    test('Test mockString only', () {
      expect(mockString().length, equals(16));
      expect(mockString(5).length, equals(5));
      //expect(mockString(16, 'aA').contains(RegExp(r'(\d)')), isFalse);
      //expect(mockString(16, '!').contains(RegExp(r'(\d)')), isTrue);
      //expect(mockString(7, 'aA').contains(RegExp(r'[\w]')), isTrue);
      //expect(mockString(7, 'abc'), throwsArgumentError);
      //expect(mockString(0), isArgumentError);
      //expect(mockString(-1), throwsArgumentError);
    });
    
    test('Test mockString called from mockRange', () {
      expect(mockRange(mockString, 10).length, equals(10));
      expect(mockRange(mockString, 5,
          lengthOfMockedString: 3).map((s) => s.length).toList(),
          equals(List<int>.generate(5, (_) => 3)));
    });
  });

  group('mockInteger tests', () {

    test('Test mockInteger only', () {
      expect(mockInteger(), inInclusiveRange(1, 10));
      expect(mockInteger(-15, -10), inInclusiveRange(-15, -10));
      expect(mockInteger(-7, 17), inInclusiveRange(-7, 17));
      mockRange(mockInteger, 100, min: 1, max: 10).forEach((el) =>
          expect(el, inInclusiveRange(1, 10)));
    });

    test('Test mockInteger called from mockRange', () {
      mockRange(mockInteger, 100, min: 1, max: 10).forEach((el) =>
          expect(el, inInclusiveRange(1, 10)));
    });

  });

  group('mockIPv4 tests', () {

    test('Test mockIPv4 only', () {
      expect(mockIPv4('192.168.0.1'), equals('192.168.0.1'));
      expect(mockIPv4('192.168.*.*'), startsWith('192.168.'));
      expect(mockIPv4('*.168.*.*').split('.').length, equals(4));
    });

    test('Test mockIPv4 called from mockRange', () {
      //mockRange(mockIPv4, 15).forEach((ip) => expect(ip.toString(), ));
    });
  });

  group('mockName tests', () {

    test('Test mockName only', () {
      expect(maleNames.union(femaleNames), contains(mockName()));
      expect(maleNames, contains(mockName('male')));
      expect(femaleNames, contains(mockName('female')));
    });

    test('Test mockName called from mockRange', () {
      expect(mockRange(mockName, 15).length, equals(15));
      expect(femaleNames, containsAll(
          mockRange(mockName, 15, gender: 'female').toSet()));
    });
  });

}
