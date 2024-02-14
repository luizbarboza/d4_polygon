/// Returns the signed area of the specified [polygon].
///
/// ```dart
/// polygonArea([[1, 1], [1.5, 0], [2, 1]]) // -0.5
/// ```
///
/// If the vertices of the polygon are in counterclockwise order (assuming a
/// coordinate system where the origin is in the top-left corner), the returned
/// area is positive; otherwise it is negative, or zero.
num polygonArea(List<List<num>> polygon) {
  var i = -1, n = polygon.length;
  List<num> a, b = polygon[n - 1];
  num area = 0;

  while (++i < n) {
    a = b;
    b = polygon[i];
    area += a[1] * b[0] - a[0] * b[1];
  }

  return area / 2;
}
