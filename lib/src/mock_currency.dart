import 'constants.dart' show random;
import 'constants_currency.dart' show currencies, cryptocurrencies;

/// Generate random currency.
///
/// Returns `String` representing a currency.
///
/// [currencyType] parameter can be set to `both` to return any
/// regular or crypto currency or `crypto` to return only crypto currency. Empty
/// [currencyType] returns only `regular` currency.
/// Default is empty string.
///
/// Throws [ArgumentError] if currencyType is set to anything other
/// than _'both'_ or _'crypto'_.
///
///
/// Example usage:
/// ```dart
///   mockCurrency()         // returns regular currency.
///   mockCurrency('both')   // returns regular or crypto currency.
///   mockCurrency('crypto') // returns crypto currency.
/// ```


String mockCurrency([String currencyType = '']){

  // Passed currencyType should be 'crypto' or 'both'
  if(currencyType != '') {
    if (!(currencyType == 'both' || currencyType == 'crypto')) {
      throw ArgumentError('Invalid currency type');
    }
  }

  switch(currencyType){
    case 'crpyto':
      var cryptocurrencyKeys = Set<String>.from(cryptocurrencies.keys.toList());
      String currencyRandom = cryptocurrencyKeys.elementAt(random.nextInt(cryptocurrencyKeys.length - 1));
      return  currencyRandom + ' - ' + cryptocurrencies[currencyRandom];
    case 'both':
      var cryptocurrencyKeys = Set<String>.from(cryptocurrencies.keys.toList());
      var currencyKeys = Set<String>.from(cryptocurrencies.keys.toList());
      String currencyRandom = cryptocurrencyKeys.union(currencyKeys).elementAt(
          random.nextInt(cryptocurrencyKeys.length + currencyKeys.length));
      try{
        currencyRandom = currencyRandom + ' - ' + cryptocurrencies[currencyRandom];
      } catch(e){
        currencyRandom = currencyRandom + ' - ' + currencies[currencyRandom];
      }
      return currencyRandom;
    default:
      var currencyKeys = Set<String>.from(currencies.keys.toList());
      String currencyRandom = currencyKeys.elementAt(random.nextInt(currencyKeys.length - 1));
      return  currencyRandom + ' - ' + currencies[currencyRandom];
  }
}


//Must the write the mock currency value.
