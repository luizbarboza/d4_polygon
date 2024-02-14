import 'dart:math';

import 'package:d4_polygon/d4_polygon.dart';
import 'package:test/test.dart';

void main() {
  test(
      "polygonLength(polygon) returns the expected value for closed counterclockwise polygons",
      () {
    expect(
        polygonLength([
          [0, 0],
          [0, 1],
          [1, 1],
          [1, 0],
          [0, 0]
        ]),
        4);
  });

  test(
      "polygonLength(polygon) returns the expected value for closed clockwise polygons",
      () {
    expect(
        polygonLength([
          [0, 0],
          [1, 0],
          [1, 1],
          [0, 1],
          [0, 0]
        ]),
        4);
    expect(
        polygonLength([
          [1, 1],
          [3, 2],
          [2, 3],
          [1, 1]
        ]),
        sqrt(20) + sqrt(2));
  });

  test(
      "polygonLength(polygon) returns the expected value for open counterclockwise polygons",
      () {
    expect(
        polygonLength([
          [0, 0],
          [0, 1],
          [1, 1],
          [1, 0]
        ]),
        4);
  });

  test(
      "polygonLength(polygon) returns the expected value for open clockwise polygons",
      () {
    expect(
        polygonLength([
          [0, 0],
          [1, 0],
          [1, 1],
          [0, 1]
        ]),
        4);
    expect(
        polygonLength([
          [1, 1],
          [3, 2],
          [2, 3]
        ]),
        sqrt(20) + sqrt(2));
  });
}
