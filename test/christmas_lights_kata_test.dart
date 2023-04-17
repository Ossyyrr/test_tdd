/*
Probably a Fire Hazard
Because your neighbors keep defeating you in the holiday house decorating contest year after year, you’ve decided to deploy one million lights in a 1000x1000 grid. Furthermore, because you’ve been especially nice this year, Santa has mailed you instructions on how to display the ideal lighting configuration.Lights in your grid are numbered from 0 to 999 in each direction; the lights at each corner are at 0,0, 0,999, 999,999, and 999,0. The instructions include whether to turn on, turn off, or toggle various inclusive ranges given as coordinate pairs. Each coordinate pair represents opposite corners of a rectangle, inclusive; a coordinate pair like 0,0 through 2,2 therefore refers to 9 lights in a 3x3 square. The lights all start turned off. To defeat your neighbors this year, all you have to do is set up your lights by doing the instructions Santa sent you in order.

Examples
turn on 0,0 through 999,999 would turn on (or leave on) every light.
toggle 0,0 through 999,0 would toggle the first instruction of 1000 lights, turning off the ones that were on, and turning on the ones that were off.
turn off 499,499 through 500,500 would turn off (or leave off) the middle four lights.
Instructions
turn on 887,9 through 959,629
turn on 454,398 through 844,448
turn off 539,243 through 559,965
turn off 370,819 through 676,868
turn off 145,40 through 370,997
turn off 301,3 through 808,453
turn on 351,678 through 951,908
toggle 720,196 through 897,994
toggle 831,394 through 904,860
After following the instructions, how many lights are lit?
*/
// https://kata-log.rocks/christmas-lights-kata

import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('turn on 0,0 through 999,999 would turn on (or leave on) every light.', () {
    ChristmasLights christmasLights = ChristmasLights();
    christmasLights.setRandomLights();
    christmasLights.instruction(Action.turnOn, [0, 0], [999, 999]);
    expect(christmasLights.lightsCount([0, 0], [999, 999]), 1000000);
  });
  test(
      'toggle 0,0 through 999,0 would toggle the first line of 1000 lights, turning off the ones that were on, and turning on the ones that were off.',
      () {
    ChristmasLights christmasLights = ChristmasLights();
    christmasLights.setRandomLights();
    final initialLightsOnCoordinates = christmasLights.lightsCount([0, 0], [999, 0]);
    christmasLights.instruction(Action.toggle, [0, 0], [999, 0]);
    expect(christmasLights.lightsCount([0, 0], [999, 0]), (1000 - initialLightsOnCoordinates));
  });

  test('turn off 499,499 through 500,500 would turn off (or leave off) the middle four lights.', () {
    ChristmasLights christmasLights = ChristmasLights();
    christmasLights.setRandomLights();
    christmasLights.instruction(Action.turnOff, [0, 0], [999, 999]);
    christmasLights.instruction(Action.turnOn, [499, 499], [500, 500]);
    expect(christmasLights.lightsCount([0, 0], [999, 999]), 4);
  });

  test('Prueba', () {
    ChristmasLights christmasLights = ChristmasLights();
    christmasLights.instruction(Action.turnOn, [0, 0], [999, 999]);
    christmasLights.instruction(Action.toggle, [0, 0], [999, 0]);
    christmasLights.instruction(Action.turnOff, [499, 499], [500, 500]);
    expect(christmasLights.lightsCount([0, 0], [999, 999]), 1000000 - 1000 - 4);
  });

  test('Count lights', () {
    ChristmasLights christmasLights = ChristmasLights();
    christmasLights.instruction(Action.turnOff, [0, 0], [999, 999]);
    christmasLights.instruction(Action.turnOn, [887, 9], [959, 629]);
    christmasLights.instruction(Action.turnOn, [454, 398], [844, 448]);
    christmasLights.instruction(Action.turnOff, [539, 243], [559, 965]);
    christmasLights.instruction(Action.turnOff, [370, 819], [676, 868]);
    christmasLights.instruction(Action.turnOff, [145, 40], [370, 997]);
    christmasLights.instruction(Action.turnOff, [301, 3], [808, 453]);
    christmasLights.instruction(Action.turnOn, [351, 678], [951, 908]);
    christmasLights.instruction(Action.toggle, [720, 196], [897, 994]);
    christmasLights.instruction(Action.toggle, [831, 394], [904, 860]);
    expect(christmasLights.lightsCount([0, 0], [999, 999]), 230022);
  });
}

enum Action { turnOn, turnOff, toggle }

class ChristmasLights {
  List<List<bool>> lights = List.generate(1000, (_) => List.filled(1000, false));

  void instruction(Action action, List<int> start, List<int> end) {
    for (var i = start[0]; i <= end[0]; i++) {
      for (var j = start[1]; j <= end[1]; j++) {
        if (action == Action.toggle) {
          lights[i][j] = !lights[i][j];
        } else if (action == Action.turnOn) {
          lights[i][j] = true;
        } else if (action == Action.turnOff) {
          lights[i][j] = false;
        }
      }
    }
  }

  int lightsCount(List<int> start, List<int> end) {
    var lightsCount = 0;
    for (var i = start[0]; i <= end[0]; i++) {
      for (var j = start[1]; j <= end[1]; j++) {
        if (lights[i][j]) {
          lightsCount++;
        }
      }
    }
    print('Luces encendidas: $lightsCount');
    return lightsCount;
  }

  void setRandomLights() {
    for (var i = 0; i < 1000; i++) {
      for (var j = 0; j < 1000; j++) {
        lights[i][j] = Random().nextBool();
      }
    }
  }
}
