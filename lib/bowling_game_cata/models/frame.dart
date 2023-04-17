enum Throw { first, second, third }

class Frame {
  Frame();

  Map<Throw, int?> throws = {
    Throw.first: null,
    Throw.second: null,
    Throw.third: null,
  };

  int? bonus;

  bool isFirstThrow() => throws[Throw.first] == null && throws[Throw.second] != null;
  bool isSecondThrow() => throws[Throw.second] == null && throws[Throw.first] != null;
  bool isThirdThrow() => throws[Throw.third] == null && throws[Throw.second] != null && throws[Throw.first] != null;

  bool isStrike() => throws[Throw.first] == 10; // Derriba los 10 bolos en su primera tirada
  bool isSpare() => throws[Throw.first]! + throws[Throw.second]! == 10; // Derriba los 10 bolos en dos tiradas

  void firstThrow(int knockedNumber) => throws[Throw.first] = knockedNumber;
  void secondThrow(int knockedNumber) => throws[Throw.second] = knockedNumber;
  void thirdThow(int knockedNumber) => throws[Throw.third] = knockedNumber;

  int getScore() {
    int score = 0;
    throws.forEach((key, value) {
      score += value ?? 0;
    });
    return score;
  }

  int getScoreWithBonus() => getScore() + (bonus ?? 0);

  void addStrikeBonus(int nextScore) {
    if (isStrike()) {
      bonus = nextScore;
    }
  }

  void addSpareBonus(int nextScore) {
    if (isSpare()) {
      bonus = nextScore;
    }
  }
}
