/// Returns true if and only if the specified [point] is inside the specified
/// [polygon].
///
/// ```dart
/// polygonContains([[1, 1], [1.5, 0], [2, 1]], [1.5, 0.667]) // true
/// ```
bool polygonContains(List<List<num>> polygon, List<num> point) {
  var n = polygon.length;
  List<num> p = polygon[n - 1];
  num x = point[0], y = point[1], x0 = p[0], y0 = p[1], x1, y1;
  bool inside = false;

  for (var i = 0; i < n; ++i) {
    p = polygon[i];
    x1 = p[0];
    y1 = p[1];
    if (((y1 > y) != (y0 > y)) && (x < (x0 - x1) * (y - y1) / (y0 - y1) + x1)) {
      inside = !inside;
    }
    x0 = x1;
    y0 = y1;
  }

  return inside;
}
