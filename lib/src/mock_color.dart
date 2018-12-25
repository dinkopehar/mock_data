import 'constants.dart' show random;

/// Generate random color from a given model.
///
/// [model] expects a value of `'rgb'`, `'hex'`, `'hsv'`,
/// `'hsb'`, `'hsl'` or `'cmyk'` where each value
/// represents respective color space.
/// Hex format starts with leading hash tag sign(#).
///
/// Defaults to 'rgb'.
///
/// Example usage:
/// ```dart
///   mockColor('rgb') // returns 'rgb(r, g, b)' where r, g and b are random
///                    // integers between 0 and 255, inclusive.
///
///   mockColor('hex') // returns '#XXXXXX' where each pair represents
///                    // r, g, b expressed in hex format.
///
///   mockColor('hsv') // hsv and hsb are same.
///                    // returns 'hsv(h,s,v)' where h represents hue ranges
///                    // 0-360 degrees, s for saturation ranges from 0-100% and
///                    // v/b for value/brightness ranges from 0-100%
///
///   mockColor('hsl') // returns 'hsl(h,s,l)' where h and s are same as above and
///                    // l for lightness or luminosity ranges from 0-100%
///
///   mockColor('cmyk')// returns 'cmyk(c,m,y,k)'
///                    // c for Cyan, c for Magenta, y for Yellow and k for blacK
///                    // each ranges from 0 to 1.
///   mockColor() == mockColor('rgb')
/// ```
String mockColor([String returnModel = 'rgb']) {
  switch (returnModel) {
    case 'hex':
      return '#${List<String>.generate(3, (_) => random.nextInt(255 + 1).toRadixString(16).padLeft(2, '0')).toList().join().toUpperCase()}';
    case 'rgb':
      return 'rgb(${List<int>.generate(3, (_) => random.nextInt(255 + 1)).join(', ')})';
    case 'hsv':
    case 'hsb':
    case 'hsl':
      var hs = List<String>()..add(random.nextInt(360 + 1).toString());
      hs.add('${random.nextInt(100 + 1).toString()}%');
      hs.add('${random.nextInt(100 + 1).toString()}%');
      return '${returnModel}(${hs.join(', ')})';
    case 'cmyk':
      return 'cmyk(${List<String>.generate(4, (_) => '${random.nextInt(100 + 1).toString()}%').join(', ')})';
    default:
      throw ArgumentError('Invalid color model');
      break;
  }
}
