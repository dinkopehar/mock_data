import 'consts.dart';

/// Generate random IPv4 address.
///
/// [format] argument accepts integers in range from 0 to 255, separated
/// by dots, which represent a group or octet in IP.
/// Group can also be represented with `*`, which generates any
/// number for particular group.
///
/// Returns IP as [String].
///
/// Example usage:
/// ```dart
///   mockIPv4('192.168.*.*') // returns '192.168.ANY_NUMBER.ANY_NUMBER'
///   mockIPv4('*.168.*.*') // returns 'ANY_NUMBER.168.ANY_NUMBER.ANY_NUMBER'
///   mockIPv4() == mockIPv4('*.*.*.*')
/// ```
String mockIPv4([String format = '*.*.*.*']) =>
  format.split('.').map((s) =>
    s.contains('*') ? "${random.nextInt(255 + 1).toString()}." : "$s."
  ).join();

