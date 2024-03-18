import 'package:mock_data/mock_data.dart';
import 'package:mock_data/src/constants.dart';
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
      expect(
          mockRange(mockString, 5, lengthOfMockedString: 3)
              .map((s) => s.length)
              .toList(),
          equals(List<int>.generate(5, (_) => 3)));
    });
  });

  group('mockInteger tests', () {
    test('Test mockInteger only', () {
      expect(mockInteger(), inInclusiveRange(1, 10));
      expect(mockInteger(-15, -10), inInclusiveRange(-15, -10));
      expect(mockInteger(-7, 17), inInclusiveRange(-7, 17));
      mockRange(mockInteger, 100, min: 1, max: 10)
          .forEach((el) => expect(el, inInclusiveRange(1, 10)));
    });

    test('Test mockInteger called from mockRange', () {
      mockRange(mockInteger, 100, min: 1, max: 10)
          .forEach((el) => expect(el, inInclusiveRange(1, 10)));
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

  group('mockIPv6 tests', () {
    test('Test mockIPv6 only', () {
      expect(mockIPv6('e331:93bf:*:*:a7c9:a63:*:*'), startsWith('e331:93bf:'));
      expect(mockIPv6().split(':').length, equals(8));
    });

    test('Test mockIPv6 called from mockRange', () {
      //mockRange(mockIPv6, 15).forEach((ip) => expect(ip.toString(), ));
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
      expect(femaleNames,
          containsAll(mockRange(mockName, 15, gender: 'female').toSet()));
    });
  });

  group('mockFamilyName tests', () {
    test('Test mockFamilyName', () {
      expect(familyNames, contains(mockFamilyName()));
    });

    test('Test mockFamilyName called from mockRange', () {
      expect(mockRange(mockFamilyName, 10).length, equals(10));
      expect(familyNames, containsAll(mockRange(mockFamilyName, 15).toSet()));
    });
  });

  group('mockColor tests', () {
    test('Test mockColor only', () {
      expect(mockColor(), startsWith('rgb'));
      expect(mockColor('hex'), startsWith('#'));
      expect(mockColor('hex').length, equals(7));
      expect(mockColor('rgb'), startsWith('rgb('));
      expect(mockColor('hsv'), startsWith('hsv('));
      expect(mockColor('hsb'), startsWith('hsb('));
      expect(mockColor('hsl'), startsWith('hsl('));
      expect(mockColor('cmyk'), startsWith('cmyk('));
    });

    test('Test mockColor called from mockRange', () {
      expect(mockRange(mockColor, 15).length, equals(15));
    });
  });

  group('mockUrl tests', () {
    test('Test mockUrl only', () {
      expect(mockUrl(), startsWith('http'));
      expect(mockUrl('https'), startsWith('https'));
      expect(mockUrl('http', true, true),
          allOf(['http', 'example', '?'].map(contains).toList()));
      expect(mockUrl('*', false, false, true), contains('#'));
    });

    test('Test mockUrl called from mockRange', () {
      expect(mockRange(mockUrl, 15).length, equals(15));
    });
  });

  group('mockUUID tests', () {
    test('Test mockUUID only', () {
      // Test UUID length.
      expect(mockUUID(), hasLength(36));
      expect(mockUUID('null'), hasLength(36));
      expect(mockUUID('timestamp-first'), hasLength(36));

      // All UUIDs should contain 4 dash characters.
      expect(mockUUID(), contains('-'));
      // UUID should contain 5 segments.
      expect(mockUUID().split('-'), hasLength(5));
      // Test null UUID.
      expect(mockUUID('null'), equals('00000000-0000-0000-0000-000000000000'));
      // Test invalid argument.
      // TODO: Check when ArgumentError is raised.
      //expect(mockUUID('invalid-arg'), throwsA(TypeMatcher<ArgumentError>()));
    });

    test('Test mockUUID called from mockRange', () {
      expect(mockRange(mockUUID, 5).length, equals(5));
    });
  });

  group('mockDate tests', () {
    test('Test mockDate only', () {
      final mockedDate = mockDate();
      expect(mockedDate, isA<DateTime>());
    });

    test('Test mockDate in provided range', () {
      final firstMoment = DateTime(2000);
      final lastMoment = DateTime(2020);
      final mockedDate = mockDate(firstMoment, lastMoment);
      expect(
        mockedDate.millisecondsSinceEpoch,
        greaterThan(firstMoment.millisecondsSinceEpoch),
      );
      expect(
        mockedDate.millisecondsSinceEpoch,
        lessThan(lastMoment.millisecondsSinceEpoch),
      );
    });

    test('Test mockDate called from mockRange', () {
      final mockedDates = mockRange(mockDate, 5);
      expect(mockedDates.length, equals(5));
      expect(mockedDates.every((date) => date.runtimeType == DateTime), true);
    });
  });

  group('mockLocation tests', () {
    test('Test mockLocation only', () {
      final location = mockLocation();
      expect(location['lat'], lessThanOrEqualTo(90.0));
      expect(location['lon'], lessThanOrEqualTo(180.0));
    });

    test('Test mockLocation called from mockRange', () {
      final locations = mockRange(mockLocation, 16);
      expect(locations.every((location) => location['lat'] > 90.0), false);
      expect(locations.every((location) => location['lon'] > 180.0), false);
    });
  });
}
