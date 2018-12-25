import 'constants.dart' show random, femaleNames, maleNames;

/// Generate random first name.
///
/// Returns `String` representing a first name.
///
/// [gender] parameter can be set to `male` to return only
/// male names or `female` to return only female names or `any`
/// to return any male or any female name.
/// Default is `any`.
///
/// Throws [ArgumentError] if gender is set to anything other
/// than _'male'_ or _'female'_ or _'any'_.
///
/// For list of names, check [names](https://github.com/PinkFrojd/mock_data/blob/master/assets/names.md).
///
/// Example usage:
/// ```dart
///   mockName()         // returns male or female name.
///   mockName('male')   // returns male name.
///   mockName('female') // returns female name.
/// ```
String mockName([String gender = 'any']) {
  switch (gender) {
    case 'male':
      return maleNames.elementAt(random.nextInt(maleNames.length));
    case 'female':
      return femaleNames.elementAt(random.nextInt(femaleNames.length));
    case 'any':
      var allNames = maleNames.union(femaleNames).toList();
      allNames.shuffle(random);
      return allNames
          .elementAt(random.nextInt(maleNames.length + femaleNames.length));
    default:
      throw ArgumentError('Invalid gender value');
  }
}
