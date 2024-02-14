import 'package:d4_polygon/d4_polygon.dart';
import 'package:test/test.dart';

void main() {
  test(
      "polygonContains(polygon, point) returns the expected value for closed counterclockwise polygons",
      () {
    expect(
        polygonContains([
          [0, 0],
          [0, 1],
          [1, 1],
          [1, 0],
          [0, 0]
        ], [
          0.5,
          0.5
        ]),
        true);
    expect(
        polygonContains([
          [0, 0],
          [0, 1],
          [1, 1],
          [1, 0],
          [0, 0]
        ], [
          1.5,
          0.5
        ]),
        false);
    expect(
        polygonContains([
          [0, 0],
          [0, 1],
          [1, 1],
          [1, 0],
          [0, 0]
        ], [
          -0.5,
          0.5
        ]),
        false);
    expect(
        polygonContains([
          [0, 0],
          [0, 1],
          [1, 1],
          [1, 0],
          [0, 0]
        ], [
          0.5,
          1.5
        ]),
        false);
    expect(
        polygonContains([
          [0, 0],
          [0, 1],
          [1, 1],
          [1, 0],
          [0, 0]
        ], [
          0.5,
          -0.5
        ]),
        false);
  });

  test(
      "polygonContains(polygon, point) returns the expected value for closed clockwise polygons",
      () {
    expect(
        polygonContains([
          [0, 0],
          [1, 0],
          [1, 1],
          [0, 1],
          [0, 0]
        ], [
          0.5,
          0.5
        ]),
        true);
    expect(
        polygonContains([
          [1, 1],
          [3, 2],
          [2, 3],
          [1, 1]
        ], [
          1.5,
          1.5
        ]),
        true);
  });

  test(
      "polygonContains(polygon, point) returns the expected value for open counterclockwise polygons",
      () {
    expect(
        polygonContains([
          [0, 0],
          [0, 1],
          [1, 1],
          [1, 0]
        ], [
          0.5,
          0.5
        ]),
        true);
  });

  test(
      "polygonContains(polygon, point) returns the expected value for open clockwise polygons",
      () {
    expect(
        polygonContains([
          [0, 0],
          [1, 0],
          [1, 1],
          [0, 1]
        ], [
          0.5,
          0.5
        ]),
        true);
    expect(
        polygonContains([
          [1, 1],
          [3, 2],
          [2, 3]
        ], [
          1.5,
          1.5
        ]),
        true);
  });
}
