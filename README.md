# mock_data

[![License](https://img.shields.io/github/license/PinkFrojd/mock_data.svg)](https://github.com/PinkFrojd/mock_data/blob/master/LICENSE.txt)
![Dart CI](https://github.com/dinko-pehar/mock_data/workflows/Dart%20CI/badge.svg?branch=master)

Generate random data using Dart.

List of random data to generate:
* **colors** with various color spaces
* **date** between different moments in time
* **integers** in between range of numbers
* **IPs** ~ IPv4 and IPv6
* **name**; male or female first name
* **strings** of different length and characters
* **url** with different parts; routes, GET query parameters and fragments
* **UUIDs** ~ Timestamp-first, null and standard UUIDv4

<img width="300" src="https://c512911.ssl.cf3.rackcdn.com/Moq2/mock.gif" alt="mocking Nelson Muntz" />

Inspired by: https://www.npmjs.com/package/mock-data

## Usage

A simple usage example:

```dart
import 'package:mock_data/mock_data.dart';

main() {

  mockName();           // Generate male or female first name. 
  mockName('male');     // Generate male first name. 
  mockName('female');   // Generate female first name. 

  mockInteger(7, 10);   // Generate integer in range from 7 do 10.

  mockString(10);       // Generate string of length 10.

  mockString(20, 'a#'); // Generate string of length 20 and any
                        // combination of lowercase letters
                        // and digits.
  
  mockIPv4();           // Generate IPv4 represented with 
                        // format(default is '*.*.*.*') as String. 
  
  mockIPv6();           // Generate IPv6, same usage as with IPv4.

  mockColor('hex');     // Generate color represented in hex format.
  mockColor('rgb');     // Generate color represented in RGB format.
  
}
```

These are some basic examples. Reading [examples][] you can learn about all methods, their usage and explanation. 

### Contributors
- [Dinko Pehar](https://github.com/dinko-pehar)
- [Nagasai Bodepudi](https://github.com/nagasaiBodepudi)

### License
[MIT][]

[TODO]: https://github.com/PinkFrojd/mock_data/blob/master/TODO.md
[MIT]: https://github.com/PinkFrojd/mock_data/blob/master/LICENSE.txt
[examples]: https://pub.dev/packages/mock_data#-example-tab-
