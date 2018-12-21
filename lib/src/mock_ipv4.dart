import 'constants.dart' show random;

/// Generate random IPv4 address.
///
/// [format] argument accepts integers in range from 0 to 255, separated
/// by dots(`.`), which represent a group or octet in IP.
/// Group can also be represented with `*`, which generates any
/// number for particular group.
///
/// Returns IP as [String].
///
/// Example usage:
/// ```dart
///   mockIPv4('192.168.*.*') // returns '192.168.ANY_NUMBER.ANY_NUMBER'
///   mockIPv4('*.168.*.*')   // returns 'ANY_NUMBER.168.ANY_NUMBER.ANY_NUMBER'
///   mockIPv4() == mockIPv4('*.*.*.*')
/// ```
String mockIPv4([String format = '*.*.*.*']) {
  var ip_list = format.split('.');

  ip_list.length != 4 ? throw ArgumentError('Invalid IPv4 format - Must contain four entries') : null;

  ip_list.forEach((s){
    if(s != '*') {
      var myint = int.tryParse(s) ?? -1;
      if(myint > 255 || myint < 0) throw ArgumentError('Integers must be in range of 0 and 255');
    }
  });

  var ip = ip_list.map((s) =>
  s.contains('*') ? "${random.nextInt(255 + 1).toString()}." : "$s."
  ).join();

  return ip.substring(0, ip.length - 1); // remove last dot character.
}



/// Generate random IPv6 address.
///
/// [format] argument accepts base 16 decimals in range from 0 to 65536(Here this is converted to int range),
/// separated by colons(`:`), which represent a group or octet in IP.
/// Group can also be represented with `*`, which generates any
/// hexa decimal number of 16 bits for a particular group.
///
/// Returns IP as [String].
///
/// Example usage:
/// ```dart
///   mockIPv6(*:e331:93bf:*:a7c9:a63:*:*) // returns similar to IPv4
///   mockIPv6(e1b3:7bae:*:3474:*:c0cc:462:c4b9)   // returns similar to IPv4
///   mockIPv6() == mockIPv6('*:*:*:*:*:*:*:*')
/// ```

String mockIPv6([String format = '*:*:*:*:*:*:*:*']) {
  var ip_list = format.split(':');

  ip_list.length != 8 ? throw ArgumentError('Invalid IPv6 format - Must contain 8 entries') : null;

  ip_list.forEach((s){
    if(s != '*') {
      var myint = int.tryParse(s, radix: 16) ?? -1;
      if(myint > 65535 || myint < 0) throw ArgumentError('Hexa decimal must be in range of 0 and 65535');
    }
  });

  var ip = ip_list.map((s) =>
  s.contains('*') ? "${random.nextInt(65535 + 1).toRadixString(16)}:" : "$s:"
  ).join();

  return ip.substring(0, ip.length - 1);
}


