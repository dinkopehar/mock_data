# mock_data

Generate random data(integer, string, ipv4 and more) using Dart.

<img width="300" src="https://c512911.ssl.cf3.rackcdn.com/Moq2/mock.gif" alt="mocking Nelson Muntz" />

Inspired by: https://www.npmjs.com/package/mock-data


## Usage

A simple usage example:

```dart
import 'package:mock_data/mock_data.dart';

main() {
  
  // Mock string of given length and group of characters:
  
  // Generate string of length 16(default) and any 
  // combination of letters and digits.
  mockString();
  
  // Generate string of length 10 and any combination
  // of letters and digits.
  mockString(10);
  
  // Generate string of length 15 and any combination
  // of lowercase letters and digits.
  mockString(15, 'a#');
  
  // Generate string of length 3 and any combination
  // of letters and digits.
  mockString(3, '!');
  
  // Generate string of length 7 and any combination
  // of letters.
  mockString(7, 'aA');

  // Mock integer in range of min to max, inclusive:
  
  // Generate integer in range from min(default 1)
  // to max(default 10). Works with negative numbers.
  mockInteger();
  
  // Generate integer in range from 3 to 30.
  mockInteger(3, 30);
  
  // Generate integer in range from -15 to 5.
  mockInteger(-15, 5);
  
  // Generate integer in range from -25 to -15.
  mockInteger(-25, -15);

  // Mock IPv4 with given format:
  
  // Generate IPv4 represented with
  // format(default is '*.*.*.*') as String. 
  mockIPv4();
  
  // Generate IPv4 starting with groups of
  // 192, 168 and 0, followed by any integer
  // of last group.
  mockIPv4('192.168.0.*');
  
  // Generate IPv4 starting with groups of
  // 192 and 168, followed by any integer
  // of last two groups.
  mockIPv4('192.168.*.*');
  
  // Generate IPv4 starting with groups of
  // 192, followed by any integer
  // of next two groups and end group of 55.
  mockIPv4('192.*.*.55');

  // Generate range of mocks of particular
  // function(more at documentation).
  mockRange(mockString, 3);
  mockRange(mockInteger, 5, min: 3, max: 15);
  mockRange(mockIPv4, 7, format: '*.*.0.0');

}
```

More explanation at [documentation][].

### TODO
Please see [TODO][].

### License
[MIT][].

[TODO]: https://github.com/
[MIT]: https://github.com/
[documentation]: https://github.com/
