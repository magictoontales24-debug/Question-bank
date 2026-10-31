class AdvancedQuestion {
  final int grade;
  final String topic;
  final String difficulty;
  final String text;
  final List<String> options;
  final int answerIndex;
  final String hint;
  final String explanation;

  const AdvancedQuestion({
    required this.grade,
    required this.topic,
    required this.difficulty,
    required this.text,
    required this.options,
    required this.answerIndex,
    required this.hint,
    required this.explanation,
  });

  String get correctAnswer => options[answerIndex];
}

final List<AdvancedQuestion> advancedQuestionBank = [
  const AdvancedQuestion(
    grade: 1,
    topic: 'Addition',
    difficulty: 'Easy',
    text: 'What is 25 + 14?',
    options: ['39', '38', '40', '41'],
    answerIndex: 0,
    hint: 'Add the tens and ones separately.',
    explanation: '25 + 14 = 39.',
  ),
  const AdvancedQuestion(
    grade: 2,
    topic: 'Subtraction',
    difficulty: 'Easy',
    text: 'What is 85 - 37?',
    options: ['48', '52', '58', '42'],
    answerIndex: 0,
    hint: 'Borrow from the tens column.',
    explanation: '85 - 37 = 48.',
  ),
  const AdvancedQuestion(
    grade: 3,
    topic: 'Multiplication',
    difficulty: 'Medium',
    text: 'What is 24 × 6?',
    options: ['124', '144', '134', '154'],
    answerIndex: 1,
    hint: 'Multiply 20 and 4 by 6.',
    explanation: '24 × 6 = 144.',
  ),
  const AdvancedQuestion(
    grade: 4,
    topic: 'Fractions',
    difficulty: 'Medium',
    text: 'What is 1/2 of 48?',
    options: ['12', '18', '24', '36'],
    answerIndex: 2,
    hint: 'Divide 48 by 2.',
    explanation: '48 ÷ 2 = 24.',
  ),
  const AdvancedQuestion(
    grade: 5,
    topic: 'Decimals',
    difficulty: 'Medium',
    text: 'What is 3.75 + 2.25?',
    options: ['5.50', '6.00', '6.25', '5.75'],
    answerIndex: 1,
    hint: 'Line up the decimal points.',
    explanation: '3.75 + 2.25 = 6.00.',
  ),
  const AdvancedQuestion(
    grade: 6,
    topic: 'Integers',
    difficulty: 'Medium',
    text: 'What is -8 + 15?',
    options: ['-7', '7', '23', '-23'],
    answerIndex: 1,
    hint: 'Move 15 steps right from -8.',
    explanation: '-8 + 15 = 7.',
  ),
  const AdvancedQuestion(
    grade: 7,
    topic: 'Algebra',
    difficulty: 'Hard',
    text: 'Solve: 3x + 5 = 20.',
    options: ['3', '5', '7', '10'],
    answerIndex: 1,
    hint: 'Subtract 5, then divide by 3.',
    explanation: '3x = 15, so x = 5.',
  ),
  const AdvancedQuestion(
    grade: 8,
    topic: 'Linear Equations',
    difficulty: 'Hard',
    text: 'Solve: 5x - 10 = 25.',
    options: ['5', '6', '7', '8'],
    answerIndex: 2,
    hint: 'Add 10 to both sides.',
    explanation: '5x = 35, so x = 7.',
  ),
  const AdvancedQuestion(
    grade: 9,
    topic: 'Polynomials',
    difficulty: 'Hard',
    text: 'What is the degree of 4x³ + 2x² - 7?',
    options: ['1', '2', '3', '4'],
    answerIndex: 2,
    hint: 'Find the highest power of x.',
    explanation: 'The highest power is 3.',
  ),
  const AdvancedQuestion(
    grade: 10,
    topic: 'Trigonometry',
    difficulty: 'Hard',
    text: 'What is sin 30°?',
    options: ['1', '1/2', '√3/2', '0'],
    answerIndex: 1,
    hint: 'Remember the standard trigonometric values.',
    explanation: 'sin 30° = 1/2.',
  ),
  const AdvancedQuestion(
    grade: 11,
    topic: 'Calculus',
    difficulty: 'Expert',
    text: 'What is the derivative of x²?',
    options: ['x', '2x', 'x³', '2'],
    answerIndex: 1,
    hint: 'Use the power rule.',
    explanation: 'd(x²)/dx = 2x.',
  ),
  const AdvancedQuestion(
    grade: 12,
    topic: 'Integration',
    difficulty: 'Expert',
    text: 'What is ∫ 2x dx?',
    options: ['x² + C', '2x² + C', 'x + C', '2 + C'],
    answerIndex: 0,
    hint: 'Increase the power by one and divide by the new power.',
    explanation: '∫ 2x dx = x² + C.',
  ),
];

List<AdvancedQuestion> advancedQuestionsForClass(int grade) {
  return advancedQuestionBank
      .where((question) => question.grade == grade)
      .toList();
}

int get advancedQuestionCount => advancedQuestionBank.length;
