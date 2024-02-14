import 'package:d4_polygon/d4_polygon.dart';
import 'package:test/test.dart';

void main() {
  test(
      "polygonHull(points) returns null if points has fewer than three elements",
      () {
    expect(polygonHull([]), isNull);
    expect(
        polygonHull([
          [0, 1]
        ]),
        isNull);
    expect(
        polygonHull([
          [0, 1],
          [1, 0]
        ]),
        isNull);
  });

  test("polygonHull(points) returns the convex hull of the specified points",
      () {
    expect(
        polygonHull([
          [200, 200],
          [760, 300],
          [500, 500]
        ]),
        [
          [760, 300],
          [200, 200],
          [500, 500]
        ]);
    expect(
        polygonHull([
          [200, 200],
          [760, 300],
          [500, 500],
          [400, 400]
        ]),
        [
          [760, 300],
          [200, 200],
          [500, 500]
        ]);
  });

  test("polygonHull(points) handles points with duplicate ordinates", () {
    expect(
        polygonHull([
          [-10, -10],
          [10, 10],
          [10, -10],
          [-10, 10]
        ]),
        [
          [10, 10],
          [10, -10],
          [-10, -10],
          [-10, 10]
        ]);
  });

  test("polygonHull(points) handles overlapping upper and lower hulls", () {
    expect(
        polygonHull([
          [0, -10],
          [0, 10],
          [0, 0],
          [10, 0],
          [-10, 0]
        ]),
        [
          [10, 0],
          [0, -10],
          [-10, 0],
          [0, 10]
        ]);
  });

  // Cases below taken from http://uva.onlinejudge.org/external/6/681.html
  test("polygonHull(points) handles various non-trivial hulls", () {
    expect(
        polygonHull([
          [60, 20],
          [250, 140],
          [180, 170],
          [79, 140],
          [50, 60],
          [60, 20]
        ]),
        [
          [250, 140],
          [60, 20],
          [50, 60],
          [79, 140],
          [180, 170]
        ]);
    expect(
        polygonHull([
          [50, 60],
          [60, 20],
          [70, 45],
          [100, 70],
          [125, 90],
          [200, 113],
          [250, 140],
          [180, 170],
          [105, 140],
          [79, 140],
          [60, 85],
          [50, 60]
        ]),
        [
          [250, 140],
          [60, 20],
          [50, 60],
          [79, 140],
          [180, 170]
        ]);
    expect(
        polygonHull([
          [30, 30],
          [50, 60],
          [60, 20],
          [70, 45],
          [86, 39],
          [112, 60],
          [200, 113],
          [250, 50],
          [300, 200],
          [130, 240],
          [76, 150],
          [47, 76],
          [36, 40],
          [33, 35],
          [30, 30]
        ]),
        [
          [300, 200],
          [250, 50],
          [60, 20],
          [30, 30],
          [47, 76],
          [76, 150],
          [130, 240]
        ]);
  });
}
