import 'constants.dart' show random;

/// Generate random string.
///
/// [lengthOfMockedString] defines string length. Throws [ArgumentError]
/// if length is less than or equal to 0. Default value is 16.
///
/// [include] defines set of characters that are generated for string.
/// It can be any combination of _'a'_, _'A'_ or _'#'_.
///
/// * _'a'_ represents lowercase characters.
/// * _'A'_ represents uppercase characters.
/// * _'#'_ represents digits, 0 to 9.
///
/// Default value of [include] is _'!'_ which is equal to
/// combination of _'aA#'_.
///
/// Throws [ArgumentError] if it contains any letter other than _'a'_,
/// _'A'_, _'#'_ or _'!'_.
///
/// Example usage:
/// ```dart
///   mockString(4)       // returns string of length 4 which is
///                       // consisted of any combination of
///                       // lowercase letters, uppercase letters
///                       // and digits.
///                       // Example: Dg3C, H77a, B1LK etc.
///   mockString(7, 'a#') // returns string of length 7 which is
///                       // consisted of any combination of
///                       // lowercase letters and digits.
///                       // Example: g5a6hjc, 4hn9m3e, 6dei5e2 etc.
///   mockString(5, '#')  // returns string of length 5 which is
///                       // consisted of digits.
///                       // Example: 51321, 74214, 06910 etc.
/// ```
String mockString([int lengthOfMockedString = 16, String include = '!']) {
  // Check for validity of parameters.

  lengthOfMockedString <= 0
      ? throw ArgumentError('Length must be integer '
          'higher than 0')
      : null;

  include.length == 0 ? throw ArgumentError('Empty include parameter') : null;

  include.split('').forEach((s) {
    if (!('aA#!'.contains(s))) throw ArgumentError('Invalid include parameter');
  });

  // Representation of all characters that will be generated
  // based on [include] parameter.
  var allChars = StringBuffer();

  for (var c in include.split('')) {
    if (c.contains('!')) {
      allChars.writeAll(
          ["abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ"],
          "0123456789");
      break;
    }
    switch (c) {
      case 'a':
        allChars.write("abcdefghijklmnopqrstuvwxyz");
        break;
      case 'A':
        allChars.write("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
        break;
      case '#':
        allChars.write("0123456789");
        break;
      default:
        break;
    }
  }

  // Generate sequence of chars with length == [lengthOfMockedString]
  return List<String>.generate(lengthOfMockedString,
      (_) => allChars.toString()[random.nextInt(allChars.length)]).join();
}
