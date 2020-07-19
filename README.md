
<p align="center">
  <img width="300" src="assets/mock_data_logo.png" alt="Mock Data Logo" /><br>
  <a href="https://github.com/dinko-pehar/mock_data/actions"><img src="https://github.com/dinko-pehar/mock_data/workflows/Dart%20CI/badge.svg?branch=master" alt="Build Status"></a>
  <a href="LICENSE.txt"><img src="https://img.shields.io/github/license/PinkFrojd/mock_data.svg" alt="License"></a>
  <a href="https://pub.dev/packages/mock_data"><img src="https://img.shields.io/pub/v/mock_data" alt="Version"></a><br>
  Generate random data using <img src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/dart/dart.png" alt="Dart" width="16" height="16">
</p>

## Features

API provides generation of:

- *Integers* in any range of numbers
- *Strings* with various characters and length
- *Colors* represented with needed color space
- *Date*s between different moments in time
- *Name*s such as John or Mary
- *UUIDv4* and *Timestamp-first UUIDs*
- *URL*s with many fragments
- *IPv4* and *IPv6*

## Usage

A simple usage example:

```dart
import 'package:mock_data/mock_data.dart';

main() {

  mockName();           // Generate male or female first name. 
  mockName('male');     // Generate male first name. 
  mockName('female');   // Generate female first name. 

  mockInteger(1, 6);    // Generate integer in range from 1 do 6.

  mockString(16);       // Generate string of length 16.
  
  mockIPv4();           // Generate IPv4 represented with 
                        // format(default is '*.*.*.*') as String. 
  
  mockIPv6();           // Generate IPv6, same usage as with IPv4.

  mockColor('hex');     // Generate color represented in hex format.
  mockColor('rgb');     // Generate color represented in RGB format.
  
  mockUUID();           // Generate UUIDv4
  
}
```

These are some basic examples. There are many more methods and they all support tweeking of parameters to suit you in generating random data. By reading [examples][] you can learn more about functionality and usage of `mock_data`

### Contributors
- [Dinko Pehar](https://github.com/dinko-pehar)
- [Nagasai Bodepudi](https://github.com/nagasaiBodepudi)

### License
[MIT][]

[MIT]: https://github.com/PinkFrojd/mock_data/blob/master/LICENSE.txt
[examples]: https://pub.dev/packages/mock_data#-example-tab-
