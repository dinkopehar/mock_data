import 'constants.dart' show random, familyNames;

/// Generate random family name.
///
/// Returns `String` representing a family name.
///
/// For list of names, check [familyNames](https://github.com/dinkopehar/mock_data/blob/master/assets/familyNames.md).
///
/// Example usage:
/// ```dart
///   mockFamilyName()  // returns family name.
/// ```
String mockFamilyName() =>
    familyNames.elementAt(random.nextInt(familyNames.length));
