import 'constants.dart' show random;

/// Generate version 4 based UUID.
///
/// [uuidType] represents choice of different form of UUIDv4 which can be:
/// - ver4
/// - timestamp-first
/// - null
///
/// Defaults to `standard` if no argument is provided.
///
/// Throws `ArgumentError` if argument supplied is different from possible
/// choices.
///
/// Example usage:
/// ```dart
///   mockUuid()                  // return UUIDv4
///   mockUuid('timestamp-first') // return special type of UUIDv4 called
///                               // timestamp-first UUID. Useful when sorting.
///
///   mockUuid('null')            // returns null uuid.
String mockUUID([String uuidType = 'ver4']) {
  switch (uuidType) {
    case 'ver4':
    case 'timestamp-first':
    case 'null':
      break;
    default:
      throw ArgumentError('Invalid uuidType ${uuidType}. Possible choices are: '
          'ver4, timestamp-first and null');
  }

  List<String> chars = List.from('0123456789abcdef'.split(''), growable: false);
  List<String> uuid =
      List.generate(36, (_) => chars.elementAt(random.nextInt(chars.length)));

  uuid[8] = '-';
  uuid[13] = '-';
  uuid[14] = '4';
  uuid[18] = '-';
  uuid[19] = '89ab'.split('').elementAt(random.nextInt(4));
  uuid[23] = '-';

  if (uuidType == 'timestamp-first') {
    uuid.setRange(0, 8,
        DateTime.now().microsecondsSinceEpoch.toRadixString(16).split(''));
  } else if (uuidType == 'null') {
    uuid = '00000000-0000-0000-0000-000000000000'.split('');
  }

  return uuid.join('');
}
