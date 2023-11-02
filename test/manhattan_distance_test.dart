import 'package:flutter_test/flutter_test.dart';

class Point {
  final int x;
  final int y;

  const Point(this.x, this.y);
}

int manhattanDistance(Point point1, Point point2) => (point2.x - point1.x).abs() + (point2.y - point1.y).abs();

void main() {
  test('Distancia de Manhattan', () async {
    const point1 = Point(3, 4);
    const point2 = Point(7, 2);
    const point3 = Point(2, 2);

    final distance1 = manhattanDistance(point1, point2);
    final distance2 = manhattanDistance(point1, point3);
    final distance3 = manhattanDistance(point2, point3);

    expect(distance1, 6);
    expect(distance2, 3);
    expect(distance3, 5);
  });

  test('Casos límite Distancia de Manhattan', () async {
    const point1 = Point(0, 0);
    const point2 = Point(-7, 2);
    const point3 = Point(-2, -2);

    final distance1 = manhattanDistance(point1, point2);
    final distance2 = manhattanDistance(point1, point3);
    final distance3 = manhattanDistance(point2, point3);
    final distance4 = manhattanDistance(point3, point3);

    expect(distance1, 9);
    expect(distance2, 4);
    expect(distance3, 9);
    expect(distance4, 0);
  });
}
