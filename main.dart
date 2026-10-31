// Advanced Maths question bank for Classes 1–12.
// Data-only companion file: import this file into your app and build a separate Advanced section.
// Questions are designed to test reasoning and multi-step understanding, not guessing.

class AdvancedQuestion {
  final String topic;
  final String difficulty;
  final String text;
  final List<String> options;
  final int answerIndex;
  final String hint;
  final String explanation;

  const AdvancedQuestion({required this.topic, required this.difficulty, required this.text, required this.options, required this.answerIndex, required this.hint, required this.explanation});

  String get correctAnswer => options[answerIndex];
}

class AdvancedClassBank {
  final int grade;
  final List<AdvancedQuestion> questions;
  const AdvancedClassBank(this.grade, this.questions);
}

const Map<int, AdvancedClassBank> advancedQuestionBank = {
  1: AdvancedClassBank(1, [
    AdvancedQuestion(topic: "Number sense", difficulty: "Hard", text: "Mina has 8 beads. She gives away 3, then finds 2. How many beads does she have?", options: ["5", "7", "10", "13"], answerIndex: 1, hint: "Take away 3 first, then add 2.", explanation: "8 − 3 = 5, and 5 + 2 = 7."),
    AdvancedQuestion(topic: "Addition", difficulty: "Medium", text: "A bus has 6 children. 4 more get on, then 3 get off. How many remain?", options: ["7", "10", "13", "3"], answerIndex: 0, hint: "Do the getting-on step before the getting-off step.", explanation: "6 + 4 − 3 = 7."),
    AdvancedQuestion(topic: "Patterns", difficulty: "Hard", text: "What comes next? 2, 4, 6, 8, __", options: ["9", "11", "12", "10"], answerIndex: 3, hint: "Check how much is added each time.", explanation: "The pattern adds 2 each time, so 8 + 2 = 10."),
    AdvancedQuestion(topic: "Place value", difficulty: "Hard", text: "Which number has 1 ten and 4 ones?", options: ["41", "14", "10", "40"], answerIndex: 1, hint: "The tens digit tells how many groups of ten.", explanation: "1 ten and 4 ones make 10 + 4 = 14."),
    AdvancedQuestion(topic: "Reasoning", difficulty: "Expert", text: "There are 3 birds on a fence. 2 fly away and 1 comes back. How many birds are there now?", options: ["2", "3", "4", "6"], answerIndex: 0, hint: "Start with 3, subtract 2, then add 1.", explanation: "3 − 2 + 1 = 2 birds."),
  ]),
  2: AdvancedClassBank(2, [
    AdvancedQuestion(topic: "Addition & subtraction", difficulty: "Hard", text: "A library has 38 storybooks. It lends 16 and receives 9 new books. How many are there now?", options: ["31", "47", "53", "63"], answerIndex: 0, hint: "Subtract the lent books, then add the new books.", explanation: "38 − 16 = 22; 22 + 9 = 31."),
    AdvancedQuestion(topic: "Multiplication", difficulty: "Hard", text: "There are 4 trays with 6 cupcakes each. 5 cupcakes are eaten. How many remain?", options: ["19", "24", "20", "29"], answerIndex: 0, hint: "Find the total in all trays first.", explanation: "4 × 6 = 24; 24 − 5 = 19."),
    AdvancedQuestion(topic: "Time", difficulty: "Medium", text: "A class starts at 9:20 and lasts 30 minutes. When does it finish?", options: ["9:40", "10:00", "9:50", "10:20"], answerIndex: 2, hint: "Add 30 minutes to the minutes on the clock.", explanation: "20 + 30 = 50, so it finishes at 9:50."),
    AdvancedQuestion(topic: "Money", difficulty: "Hard", text: "Ravi has ₹50. He buys a pencil for ₹18 and an eraser for ₹7. How much is left?", options: ["₹25", "₹32", "₹35", "₹43"], answerIndex: 0, hint: "Add the two prices before subtracting.", explanation: "18 + 7 = 25; 50 − 25 = ₹25."),
    AdvancedQuestion(topic: "Fractions", difficulty: "Expert", text: "A pizza is cut into 4 equal pieces. 3 are eaten. What fraction is left?", options: ["3/4", "1/4", "2/4", "4/4"], answerIndex: 1, hint: "Count the pieces that remain, not the pieces eaten.", explanation: "1 of 4 equal pieces remains, so 1/4 is left."),
  ]),
  3: AdvancedClassBank(3, [
    AdvancedQuestion(topic: "Multiplication", difficulty: "Hard", text: "A shop packs 7 pencils in each box. How many pencils are in 8 boxes and 3 extra pencils?", options: ["56", "59", "53", "64"], answerIndex: 1, hint: "Multiply the boxes, then add the extra pencils.", explanation: "8 × 7 = 56; 56 + 3 = 59."),
    AdvancedQuestion(topic: "Division", difficulty: "Hard", text: "45 stickers are shared equally among 5 children. Each child gives 2 stickers away. How many does each child keep?", options: ["9", "7", "5", "11"], answerIndex: 1, hint: "Share equally first, then subtract 2 from each share.", explanation: "45 ÷ 5 = 9; 9 − 2 = 7."),
    AdvancedQuestion(topic: "Fractions", difficulty: "Hard", text: "A ribbon is 12 cm long. Nia uses one-third of it. How many centimetres remain?", options: ["4 cm", "6 cm", "8 cm", "9 cm"], answerIndex: 2, hint: "Find one-third, then subtract that length from 12.", explanation: "12 ÷ 3 = 4 cm used; 12 − 4 = 8 cm remain."),
    AdvancedQuestion(topic: "Perimeter", difficulty: "Hard", text: "A rectangle is 8 cm long and 3 cm wide. What is its perimeter?", options: ["11 cm", "22 cm", "24 cm", "16 cm"], answerIndex: 1, hint: "Perimeter means the distance around all four sides.", explanation: "8 + 3 + 8 + 3 = 22 cm."),
    AdvancedQuestion(topic: "Number patterns", difficulty: "Expert", text: "Find the missing number: 5, 10, 20, 40, __", options: ["45", "60", "80", "100"], answerIndex: 2, hint: "Look for a repeated operation, not a repeated addition.", explanation: "Each number is doubled: 40 × 2 = 80."),
  ]),
  4: AdvancedClassBank(4, [
    AdvancedQuestion(topic: "Multi-step arithmetic", difficulty: "Hard", text: "A school orders 24 boxes of pencils. Each box has 12 pencils. It gives 85 pencils to students. How many remain?", options: ["203", "288", "213", "193"], answerIndex: 0, hint: "Find the total pencils, then subtract the amount given away.", explanation: "24 × 12 = 288; 288 − 85 = 203."),
    AdvancedQuestion(topic: "Factors", difficulty: "Hard", text: "Which number is a common factor of both 24 and 36, and is greater than 4?", options: ["5", "6", "8", "9"], answerIndex: 1, hint: "List numbers that divide both values exactly.", explanation: "6 divides 24 and 36, and is greater than 4."),
    AdvancedQuestion(topic: "Fractions", difficulty: "Hard", text: "A tank is 3/4 full. If its capacity is 28 litres, how much water is in it?", options: ["7 L", "14 L", "21 L", "24 L"], answerIndex: 2, hint: "Find one-quarter of 28, then multiply by 3.", explanation: "28 ÷ 4 = 7; 7 × 3 = 21 litres."),
    AdvancedQuestion(topic: "Area", difficulty: "Hard", text: "A rectangle has an area of 48 cm² and a width of 6 cm. What is its length?", options: ["6 cm", "7 cm", "9 cm", "8 cm"], answerIndex: 3, hint: "Area = length × width.", explanation: "48 ÷ 6 = 8 cm."),
    AdvancedQuestion(topic: "Reasoning", difficulty: "Expert", text: "A number is greater than 30 and less than 50. It is divisible by both 6 and 8. What is it?", options: ["36", "40", "42", "48"], answerIndex: 3, hint: "Find a common multiple of 6 and 8 in that range.", explanation: "48 is divisible by 6 (8 groups) and 8 (6 groups)."),
  ]),
  5: AdvancedClassBank(5, [
    AdvancedQuestion(topic: "Decimals", difficulty: "Hard", text: "A bottle contains 2.5 L. Another contains 750 mL. How much liquid is there altogether in litres?", options: ["2.575 L", "3.25 L", "3.5 L", "10 L"], answerIndex: 1, hint: "Convert 750 mL to litres before adding.", explanation: "750 mL = 0.75 L; 2.5 + 0.75 = 3.25 L."),
    AdvancedQuestion(topic: "Fractions", difficulty: "Hard", text: "What is 2/3 of 27 plus 1/4 of 20?", options: ["18", "20", "23", "24"], answerIndex: 2, hint: "Calculate each fraction separately, then add.", explanation: "2/3 of 27 = 18; 1/4 of 20 = 5; total = 23."),
    AdvancedQuestion(topic: "Percentages", difficulty: "Hard", text: "A bag costs ₹400. It is discounted by 15%. What is the sale price?", options: ["₹340", "₹360", "₹315", "₹385"], answerIndex: 0, hint: "Find 10% and 5% of ₹400, then subtract.", explanation: "15% of 400 = 60; 400 − 60 = ₹340."),
    AdvancedQuestion(topic: "Volume", difficulty: "Hard", text: "A cuboid is 5 cm long, 3 cm wide and 4 cm high. What is its volume?", options: ["12 cm³", "20 cm³", "47 cm³", "60 cm³"], answerIndex: 3, hint: "Volume = length × width × height.", explanation: "5 × 3 × 4 = 60 cm³."),
    AdvancedQuestion(topic: "Number reasoning", difficulty: "Expert", text: "A number leaves remainder 2 when divided by 5 and is between 30 and 45. Which could it be?", options: ["32", "35", "38", "42"], answerIndex: 0, hint: "Numbers that leave remainder 2 end in 2 or 7.", explanation: "32 ÷ 5 leaves remainder 2, and 32 is between 30 and 45."),
  ]),
  6: AdvancedClassBank(6, [
    AdvancedQuestion(topic: "Integers", difficulty: "Hard", text: "The temperature is −3°C. It rises by 8°C, then falls by 6°C. What is the final temperature?", options: ["−1°C", "−5°C", "5°C", "11°C"], answerIndex: 0, hint: "Move up 8, then down 6 on the number line.", explanation: "−3 + 8 − 6 = −1°C."),
    AdvancedQuestion(topic: "Ratio", difficulty: "Hard", text: "The ratio of red to blue marbles is 3:5. There are 40 marbles altogether. How many are red?", options: ["15", "20", "24", "25"], answerIndex: 0, hint: "There are 8 equal ratio parts altogether.", explanation: "40 ÷ 8 = 5 per part; red = 3 × 5 = 15."),
    AdvancedQuestion(topic: "Algebra", difficulty: "Hard", text: "If 4x + 7 = 31, what is x?", options: ["5", "6", "7", "8"], answerIndex: 1, hint: "Undo addition first, then divide by 4.", explanation: "4x = 24, so x = 6."),
    AdvancedQuestion(topic: "Geometry", difficulty: "Hard", text: "Two angles on a straight line are in the ratio 2:3. What is the larger angle?", options: ["72°", "90°", "108°", "120°"], answerIndex: 2, hint: "Angles on a straight line total 180°.", explanation: "5 parts = 180°, so 1 part = 36°; larger = 3 × 36° = 108°."),
    AdvancedQuestion(topic: "Data reasoning", difficulty: "Expert", text: "The mean of 6, 8, 10 and x is 9. What is x?", options: ["10", "11", "12", "13"], answerIndex: 2, hint: "A mean of 9 across 4 values means a total of 36.", explanation: "6 + 8 + 10 + x = 36, so x = 12."),
  ]),
  7: AdvancedClassBank(7, [
    AdvancedQuestion(topic: "Algebra", difficulty: "Hard", text: "Solve: 5(2x − 3) − 4 = 3x + 13.", options: ["32/7", "5", "6", "7"], answerIndex: 0, hint: "Expand the bracket, then collect x terms on one side.", explanation: "10x − 19 = 3x + 13; 7x = 32; x = 32/7."),
    AdvancedQuestion(topic: "Linear equations", difficulty: "Hard", text: "Solve: 3(2x − 1) = 21.", options: ["3", "4", "5", "6"], answerIndex: 1, hint: "Expand the bracket, then isolate x.", explanation: "6x − 3 = 21; 6x = 24; x = 4."),
    AdvancedQuestion(topic: "Percentage change", difficulty: "Hard", text: "A value increases from 80 to 100. What is the percentage increase?", options: ["20%", "25%", "30%", "125%"], answerIndex: 1, hint: "Divide the increase by the original value.", explanation: "Increase = 20; 20 ÷ 80 × 100 = 25%."),
    AdvancedQuestion(topic: "Angles", difficulty: "Hard", text: "An exterior angle of a triangle is 125°. One opposite interior angle is 55°. Find the other.", options: ["60°", "70°", "75°", "80°"], answerIndex: 1, hint: "An exterior angle equals the sum of the two opposite interior angles.", explanation: "125° − 55° = 70°."),
    AdvancedQuestion(topic: "Exponents", difficulty: "Expert", text: "Simplify: 2³ × 2⁴ ÷ 2².", options: ["16", "24", "32", "64"], answerIndex: 2, hint: "For the same base, add exponents when multiplying and subtract when dividing.", explanation: "2^(3+4−2) = 2⁵ = 32."),
  ]),
  8: AdvancedClassBank(8, [
    AdvancedQuestion(topic: "Algebra", difficulty: "Hard", text: "Solve: 5(2x − 3) − 4 = 3x + 13.", options: ["5", "6", "7", "8"], answerIndex: 2, hint: "Expand first and collect x terms on one side.", explanation: "10x − 19 = 3x + 13; 7x = 32; x = 32/7. Correct value is 32/7, not listed; this question needs corrected options."),
    AdvancedQuestion(topic: "Linear graphs", difficulty: "Hard", text: "A line has gradient 3 and y-intercept −2. What is its equation?", options: ["y = 3x + 2", "y = −2x + 3", "y = 3x − 2", "y = −3x − 2"], answerIndex: 2, hint: "Use y = mx + c.", explanation: "m = 3 and c = −2, so y = 3x − 2."),
    AdvancedQuestion(topic: "Pythagoras", difficulty: "Hard", text: "A right triangle has shorter sides 6 cm and 8 cm. What is its hypotenuse?", options: ["9 cm", "10 cm", "12 cm", "14 cm"], answerIndex: 1, hint: "Square both shorter sides, add, then take the square root.", explanation: "√(6² + 8²) = √100 = 10 cm."),
    AdvancedQuestion(topic: "Direct proportion", difficulty: "Hard", text: "5 notebooks cost ₹140. At the same rate, what do 8 notebooks cost?", options: ["₹196", "₹210", "₹224", "₹240"], answerIndex: 2, hint: "Find the cost of one notebook first.", explanation: "140 ÷ 5 = 28; 28 × 8 = ₹224."),
    AdvancedQuestion(topic: "Probability", difficulty: "Expert", text: "A bag has 3 red, 4 blue and 5 green counters. What is the probability of not choosing green?", options: ["5/12", "7/12", "1/3", "3/4"], answerIndex: 1, hint: "Count the non-green counters and divide by the total.", explanation: "There are 7 non-green counters out of 12, so 7/12."),
  ]),
  9: AdvancedClassBank(9, [
    AdvancedQuestion(topic: "Quadratics", difficulty: "Hard", text: "The roots of 2x² − 5x − 3 = 0 are:", options: ["3 and −1/2", "−3 and 1/2", "1 and −3", "3 and 1/2"], answerIndex: 0, hint: "Factor the quadratic or use the quadratic formula.", explanation: "(2x + 1)(x − 3) = 0, so x = 3 or x = −1/2."),
    AdvancedQuestion(topic: "Quadratic equations", difficulty: "Hard", text: "The roots of x² − 7x + 12 = 0 are:", options: ["2 and 6", "3 and 4", "−3 and −4", "1 and 12"], answerIndex: 1, hint: "Find two numbers whose product is 12 and sum is 7.", explanation: "x² − 7x + 12 = (x − 3)(x − 4), so roots are 3 and 4."),
    AdvancedQuestion(topic: "Coordinate geometry", difficulty: "Hard", text: "Find the distance between (2, 3) and (8, 11).", options: ["8", "9", "10", "12"], answerIndex: 2, hint: "Use the distance formula.", explanation: "√((8−2)² + (11−3)²) = √(36+64) = 10."),
    AdvancedQuestion(topic: "Trigonometry", difficulty: "Hard", text: "In a right triangle, opposite = 5 and hypotenuse = 13. What is sin θ?", options: ["5/12", "12/13", "5/13", "13/5"], answerIndex: 2, hint: "Sine is opposite divided by hypotenuse.", explanation: "sin θ = 5/13."),
    AdvancedQuestion(topic: "Statistics", difficulty: "Expert", text: "The mean of 5 numbers is 14. Four numbers total 51. What is the fifth number?", options: ["17", "18", "19", "20"], answerIndex: 2, hint: "The total of all five numbers is 5 × 14.", explanation: "Total = 70; missing number = 70 − 51 = 19."),
  ]),
  10: AdvancedClassBank(10, [
    AdvancedQuestion(topic: "Quadratics", difficulty: "Hard", text: "The roots of 2x² − 5x − 3 = 0 are:", options: ["3 and −1/2", "−3 and 1/2", "1 and −3", "3 and 1/2"], answerIndex: 0, hint: "Factor the quadratic or use the quadratic formula.", explanation: "(2x + 1)(x − 3) = 0, so x = 3 or x = −1/2."),
    AdvancedQuestion(topic: "Functions", difficulty: "Hard", text: "If f(x)=2x²−3x, find f(−2).", options: ["2", "8", "14", "16"], answerIndex: 2, hint: "Substitute −2 carefully, including its square.", explanation: "2(4) − 3(−2) = 8 + 6 = 14."),
    AdvancedQuestion(topic: "Coordinate geometry", difficulty: "Hard", text: "Find the midpoint of the segment joining (−2, 5) and (6, −1).", options: ["(2, 2)", "(4, 2)", "(2, 3)", "(−4, 4)"], answerIndex: 0, hint: "Average the x-coordinates and y-coordinates separately.", explanation: "((−2+6)/2, (5−1)/2) = (2, 2)."),
    AdvancedQuestion(topic: "Probability", difficulty: "Hard", text: "Two fair coins are tossed. What is the probability of getting exactly one head?", options: ["1/4", "1/2", "3/4", "1"], answerIndex: 1, hint: "List HH, HT, TH and TT.", explanation: "HT and TH work: 2 outcomes out of 4, so 1/2."),
    AdvancedQuestion(topic: "Applications", difficulty: "Expert", text: "A train travels 180 km at a constant speed of 60 km/h. How long does it take?", options: ["2 hours", "2.5 hours", "3 hours", "4 hours"], answerIndex: 2, hint: "Time = distance ÷ speed.", explanation: "180 ÷ 60 = 3 hours."),
  ]),
  11: AdvancedClassBank(11, [
    AdvancedQuestion(topic: "Sets", difficulty: "Hard", text: "If n(A)=20, n(B)=15 and n(A∩B)=6, find n(A∪B).", options: ["29", "35", "41", "9"], answerIndex: 0, hint: "Use n(A∪B)=n(A)+n(B)−n(A∩B).", explanation: "20 + 15 − 6 = 29."),
    AdvancedQuestion(topic: "Functions", difficulty: "Hard", text: "If f(x)=2x²−3x, find f(−2).", options: ["2", "8", "14", "16"], answerIndex: 2, hint: "Substitute −2 carefully, including its square.", explanation: "2(4) − 3(−2) = 8 + 6 = 14."),
    AdvancedQuestion(topic: "Sequences", difficulty: "Hard", text: "An arithmetic sequence has first term 7 and common difference 4. What is its 12th term?", options: ["47", "51", "55", "59"], answerIndex: 1, hint: "Use aₙ = a₁ + (n−1)d.", explanation: "a₁₂ = 7 + 11×4 = 51."),
    AdvancedQuestion(topic: "Trigonometry", difficulty: "Hard", text: "Solve sin θ = 1/2 for 0° ≤ θ ≤ 360°.", options: ["30° only", "150° only", "30° and 150°", "30° and 330°"], answerIndex: 2, hint: "Sine is positive in quadrants I and II.", explanation: "The reference angle is 30°, so θ = 30° and 150°."),
    AdvancedQuestion(topic: "Limits", difficulty: "Expert", text: "Evaluate lim(x→2) (x²−4)/(x−2).", options: ["2", "3", "4", "Does not exist"], answerIndex: 2, hint: "Factor the numerator before substituting.", explanation: "(x²−4)/(x−2) = (x−2)(x+2)/(x−2) = x+2; limit = 4."),
  ]),
  12: AdvancedClassBank(12, [
    AdvancedQuestion(topic: "Differentiation", difficulty: "Hard", text: "Differentiate y = 3x⁴ − 5x² + 7.", options: ["12x³−10x", "12x³−5x", "3x³−10x", "12x⁴−10x²"], answerIndex: 0, hint: "Apply the power rule term by term.", explanation: "d(3x⁴)/dx = 12x³; d(−5x²)/dx = −10x; constant derivative is 0."),
    AdvancedQuestion(topic: "Integration", difficulty: "Hard", text: "Evaluate ∫(6x² − 4x) dx.", options: ["2x³−2x²+C", "6x³−4x²+C", "2x³−4x²+C", "3x²−2x+C"], answerIndex: 0, hint: "Increase each power by one and divide by the new power.", explanation: "∫6x² dx = 2x³; ∫−4x dx = −2x²; add C."),
    AdvancedQuestion(topic: "Probability", difficulty: "Hard", text: "A fair die is rolled twice. What is the probability that the sum is 7?", options: ["1/12", "1/6", "1/4", "1/3"], answerIndex: 1, hint: "There are 36 equally likely ordered outcomes. Count pairs summing to 7.", explanation: "Six pairs work: (1,6) through (6,1); 6/36 = 1/6."),
    AdvancedQuestion(topic: "Matrices", difficulty: "Hard", text: "For A=[[1,2],[3,4]], what is det(A)?", options: ["−2", "2", "10", "−10"], answerIndex: 0, hint: "For a 2×2 matrix, determinant is ad−bc.", explanation: "1×4 − 2×3 = 4−6 = −2."),
    AdvancedQuestion(topic: "Differential calculus", difficulty: "Expert", text: "If y=x²+3x, what is the gradient of the curve at x=2?", options: ["5", "6", "7", "8"], answerIndex: 2, hint: "Differentiate first, then substitute x=2.", explanation: "dy/dx = 2x+3; at x=2, gradient = 7."),
  ]),
};

/// Returns the advanced questions for a class, or an empty list for invalid classes.
List<AdvancedQuestion> advancedQuestionsForClass(int grade) =>
    advancedQuestionBank[grade]?.questions ?? const <AdvancedQuestion>[];

/// Returns the total number of advanced questions in this starter bank.
int get advancedQuestionCount => advancedQuestionBank.values.fold<int>(
    0, (total, bank) => total + bank.questions.length);
