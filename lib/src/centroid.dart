/// Returns the [centroid](https://en.wikipedia.org/wiki/Centroid) of the
/// specified [polygon].
///
/// ```dart
/// polygonArea([[1, 1], [1.5, 0], [2, 1]]) // [1.5, 0.6666666666666666]
/// ```
List<num> polygonCentroid(List<List<num>> polygon) {
  var i = -1, n = polygon.length;
  List<num> a, b = polygon[n - 1];
  num x = 0, y = 0, c, k = 0;

  while (++i < n) {
    a = b;
    b = polygon[i];
    k += c = a[0] * b[1] - b[0] * a[1];
    x += (a[0] + b[0]) * c;
    y += (a[1] + b[1]) * c;
  }

  k *= 3;
  return [x / k, y / k];
}
