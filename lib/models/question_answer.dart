import 'dart:math';

class QuestionAnswer {
  final int number1;
  final int number2;
  final List<double> options;

  QuestionAnswer({
    required this.number1,
    required this.number2,
    required this.options,
  });
}

void generateList() {
  data = [
    _generate(),
    _generate(),
    _generate(),
    _generate(),
    _generate(),
    _generate(),
    _generate(),
    _generate(),
    _generate(),
    _generate()
  ];
}

QuestionAnswer _generate() {
  var random = new Random();
  int num1 = random.nextInt(20)+5;
  int num2 = random.nextInt(num1)+1;
  List<double> options = [
    (num1 + num2).toDouble(),
    (num1 - num2).abs().toDouble(),
    (num1 * num2.toDouble()),
    double.parse((num1 / num2).toStringAsFixed(2))
  ];

  return QuestionAnswer(number1: num1, number2: num2, options: options);
}

List<QuestionAnswer> data =[];
