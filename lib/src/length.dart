import 'dart:math';

/// Returns the length of the perimeter of the specified [polygon].
///
/// ```dart
/// polygonLength([[1, 1], [1.5, 0], [2, 1]]) // 3.23606797749979
/// ```
num polygonLength(List<List<num>> polygon) {
  var i = -1, n = polygon.length;
  List<num> b = polygon[n - 1];
  num xa, ya, xb = b[0], yb = b[1], perimeter = 0;

  while (++i < n) {
    xa = xb;
    ya = yb;
    b = polygon[i];
    xb = b[0];
    yb = b[1];
    xa -= xb;
    ya -= yb;
    perimeter += sqrt(pow(xa, 2) + pow(ya, 2));
  }

  return perimeter;
}
