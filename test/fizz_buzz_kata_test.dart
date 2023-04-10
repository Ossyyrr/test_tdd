import 'package:flutter_test/flutter_test.dart';

//Fizz Buzz Kata

// Write a program that prints one line for each number from 1 to 100
// Usually just print the number itself.
// For multiples of three print Fizz instead of the number
// For the multiples of five print Buzz instead of the number
// For numbers which are multiples of both three and five print FizzBuzz instead of the number

void main() {
  testWidgets('Write a program that prints one line for each number from 1 to 100', (WidgetTester tester) async {
    FizzBuzz fizzBuzz = FizzBuzz();
    for (int i = 1; i <= 100; i++) {
      if (i % 3 != 0 && i % 5 != 0) {
        expect(fizzBuzz.execute(i), '$i');
      }
    }
  });

  testWidgets('For multiples of three print Fizz instead of the number', (WidgetTester tester) async {
    FizzBuzz fizzBuzz = FizzBuzz();
    for (int i = 1; i <= 100; i++) {
      if (i % 3 == 0 && i % 5 != 0) {
        expect(fizzBuzz.execute(i), 'Fizz');
      }
    }
  });

  testWidgets('For the multiples of five print Buzz instead of the number', (WidgetTester tester) async {
    FizzBuzz fizzBuzz = FizzBuzz();
    for (int i = 1; i <= 100; i++) {
      if (i % 5 == 0 && i % 3 != 0) {
        expect(fizzBuzz.execute(i), 'Buzz');
      }
    }
  });

  testWidgets('For numbers which are multiples of both three and five print FizzBuzz instead of the number',
      (WidgetTester tester) async {
    FizzBuzz fizzBuzz = FizzBuzz();
    for (int i = 1; i <= 100; i++) {
      if (i % 5 == 0 && i % 3 == 0) {
        expect(fizzBuzz.execute(i), 'FizzBuzz');
      }
    }
  });
}

class FizzBuzz {
  String execute(int number) {
    if (number % 3 == 0 && number % 5 == 0) {
      return 'FizzBuzz';
    }
    if (number % 3 == 0) {
      return 'Fizz';
    }
    if (number % 5 == 0) {
      return 'Buzz';
    }
    return number.toString();
  }
}
