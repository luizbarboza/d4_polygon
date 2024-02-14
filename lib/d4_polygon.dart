/// This package provides a few basic geometric operations for two-dimensional
/// polygons.
///
/// Each polygon is represented as an list of two-element list \[​[*x0*, *y0*\],
/// \[*x1*, *y1*\], …\], and may either be closed (wherein the first and last
/// point are the same) or open (wherein they are not). Typically polygons are
/// in counterclockwise order, assuming a coordinate system where the origin is
/// in the top-left corner.
export 'src/d4_polygon.dart';
