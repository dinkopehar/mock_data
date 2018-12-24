import 'package:mock_data/mock_data.dart';

main() {

  // Mock string from a given length and group of characters.
  mockString(); // default length of 16 and include of '!'.
  mockString(10);
  mockString(15, 'a#');
  mockString(3, '!');
  mockString(7, 'aA');

  // Mock integer in range from min to max.
  mockInteger(); // default min set to 1 and max to 10.
  mockInteger(3, 30);
  mockInteger(-15, 5);
  mockInteger(-25, -15);

  // Mock IPv4 with given format.
  mockIPv4(); // default format set to '*.*.*.*'.
  mockIPv4('192.168.0.*');
  mockIPv4('192.168.*.*');
  mockIPv4('192.*.*.55');

  // Mock IPv6 with given format.
  mockIPv6(); // default format set to '*:*:*:*:*:*:*:*'.
  mockIPv6('*:e331:93bf:*:a7c9:a63:*:*');
  mockIPv6('e1b3:7bae:*:3474:*:c0cc:462:c4b9');

  // Mock first name.
  mockName(); // default set to 'any'.
  mockName('any'); // default set to 'any'.
  mockName('male');
  mockName('female');

  // Mock color from a given color model.
  mockColor(); // default model is 'rgb'.
  print(mockColor('hex'));
  print(mockColor('rgb'));
  print(mockColor('hsv'));
  print(mockColor('hsb'));
  print(mockColor('hsl'));
  print(mockColor('cmyk'));

  // Mock url with given properties.
  mockUrl(); // default scheme set to '*' and all other parameters are false.
  mockUrl('http');
  mockUrl('https');
  mockUrl('*', true);
  mockUrl('*', true, true);
  mockUrl('*', true, false, true);

  // Mock date from in between given moments in time.
  mockDate(); // default is in between 1970-01-01 01:00:00.000 and now.
  mockDate(DateTime(1995, 7, 26));
  mockDate(DateTime(1969, 6, 15, 11, 15), DateTime(2002));
  mockDate(DateTime.parse("1969-07-20 20:18:04"), DateTime(1989, DateTime.november, 9));

  // Generate range of mocks of particular function(more at [mockRange]).
  mockRange(mockString, 3);
  mockRange(mockInteger, 5, min: 3, max: 15);
  mockRange(mockIPv4, 7, format: '*.*.0.0');
  mockRange(mockIPv6, 7, format: '*:*:*:e37b:abcd:*:*:*');
  mockRange(mockName, 5, gender: 'male');
  mockRange(mockColor, 13, returnModel: 'hex');
  mockRange(mockUrl, 5, scheme: 'https', withPath: true, withFragment: true);
  mockRange(mockDate, 5, firstMoment: DateTime(2010, DateTime.november, 2));

}
