import 'package:flutter_test/flutter_test.dart';
import 'dart:math';
// Configure your own Wardrobe

/*
Configure your own Wardrobe
Imagine you have just moved into your new apartment, and then you notice that you still need a new wardrobe for your dressing room. Regrettably, you won’t find a wardrobe that fits exactly to the size of your wall. But fortunately, the Swedish furniture dealer of your choice offers you the opportunity to build your own, customized wardrobe by combining individual wardrobe elements.

The wardrobe elements are available in the following sizes: 50cm, 75cm, 100cm, and 120cm. The wall on which the wardrobe elements are placed has a total length of 250cm. With which combinations of wardrobe elements can you make the most of the space?

Write a function that returns all combinations of wardrobe elements that exactly fill the wall.

Additional Task
Here is the price list for the available wardrobe elements:

50cm => 59 USD
75cm => 62 USD
100cm => 90 USD
120cm => 111 USD
Write a second function that checks which of the resulting combinations is the cheapest one.
*/

void main() {
  test('findWardrobeCombinations returns valid combinations', () {
    int wallLength = 250;
    List<int> wardrobeSizes = [50, 75, 100, 120];

    List<List<int>> combinations = Wardrobe.findWardrobeCombinations(wallLength, wardrobeSizes);

    // Check that all combinations have a total length of 250
    for (List<int> c in combinations) {
      expect(c.reduce((a, b) => a + b), equals(wallLength));
    }

    // Check that all combinations consist of only valid wardrobe element sizes
    for (List<int> c in combinations) {
      for (int size in c) {
        expect(wardrobeSizes.contains(size), isTrue);
      }
    }
  });
}

class Wardrobe {
  static List<List<int>> findWardrobeCombinations(int wallLength, List<int> wardrobeSizes) {
    // Determine the minimum wardrobe element size
    int minSize = wardrobeSizes.reduce(min);

    // Generate all possible combinations of wardrobe elements
    List<List<int>> combinations = [];
    int numElements = wallLength ~/ minSize;
    for (List<int> c in _combinations(wardrobeSizes, numElements)) {
      if (c.reduce((a, b) => a + b) == wallLength) {
        combinations.add(c);
      }
    }

    return combinations;
  }

  static List<List<int>> _combinations(List<int> list, int length) {
    if (length == 0) {
      return [[]];
    }

    List<List<int>> combinations = [];
    for (int i = 0; i < list.length; i++) {
      List<int> sublist = list.sublist(i + 1);
      for (List<int> c in _combinations(sublist, length - 1)) {
        combinations.add([list[i], ...c]);
      }
    }

    return combinations;
  }
 // TODO: Implement findCheapestCombination
  // static List<int> findCheapestCombination(List<List<int>> combinations) {
  //   int cheapestCost = -1;
  //   List<int> cheapestCombination;

  //   for (List<int> c in combinations) {
  //     int cost = 0;
  //     for (int size in c) {
  //       if (size == 50) {
  //         cost += 59;
  //       } else if (size == 75) {
  //         cost += 62;
  //       } else if (size == 100) {
  //         cost += 90;
  //       } else if (size == 120) {
  //         cost += 111;
  //       }
  //     }

  //     if (cheapestCost == -1 || cost < cheapestCost) {
  //       cheapestCost = cost;
  //       cheapestCombination = c;
  //     }
  //   }

  //   return cheapestCombination;
  // }
}
