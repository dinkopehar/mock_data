import 'constants.dart' as cn hide maleNames, femaleNames;

/// Generate random URL from a given parameters.
///
/// [scheme] represents scheme and a first build part in URL.
/// Can be set to any string value_(http, https, ftp etc.)_.
/// Default set to _'*'_ which represent random selection
/// of `http` or `https`.
///
/// [withPath] represents a path component, consisting
/// of a sequence of path segments separated by a slash _(/)_.
/// Default set to `false`.
///
/// [withQuery] represents an optional query component
/// preceded by a question mark _(?)_, containing a query string.
/// Default set to `false`.
///
/// [withFragment] represents fragment component preceded
/// by a hash _(#)_. Usually called permalink.
/// Default set to `false`.
///
/// For complete list of url build parts, check [urlBuildParts](https://github.com/PinkFrojd/mock_data/blob/master/assets/urlBuildParts.md).
///
/// Example usage:
/// ```dart
///   // returns URL starting with 'https' scheme
///   // followed by '://example.com' or '://example.net'
///   // followed by 1 to 4 random generated paths.
///   // Example: 'https://example.net/bar/qux'
///   mockUrl('https', true)
///
///   // returns URL starting with 'http'
///   // followed by '://example.com' or '://example.net'
///   // followed by 1 to 4 random attribute-value pairs in query
///   // string.
///   // Example: 'http://example.com?username=waldo&q=xyzzy'
///   mockUrl(scheme: 'http', false, true)
/// ```
String mockUrl(
    [String scheme = '*',
    bool withPath = false,
    withQuery = false,
    withFragment = false]) {
  var url = StringBuffer();

  switch (scheme) {
    case '*':
      url.write(cn.random.nextInt(2) == 1 ? 'http://' : 'https://');
      break;
    default: // Any scheme
      url.write('$scheme://');
      break;
  }

  url.write(cn.random.nextInt(2) == 1 ? 'example.com' : 'example.net');

  if (withPath) {
    url.write('/');

    // 1 to 4 paths can be generated.
    var numberOfPaths = cn.random.nextInt(cn.path.length) + 1;
    var paths = Set<String>();

    while (paths.length < numberOfPaths) {
      paths.add(cn.path.elementAt(cn.random.nextInt(cn.path.length)));
    }

    url.write(paths.join('/'));
  }

  if (withQuery) {
    url.write('?');

    // 1 to 4 queries can be generated.
    var numberOfQueries = cn.random.nextInt(cn.query.length) + 1;
    var queries = Set<String>();

    while (queries.length < numberOfQueries) {
      queries.add(cn.query.elementAt(cn.random.nextInt(cn.query.length)));
    }

    url.write(queries.join('&'));
  }

  if (withFragment) {
    url.write('#');
    url.write(cn.fragment.elementAt(cn.random.nextInt(cn.fragment.length)));
  }

  return url.toString();
}
