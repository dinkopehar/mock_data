import 'constants.dart' show random;

/// Generate random IPv4 address.
///
/// [format] argument accepts integers in range from 0 to 255, separated
/// by dots(`.`), which represent a group or octet in IPv4.
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
  var ip = format.split('.');

  if(ip.length != 4)
    throw ArgumentError('Invalid IPv4 format - Must contain 4 groups');

  var _ip = ip.map((s){
    if(s == '*'){
      return '${random.nextInt(255 + 1).toString()}.';
    }

    if(int.tryParse(s) >= 0 && int.tryParse(s) <= 255){
      return '$s.';
    }else{
      throw ArgumentError('Integers must be in range of 0 and 255');
    }
  }).toList().join();

  return _ip.substring(0, _ip.length - 1);
}

/// Generate random IPv6 address.
///
/// [format] argument accepts integers in range from 0 to 65536,
/// separated by colons(`:`), which represent a group or hextet in IPv6.
/// Group can also be represented with `*`, which generates any
/// hexadecimal number of 16 bits for a particular group.
///
/// Returns IP as [String].
///
/// Example usage:
/// ```dart
///   mockIPv6('*:e331:93bf:*:a7c9:a63:*:*')
///   mockIPv6('e1b3:7bae:*:3474:*:c0cc:462:c4b9')
///   mockIPv6() == mockIPv6('*:*:*:*:*:*:*:*')
/// ```

String mockIPv6([String format = '*:*:*:*:*:*:*:*']) {

  var ip = format.split(':');

  if(ip.length != 8)
    throw ArgumentError('Invalid IPv6 format - Must contain 8 groups');

  var _ip = ip.map((s){
    if(s == '*'){
      return '${random.nextInt(65535 + 1).toRadixString(16).padLeft(4, '0')}:';
    }

    if(int.tryParse(s, radix:16) >= 0 && int.tryParse(s, radix:16) <= 65536){
      return '${s.padLeft(4, '0')}:';
    }else{
      throw ArgumentError('Integers must be in range of 0 and 65536');
    }
  }).toList().join();

  return _ip.substring(0, _ip.length - 1);
}


