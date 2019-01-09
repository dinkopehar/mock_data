/// Mock any random data; strings, integers, IPs and so much more.

library mock_data;

export 'src/mock_string.dart';
export 'src/mock_integer.dart';
export 'src/mock_ip.dart';
export 'src/mock_name.dart';
export 'src/mock_color.dart';
export 'src/mock_url.dart';
export 'src/mock_date.dart';
export 'src/mock_currency.dart';

/// Generic function to generate list of mocks.
///
/// [mockFunction] represents a function from _mock_data_ library.
/// It is passed as first class object (without invocation).
///
/// [numberOfMocks] represents number of invocations of [mockFunction].
///
/// `mockRange` can also accept all parameters of [mockFunctions] as
/// optional named parameters. Default values for optional parameters
/// is same as for _mock_data_ functions.
///
/// Returns [List<E>].
///
/// Example usage:
/// ```dart
///   // returns list of length 15 containing
///   // random IPs.
///   mockRange(mockIPv4, 15)
///
///   // returns list of length 5 containing
///   // random IPs with starting groups as
///   // 192.168. and last 2 groups random int
///   // in range 0 to 255, inclusive.
///   mockRange(mockIPv4, 5, format:192.168.*.*)
///
///   // returns list of length 5 containing
///   // random integers ranging from -15
///   // to 20, inclusive.
///   mockRange(mockInteger, 3, min: -15, max:20)
///
///   // returns list of length 5 containing
///   // random strings of length 16 which are
///   // consisted of any combination of digits,
///   // lowercase and uppercase characters.
///   mockRange(mockString, 5)
///
///   // returns list of length 15 containing
///   // random males and females first names.
///   mockRange(mockName, 15)
///
///   // returns list of length 7 containing
///   // random colors represented in hex format.
///   mockRange(mockColor, 7, returnModel: 'hex')
///
///   // returns list of length 4 containing
///   // random URLs with query string and permalink.
///   mockRange(mockUrl, 4, withQuery: true, withFragment: true)
///
///   // returns list of length 5 containing
///   // random DateTime objects in between 1970-01-01 01:00:00.000 and
///   // current time(now).
///   mockRange(mockDate, 5, secondMoment: DateTime(2000))
/// ```
List<E> mockRange<E>(Function mockFunction, int numberOfMocks,
    {int lengthOfMockedString = 16, String include = '!',
     int min = 1, int max = 10,
     String format = '*.*.*.*',
     String gender = '',
     String returnModel = 'rgb',
     String scheme = '*', bool withPath = false, withQuery = false, withFragment = false,
     DateTime firstMoment, DateTime secondMoment}){

  // Get name of passed function.
  var f = RegExp(r"'(.+)'").firstMatch(mockFunction.toString()).group(1);

  // Call proper function with passed arguments.
  switch(f){
    case 'mockString':
      return List<E>.generate(numberOfMocks, (_) =>
          mockFunction(lengthOfMockedString, include));
    case 'mockInteger':
      return List<E>.generate(numberOfMocks, (_) =>
          mockFunction(min, max));
    case 'mockIPv4':
      return List<E>.generate(numberOfMocks, (_) =>
          mockFunction(format));
    case 'mockName':
      return List<E>.generate(numberOfMocks, (_) =>
          mockFunction(gender));
    case 'mockColor':
      return List<E>.generate(numberOfMocks, (_) =>
          mockFunction(returnModel));
    case 'mockUrl':
      return List<E>.generate(numberOfMocks, (_) =>
          mockFunction(scheme, withPath, withQuery, withFragment));
    case 'mockDate':
      return List<E>.generate(numberOfMocks, (_) =>
          mockFunction(firstMoment, secondMoment));
    default:
      return List<E>(); // Empty List if function is not from mock_data lib.
  }
    
}
