import 'package:test_tdd/bowling_game_cata/models/frame.dart';

class Game {
  List<Frame> frames = List.generate(10, (index) => Frame());
  int round = 0;
  int score = 0;

  void roll(int knockedNumber) {
    // Cada tirada

    fillFirstThrowScore(knockedNumber);
    fillSecondThrowScore(knockedNumber);
    fillThirdThrowScore(knockedNumber);
    nextRound(knockedNumber);
  }

  void nextRound(int knockedNumber) {
    if (round <= 0) {
      round++;
      return;
    }

    frames[round - 1].addStrikeBonus(frames[round].getScore());
    frames[round - 1].addSpareBonus(frames[round].throws[Throw.first]!);
    round++;
  }

  void fillThirdThrowScore(int knockedNumber) {
    if (round == 9 && (frames[round].isStrike() || frames[round].isSpare())) {
      frames[round].thirdThow(knockedNumber);
    }
  }

  void fillSecondThrowScore(int knockedNumber) {
    if (frames[round].isSecondThrow()) {
      frames[round].secondThrow(knockedNumber);
    }
  }

  void fillFirstThrowScore(int knockedNumber) {
    if (frames[round].isFirstThrow()) {
      frames[round].firstThrow(knockedNumber);
    }
  }

  int getScore() {
    // for (var element in frames) {}

    return 1; // TODO
  }
}
