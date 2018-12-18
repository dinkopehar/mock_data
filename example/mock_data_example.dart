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

  // Mock first name.
  mockName(); // default set to ''.
  mockName('male');
  mockName('female');

  // Mock color from a given color model.
  mockColor(); // default model is 'rgb'.
  mockColor('hex');
  mockColor('rgb');

  // Generate range of mocks of particular function(more at [mockRange]).
  mockRange(mockString, 3);
  mockRange(mockInteger, 5, min: 3, max: 15);
  mockRange(mockIPv4, 7, format: '*.*.0.0');
  mockRange(mockName, 5, gender: 'male');


}
