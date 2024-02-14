import 'package:d4_polygon/d4_polygon.dart';
import 'package:test/test.dart';

void main() {
  test(
      "polygonArea(polygon) returns the expected value for closed counterclockwise polygons",
      () {
    expect(
        polygonArea([
          [0, 0],
          [0, 1],
          [1, 1],
          [1, 0],
          [0, 0]
        ]),
        1);
  });

  test(
      "polygonArea(polygon) returns the expected value for closed clockwise polygons",
      () {
    expect(
        polygonArea([
          [0, 0],
          [1, 0],
          [1, 1],
          [0, 1],
          [0, 0]
        ]),
        -1);
    expect(
        polygonArea([
          [1, 1],
          [3, 2],
          [2, 3],
          [1, 1]
        ]),
        -1.5);
  });

  test(
      "polygonArea(polygon) returns the expected value for open counterclockwise polygons",
      () {
    expect(
        polygonArea([
          [0, 0],
          [0, 1],
          [1, 1],
          [1, 0]
        ]),
        1);
  });

  test(
      "polygonArea(polygon) returns the expected value for open clockwise polygons",
      () {
    expect(
        polygonArea([
          [0, 0],
          [1, 0],
          [1, 1],
          [0, 1]
        ]),
        -1);
    expect(
        polygonArea([
          [1, 1],
          [3, 2],
          [2, 3]
        ]),
        -1.5);
  });

  test(
      "polygonArea(polygon) returns the expected value for a very large polygon",
      () {
    const stop = 1e8;
    const step = 1e4;
    final points = <List<num>>[];
    for (num value = 0; value < stop; value += step) {
      points.add([0, value]);
    }
    for (num value = 0; value < stop; value += step) {
      points.add([value, stop]);
    }
    for (num value = stop - step; value >= 0; value -= step) {
      points.add([stop, value]);
    }
    for (var value = stop - step; value >= 0; value -= step) {
      points.add([value, 0]);
    }
    expect(polygonArea(points), 1e16 - 5e7);
  });
}
