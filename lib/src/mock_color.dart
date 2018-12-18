import 'constants.dart' show random;

/// Generate random color from a given model.
///
/// [model] expects a value of `'rgb'` or `'hex'`, where
/// _'rgb'_ represents rgb model and _'hex'_ represents
/// hex format with leading hash tag sign(#).
///
/// Defaults to 'rgb'.
///
/// Example usage:
/// ```dart
///   mockColor('rgb') // returns 'rgb(r, g, b)' where r, g and b are random
///                    // integers between 0 and 255, inclusive.
///   mockColor('hex') // returns '#XXXXXX' where each pair represents
///                    // r, g, b expressed in hex format.
///   mockColor() == mockColor('rgb')
/// ```
String mockColor([String returnModel = 'rgb']){

  var color = List<int>.generate(3, (_) => random.nextInt(255 + 1));

  switch(returnModel){
    case 'hex':
      var _color = color.map((channel) =>
          channel.toRadixString(16).padLeft(2, '0')).toList();
      return '#${_color.join().toUpperCase()}';
    case 'rgb':
      return 'rgb(${color.join(', ')})';
    default:
      throw ArgumentError('Invalid color model');
      break;
  }
}
