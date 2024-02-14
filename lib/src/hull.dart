import 'cross.dart';

int _lexicographicOrder(List<num> a, List<num> b) {
  final compX = a[0].compareTo(b[0]);
  return compX != 0 ? compX : a[1].compareTo(b[1]);
}

// Computes the upper convex hull per the monotone chain algorithm.
// Assumes points.length >= 3, is sorted by x, unique in y.
// Returns an array of indices into points in left-to-right order.
List<int> _computeUpperHullIndexes(List<List<num>> points) {
  final n = points.length, indexes = [0, 1];
  int size = 2, i;

  for (i = 2; i < n; ++i) {
    while (size > 1 &&
        polygonCross(points[indexes[size - 2]], points[indexes[size - 1]],
                points[i]) <=
            0) {
      --size;
    }
    if (size >= indexes.length) {
      indexes.add(i);
    } else {
      indexes[size] = i;
    }
    size++;
  }

  return indexes.sublist(0, size); // remove popped points
}

/// Returns the [convex hull](https://en.wikipedia.org/wiki/Convex_hull) of the
/// specified [points] using
/// [Andrew’s monotone chain algorithm](http://en.wikibooks.org/wiki/Algorithm_Implementation/Geometry/Convex_hull/Monotone_chain).
///
/// <div id="obs">
///     <div id="in"></div>
///     <div id="out"></div>
/// </div>
///
/// <script type="module">
///
///     import { Runtime, Inspector } from "https://cdn.jsdelivr.net/npm/@observablehq/runtime@5/dist/runtime.js";
///     import * as d3 from "https://cdn.jsdelivr.net/npm/d3@7/+esm";
///     import * as Plot from "https://cdn.jsdelivr.net/npm/@observablehq/plot@0.6/+esm";
///
///     const obs = d3.select("#obs");
///
///     const runtime = new Runtime();
///     const module = runtime.module();
///     const inspector = new Inspector(obs.select("#out").node());
///
///     const random = d3.randomNormal.source(d3.randomLcg(42))();
///
///     module.define("points", Array.from({length: 1000}, () => [random(), random()]));
///     module.variable(inspector).define("out", ["points"], definition);
///
///     function definition(points) {
///         return Plot.plot({
///             axis: null,
///             aspectRatio: 1,
///             marks: [
///                 Plot.dot(points, {r: 2, fill: "currentColor"}),
///                 Plot.hull(points)
///             ]
///         });
///     }
/// </script>
///
/// ```dart
/// polygonHull(points) // [[3.0872864263338777, -1.300100095019402], [1.6559368816733773, -2.5092525689499605], …]
/// ```
///
/// The returned hull is represented as an list containing a subset of the input
/// [points] arranged in counterclockwise order. Returns null if [points] has
/// fewer than three elements.
List<List<num>>? polygonHull(List<List<num>> points) {
  var n = points.length;
  if ((n = points.length) < 3) return null;

  int i;
  var sortedPoints = List.filled(n, <num>[]),
      flippedPoints = List.filled(n, <num>[]);

  for (i = 0; i < n; ++i) {
    sortedPoints[i] = [points[i][0], points[i][1], i];
  }
  sortedPoints.sort(_lexicographicOrder);
  for (i = 0; i < n; ++i) {
    flippedPoints[i] = [sortedPoints[i][0], -sortedPoints[i][1]];
  }

  var upperIndexes = _computeUpperHullIndexes(sortedPoints),
      lowerIndexes = _computeUpperHullIndexes(flippedPoints);

  // Construct the hull polygon, removing possible duplicate endpoints.
  var skipLeft = lowerIndexes[0] == upperIndexes[0] ? 1 : 0,
      skipRight = lowerIndexes[lowerIndexes.length - 1] ==
              upperIndexes[upperIndexes.length - 1]
          ? 1
          : 0,
      hull = <List<num>>[];

  // Add upper hull in right-to-l order.
  // Then add lower hull in left-to-right order.
  for (i = upperIndexes.length - 1; i >= 0; --i) {
    hull.add(points[sortedPoints[upperIndexes[i]][2] as int]);
  }
  for (i = skipLeft; i < lowerIndexes.length - skipRight; ++i) {
    hull.add(points[sortedPoints[lowerIndexes[i]][2] as int]);
  }

  return hull;
}

void main() {
  var i = 1;
  print((i++));
}
