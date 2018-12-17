import 'package:mock_data/mock_data.dart';
import 'package:test/test.dart';

void main() {
  group('mockString tests', () {

    test('Test mockString only', () {
      expect(mockString().length, 16);
      expect(mockString(5).length, 5);
      expect(mockString(16, 'aA').contains(RegExp(r'(\d)')), isFalse);
      expect(mockString(16, '!').contains(RegExp(r'(\d)')), isTrue);
      expect(mockString(7, 'aA').contains(RegExp(r'[\w]')), isTrue);
      //expect(mockString(7, 'abc'), throwsArgumentError);
      //expect(mockString(0), isArgumentError);
      //expect(mockString(-1), throwsArgumentError);
    });
    
    test('Test mockString called from mockRange', () {
      expect(mockRange(mockString, 10).length, 10);
      expect(mockRange(mockString, 5,
          lengthOfMockedString: 3).map((s) => s.length).toList(),
          List<int>.generate(5, (_) => 3));
    });
  });

  group('mockInteger tests', () {

    test('Test mockInteger only', () {

    });

    test('Test mockInteger called from mockRange', () {

    });
  });

  group('mockIPv4 tests', () {

    test('Test mockIPv4 only', () {

    });

    test('Test mockIPv4 called from mockRange', () {

    });
  });
}
