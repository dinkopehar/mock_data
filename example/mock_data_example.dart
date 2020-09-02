import 'package:mock_data/mock_data.dart';

main() {

  // Mock string from a given length and group of characters.
  // ---------
  mockString();         // String of length 16(default).
  mockString(10);       // String of length 10.
  mockString(15, 'a#'); // String with length 15 from combination
                        // of lowercase letters and numbers.
  mockString(3, '!');   // String with length 3 from combination
                        // of lowercase and uppercase letters 
                        // and numbers.
  mockString(7, 'aA');  // String with length 7 from combination
                        // of lowercase and uppercase letters.
  // ---------

  // Mock integer in range from min to max, inclusive.
  // ---------
  mockInteger();        // Integer in between 1 to 10(default).
  mockInteger(3, 30);   // Integer in between 3 to 30.
  mockInteger(-15, 5);
  mockInteger(-25, -15);
  // ---------

  // Mock IPv4 with given format.
  // ---------
  mockIPv4();              // IPv4 with format set to '*.*.*.*'(default).
  mockIPv4('192.168.0.*'); // IPv4 with random 4th segment number.
  mockIPv4('192.168.*.*'); // IPv4 with random 3rd and 4th segment number.
  mockIPv4('192.*.*.55');
  // ---------

  // Mock IPv6 with given format.
  // ---------
  mockIPv6();                                   // IPv6 with format set to
                                                // '*:*:*:*:*:*:*:*'(default).
  mockIPv6('*:e331:93bf:*:a7c9:a63:*:*');       // Similar to IPv4 segments.
  mockIPv6('e1b3:7bae:*:3474:*:c0cc:462:c4b9'); // Similar to IPv4 segments.
  // ---------

  // Mock first name.
  // ---------
  mockName();         // Male of female first name(default).
  mockName('male');   // Random male name.
  mockName('female'); // Random female name.
  // ---------

  // Mock color from a given color model.
  // ---------
  mockColor();       // Random color (defaults to rgb).
  mockColor('hex');  // Color represented as hexadecimal.
  mockColor('rgb');  // Color represented as RGB.
  mockColor('hsv');  // ................. as HSV.
  mockColor('hsb');  // ................. as HSB.
  mockColor('hsl');  // ................. as HSL.
  mockColor('cmyk'); // ................. as CMYK.
  // ---------

  // Mock URL with different parts.
  // ---------
  mockUrl('http');                  // URL with value http://example.net
  mockUrl('https');                 // URL with value https://example.net
  mockUrl('*', true);               // Returns one of above URLs with 
                                    // 1 to 4 paths, for example https://example.net/bar/baz/
  mockUrl('*', true, true);         // Returns one of above URLs with path
                                    // and query arguments 
                                    // https://example.net/bar?b=3&username=waldo
  mockUrl('*', true, false, true);  // Fragment part https://example.net/bar/baz?b=3&username=waldo#above
  // ---------

  // Mock date from in between given moments in time.
  // ---------
  mockDate();                             // Date in between 
                                          // 1970-01-01 01:00:00.000 
                                          // and now (default).
  mockDate(DateTime(1995, 7, 26));        // Date in between 1995-7-26
                                          // and now.
  mockDate(DateTime(1969, 6, 15, 11, 15), 
           DateTime(2002));
  mockDate(DateTime.parse("1969-07-20 20:18:04"), 
           DateTime(1989, DateTime.november, 9));
  // ---------

  // Mock UUID; can be null, UUIDv4 and Timestamp-first UUID.
  // ---------
  mockUUID();                  // UUIDv4 (default)
  mockUUID('timestamp-first'); // Non standard version 4 UUID.
                               // First 8 characters represent a time and rest
                               // are random (useful for sorting).
  mockUUID('null');            // 00000000-0000-0000-0000-000000000000
  // ---------

  // Mock location.
  // ---------
  mockLocation();                  // Generate random location on the Earth
  mockLocation(53.5587, 108.1650, 1000); // Generate random location in radius 1000 metres from the point.
  // ---------

  // Generate range of mocks of particular function(more at [mockRange]).
  // Use [mockRange] to generate list of random values of specified function.
  // Also supports passing parameters to specified function.
  // ---------
  mockRange(mockString, 3); // Generate list of length 3 with strings
                            // of length 16 of random characters(call
                            // mockString 3 times).
  mockRange(mockInteger, 5, min: 3, max: 15); // Generate list of length 5
                                              // with integers ranging from
                                              // 3 to 15, inclusive.
  mockRange(mockIPv4, 7, format: '*.*.0.0');
  mockRange(mockIPv6, 7, format: '*:*:*:e37b:abcd:*:*:*');
  mockRange(mockName, 5, gender: 'male');
  mockRange(mockColor, 13, returnModel: 'hex');
  mockRange(mockUrl, 5, scheme: 'https', withPath: true, withFragment: true);
  mockRange(mockDate, 5, firstMoment: DateTime(2010, DateTime.november, 2));
  mockRange(mockUUID, 4, uuidType: 'ver4');
  mockRange(mockLocation, 10);
  // ---------
}
