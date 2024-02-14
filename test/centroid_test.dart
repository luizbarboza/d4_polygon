import 'package:d4_polygon/d4_polygon.dart';
import 'package:test/test.dart';

void main() {
  test(
      "polygonCentroid(points) returns the expected value for closed counterclockwise polygons",
      () {
    expect(
        polygonCentroid([
          [0, 0],
          [0, 1],
          [1, 1],
          [1, 0],
          [0, 0]
        ]),
        [0.5, 0.5]);
  });

  test(
      "polygonCentroid(points) returns the expected value for closed clockwise polygons",
      () {
    expect(
        polygonCentroid([
          [0, 0],
          [1, 0],
          [1, 1],
          [0, 1],
          [0, 0]
        ]),
        [0.5, 0.5]);
    expect(
        polygonCentroid([
          [1, 1],
          [3, 2],
          [2, 3],
          [1, 1]
        ]),
        [2, 2]);
  });

  test(
      "polygonCentroid(points) returns the expected value for open counterclockwise polygons",
      () {
    expect(
        polygonCentroid([
          [0, 0],
          [0, 1],
          [1, 1],
          [1, 0]
        ]),
        [0.5, 0.5]);
  });

  test(
      "polygonCentroid(points) returns the expected value for open counterclockwise polygons",
      () {
    expect(
        polygonCentroid([
          [0, 0],
          [1, 0],
          [1, 1],
          [0, 1]
        ]),
        [0.5, 0.5]);
    expect(
        polygonCentroid([
          [1, 1],
          [3, 2],
          [2, 3]
        ]),
        [2, 2]);
  });

  test(
      "polygonCentroid(polygon) returns the expected value for a very large polygon",
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
    for (num value = stop - step; value >= 0; value -= step) {
      points.add([value, 0]);
    }
    expect(polygonCentroid(points), [49999999.75000187, 49999999.75001216]);
  });
}
