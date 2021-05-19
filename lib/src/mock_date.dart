import 'constants.dart' show random;

/// Generate random DateTime object in between two moments in time.
///
/// [firstMoment] and [secondMoment] represent `DateTime` objects
/// from which `mockDate` returns random `DateTime` object in
/// between both moments in time. Time is represented in _localTime_.
///
/// Default values are `1970-01-01 01:00:00.000`
/// and current time(now), respectively.
///
/// Returns [DateTime].
///
/// Example usage:
/// ```dart
///   // returns random DateTime object in between range
///   // `1970-01-01 01:00:00.000` and now.
///   mockDate()
///
///   // returns random DateTime object in between range
///   // `2000-00-00 00:00:00.000` and `2015-00-00 00:00:00.000`.
///   mockDate(DateTime(2000), DateTime(2015))
///
///   // returns random DateTime object in between range
///   // `1969-07-20 20:18:04.000` and `1989-11-9 00:00:00.000`.
///   mockDate(DateTime.parse("1969-07-20 20:18:04"), DateTime(1989, DateTime.november, 9))
/// ```
DateTime mockDate([DateTime? firstMoment, DateTime? secondMoment]) {
  firstMoment ??= DateTime.fromMillisecondsSinceEpoch(0);
  secondMoment ??= DateTime.now();

  secondMoment.isBefore(firstMoment)
      ? throw ArgumentError('Second DateTime '
          'moment should be after first DateTime moment.')
      : null;

  Duration difference = secondMoment.difference(firstMoment);

  return firstMoment
      .add(Duration(seconds: random.nextInt(difference.inSeconds + 1)));
}
