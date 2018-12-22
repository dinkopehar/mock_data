import 'constants.dart' show random;

/// Generate random color from a given model.
///
/// [model] expects a value of `'rgb'`, `'hex'`, `'hsv'`, `'hsb'`, `'hsl'` or `'cmyk'`
///  where each set represents respective color space.
/// hex format with leading hash tag sign(#).
///
///
/// Defaults to 'rgb'.
///
/// Example usage:
/// ```dart
///   mockColor('rgb') // returns 'rgb(r, g, b)' where r, g and b are random
///                    // integers between 0 and 255, inclusive.
///   mockColor('hex') // returns '#XXXXXX' where each pair represents
///                    // r, g, b expressed in hex format.
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
String mockColor([String returnModel = 'rgb']){

  var rgb_color = List<int>.generate(3, (_) => random.nextInt(255 + 1));

  List<int> hsvl_color = [random.nextInt(360), random.nextInt(100), random.nextInt(100)];

  var cmyk_color = List<int>.generate(4, (_) => random.nextInt(100));
  var _cmyk_color = cmyk_color.map((k) => k/100);

  switch(returnModel){
    case 'hex':
      var _color = rgb_color.map((channel) =>
          channel.toRadixString(16).padLeft(2, '0')).toList();
      return '#${_color.join().toUpperCase()}';
    case 'rgb':
      return 'rgb(${rgb_color.join(', ')})';
    case 'hsv':
      return 'hsv(${hsvl_color[0]}, ${hsvl_color[1]}%, ${hsvl_color[2]}%)';
    case 'hsb':
      return 'hsb(${hsvl_color[0]}, ${hsvl_color[1]}%, ${hsvl_color[2]}%)';
    case 'hsl':
      return 'hsl(${hsvl_color[0]}, ${hsvl_color[1]}%, ${hsvl_color[2]}%)';
    case 'cmyk':
      return 'cmyk(${_cmyk_color.join(', ')})';
    default:
      throw ArgumentError('Invalid color model');
      break;
  }
}
