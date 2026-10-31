import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'advanced_question_bank.dart';
late Map<int, List<Map<String, dynamic>>> questionData;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final String jsonString =
      await rootBundle.loadString('question_bank_10000.json');

  final Map<String, dynamic> decoded = jsonDecode(jsonString);

  final List<dynamic> allQuestions = decoded['questions'];

  questionData = {
    for (int grade = 1; grade <= 12; grade++)
      grade: allQuestions
          .where((q) => q['class'] == grade)
          .map((q) => Map<String, dynamic>.from(q))
          .toList(),
  };

  runApp(const QuestionBank());
}

class QuestionBank extends StatelessWidget {
  const QuestionBank({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'QUESTION BANK',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(colorSchemeSeed: const Color(0xFF3157C8), useMaterial3: true),
    home: const HomePage(),
  );
}

class Q {
  final String text, explanation;
  final List<String> options;
  final int answer;
  const Q(this.text, this.options, this.answer, this.explanation);
}

class Chapter {
  final String name;
  final IconData icon;
  final List<Q> questions;
  const Chapter(this.name, this.icon, this.questions);
}

final class2Chapters = <Chapter>[
  Chapter('Number Fun', Icons.numbers, [
    Q('What number comes after 12?', ['13', '11', '14', '22'], 0, '12 + 1 = 13.'),
    Q('What number comes after 13?', ['12', '14', '15', '23'], 1, '13 + 1 = 14.'),
    Q('What number comes after 14?', ['13', '16', '15', '24'], 2, '14 + 1 = 15.'),
    Q('What number comes after 15?', ['14', '17', '25', '16'], 3, '15 + 1 = 16.'),
    Q('What number comes after 16?', ['17', '15', '18', '26'], 0, '16 + 1 = 17.'),
    Q('What number comes after 17?', ['16', '18', '19', '27'], 1, '17 + 1 = 18.'),
    Q('What number comes after 18?', ['17', '20', '19', '28'], 2, '18 + 1 = 19.'),
    Q('What number comes after 19?', ['18', '21', '29', '20'], 3, '19 + 1 = 20.'),
    Q('What number comes after 20?', ['21', '19', '22', '30'], 0, '20 + 1 = 21.'),
    Q('What number comes after 21?', ['20', '22', '23', '31'], 1, '21 + 1 = 22.'),
    Q('What number comes after 22?', ['21', '24', '23', '32'], 2, '22 + 1 = 23.'),
    Q('What number comes after 23?', ['22', '25', '33', '24'], 3, '23 + 1 = 24.'),
    Q('What number comes after 24?', ['25', '23', '26', '34'], 0, '24 + 1 = 25.'),
    Q('What number comes after 25?', ['24', '26', '27', '35'], 1, '25 + 1 = 26.'),
    Q('What number comes after 26?', ['25', '28', '27', '36'], 2, '26 + 1 = 27.'),
    Q('What number comes after 27?', ['26', '29', '37', '28'], 3, '27 + 1 = 28.'),
    Q('What number comes after 28?', ['29', '27', '30', '38'], 0, '28 + 1 = 29.'),
    Q('What number comes after 29?', ['28', '30', '31', '39'], 1, '29 + 1 = 30.'),
    Q('What number comes after 30?', ['29', '32', '31', '40'], 2, '30 + 1 = 31.'),
    Q('What number comes after 31?', ['30', '33', '41', '32'], 3, '31 + 1 = 32.'),
    Q('What number comes after 32?', ['33', '31', '34', '42'], 0, '32 + 1 = 33.'),
    Q('What number comes after 33?', ['32', '34', '35', '43'], 1, '33 + 1 = 34.'),
    Q('What number comes after 34?', ['33', '36', '35', '44'], 2, '34 + 1 = 35.'),
    Q('What number comes after 35?', ['34', '37', '45', '36'], 3, '35 + 1 = 36.'),
    Q('What number comes after 36?', ['37', '35', '38', '46'], 0, '36 + 1 = 37.'),
    Q('What number comes after 37?', ['36', '38', '39', '47'], 1, '37 + 1 = 38.'),
    Q('What number comes after 38?', ['37', '40', '39', '48'], 2, '38 + 1 = 39.'),
    Q('What number comes after 39?', ['38', '41', '49', '40'], 3, '39 + 1 = 40.'),
    Q('What number comes after 40?', ['41', '39', '42', '50'], 0, '40 + 1 = 41.'),
    Q('What number comes after 41?', ['40', '42', '43', '51'], 1, '41 + 1 = 42.'),
    Q('What number comes after 42?', ['41', '44', '43', '52'], 2, '42 + 1 = 43.'),
    Q('What number comes after 43?', ['42', '45', '53', '44'], 3, '43 + 1 = 44.'),
    Q('What number comes after 44?', ['45', '43', '46', '54'], 0, '44 + 1 = 45.'),
    Q('What number comes after 45?', ['44', '46', '47', '55'], 1, '45 + 1 = 46.'),
    Q('What number comes after 46?', ['45', '48', '47', '56'], 2, '46 + 1 = 47.'),
    Q('What number comes after 47?', ['46', '49', '57', '48'], 3, '47 + 1 = 48.'),
    Q('What number comes just before 21?', ['20', '22', '19', '31'], 0, '20 comes immediately before 21.'),
    Q('What number comes just before 22?', ['23', '21', '20', '32'], 1, '21 comes immediately before 22.'),
    Q('What number comes just before 23?', ['24', '21', '22', '33'], 2, '22 comes immediately before 23.'),
    Q('What number comes just before 24?', ['25', '22', '34', '23'], 3, '23 comes immediately before 24.'),
    Q('What number comes just before 25?', ['24', '26', '23', '35'], 0, '24 comes immediately before 25.'),
    Q('What number comes just before 26?', ['27', '25', '24', '36'], 1, '25 comes immediately before 26.'),
    Q('What number comes just before 27?', ['28', '25', '26', '37'], 2, '26 comes immediately before 27.'),
    Q('What number comes just before 28?', ['29', '26', '38', '27'], 3, '27 comes immediately before 28.'),
    Q('What number comes just before 29?', ['28', '30', '27', '39'], 0, '28 comes immediately before 29.'),
    Q('What number comes just before 30?', ['31', '29', '28', '40'], 1, '29 comes immediately before 30.'),
    Q('What number comes just before 31?', ['32', '29', '30', '41'], 2, '30 comes immediately before 31.'),
    Q('What number comes just before 32?', ['33', '30', '42', '31'], 3, '31 comes immediately before 32.'),
    Q('What number comes just before 33?', ['32', '34', '31', '43'], 0, '32 comes immediately before 33.'),
    Q('What number comes just before 34?', ['35', '33', '32', '44'], 1, '33 comes immediately before 34.'),
    Q('What number comes just before 35?', ['36', '33', '34', '45'], 2, '34 comes immediately before 35.'),
    Q('What number comes just before 36?', ['37', '34', '46', '35'], 3, '35 comes immediately before 36.'),
    Q('What number comes just before 37?', ['36', '38', '35', '47'], 0, '36 comes immediately before 37.'),
    Q('What number comes just before 38?', ['39', '37', '36', '48'], 1, '37 comes immediately before 38.'),
    Q('What number comes just before 39?', ['40', '37', '38', '49'], 2, '38 comes immediately before 39.'),
    Q('What number comes just before 40?', ['41', '38', '50', '39'], 3, '39 comes immediately before 40.'),
    Q('What number comes just before 41?', ['40', '42', '39', '51'], 0, '40 comes immediately before 41.'),
    Q('What number comes just before 42?', ['43', '41', '40', '52'], 1, '41 comes immediately before 42.'),
    Q('What number comes just before 43?', ['44', '41', '42', '53'], 2, '42 comes immediately before 43.'),
    Q('What number comes just before 44?', ['45', '42', '54', '43'], 3, '43 comes immediately before 44.'),
    Q('What number comes just before 45?', ['44', '46', '43', '55'], 0, '44 comes immediately before 45.'),
    Q('What number comes just before 46?', ['47', '45', '44', '56'], 1, '45 comes immediately before 46.'),
    Q('What number comes just before 47?', ['48', '45', '46', '57'], 2, '46 comes immediately before 47.'),
    Q('What number comes just before 48?', ['49', '46', '58', '47'], 3, '47 comes immediately before 48.'),
    Q('What number comes just before 49?', ['48', '50', '47', '59'], 0, '48 comes immediately before 49.'),
    Q('What number comes just before 50?', ['51', '49', '48', '60'], 1, '49 comes immediately before 50.'),
    Q('What number comes just before 51?', ['52', '49', '50', '61'], 2, '50 comes immediately before 51.'),
    Q('What number comes just before 52?', ['53', '50', '62', '51'], 3, '51 comes immediately before 52.'),
    Q('What number comes just before 53?', ['52', '54', '51', '63'], 0, '52 comes immediately before 53.'),
    Q('What number comes just before 54?', ['55', '53', '52', '64'], 1, '53 comes immediately before 54.'),
    Q('What number comes just before 55?', ['56', '53', '54', '65'], 2, '54 comes immediately before 55.'),
    Q('What number comes just before 56?', ['57', '54', '66', '55'], 3, '55 comes immediately before 56.'),
  ]),
  Chapter('Addition', Icons.add_circle_outline, [
    Q('What is 2 + 7?', ['9', '8', '10', '11'], 0, '2 + 7 = 9.'),
    Q('What is 3 + 1?', ['3', '4', '5', '6'], 1, '3 + 1 = 4.'),
    Q('What is 4 + 4?', ['7', '9', '8', '10'], 2, '4 + 4 = 8.'),
    Q('What is 5 + 7?', ['11', '13', '14', '12'], 3, '5 + 7 = 12.'),
    Q('What is 6 + 1?', ['7', '6', '8', '9'], 0, '6 + 1 = 7.'),
    Q('What is 7 + 4?', ['10', '11', '12', '13'], 1, '7 + 4 = 11.'),
    Q('What is 8 + 7?', ['14', '16', '15', '17'], 2, '8 + 7 = 15.'),
    Q('What is 9 + 1?', ['9', '11', '12', '10'], 3, '9 + 1 = 10.'),
    Q('What is 10 + 4?', ['14', '13', '15', '16'], 0, '10 + 4 = 14.'),
    Q('What is 11 + 7?', ['17', '18', '19', '20'], 1, '11 + 7 = 18.'),
    Q('What is 12 + 1?', ['12', '14', '13', '15'], 2, '12 + 1 = 13.'),
    Q('What is 13 + 4?', ['16', '18', '19', '17'], 3, '13 + 4 = 17.'),
    Q('What is 14 + 7?', ['21', '20', '22', '23'], 0, '14 + 7 = 21.'),
    Q('What is 15 + 1?', ['15', '16', '17', '18'], 1, '15 + 1 = 16.'),
    Q('What is 16 + 4?', ['19', '21', '20', '22'], 2, '16 + 4 = 20.'),
    Q('What is 17 + 7?', ['23', '25', '26', '24'], 3, '17 + 7 = 24.'),
    Q('What is 18 + 1?', ['19', '18', '20', '21'], 0, '18 + 1 = 19.'),
    Q('What is 19 + 4?', ['22', '23', '24', '25'], 1, '19 + 4 = 23.'),
    Q('What is 11 + 3?', ['12', '13', '14', '15'], 2, '11 + 3 = 14.'),
    Q('What is 12 + 5?', ['15', '16', '18', '17'], 3, '12 + 5 = 17.'),
    Q('What is 13 + 7?', ['20', '18', '19', '21'], 0, '13 + 7 = 20.'),
    Q('What is 14 + 9?', ['21', '23', '22', '24'], 1, '14 + 9 = 23.'),
    Q('What is 15 + 1?', ['14', '15', '16', '17'], 2, '15 + 1 = 16.'),
    Q('What is 16 + 3?', ['17', '18', '20', '19'], 3, '16 + 3 = 19.'),
    Q('What is 17 + 5?', ['22', '20', '21', '23'], 0, '17 + 5 = 22.'),
    Q('What is 18 + 7?', ['23', '25', '24', '26'], 1, '18 + 7 = 25.'),
    Q('What is 19 + 9?', ['26', '27', '28', '29'], 2, '19 + 9 = 28.'),
    Q('What is 20 + 1?', ['19', '20', '22', '21'], 3, '20 + 1 = 21.'),
    Q('What is 21 + 3?', ['24', '22', '23', '25'], 0, '21 + 3 = 24.'),
    Q('What is 22 + 5?', ['25', '27', '26', '28'], 1, '22 + 5 = 27.'),
    Q('What is 23 + 7?', ['28', '29', '30', '31'], 2, '23 + 7 = 30.'),
    Q('What is 24 + 9?', ['31', '32', '34', '33'], 3, '24 + 9 = 33.'),
    Q('What is 25 + 1?', ['26', '24', '25', '27'], 0, '25 + 1 = 26.'),
    Q('What is 26 + 3?', ['27', '29', '28', '30'], 1, '26 + 3 = 29.'),
    Q('What is 27 + 5?', ['30', '31', '32', '33'], 2, '27 + 5 = 32.'),
    Q('What is 28 + 7?', ['33', '34', '36', '35'], 3, '28 + 7 = 35.'),
    Q('A box has 12 crayons. Another box has 6. How many crayons are there altogether?', ['18', '16', '17', '19'], 0, '12 + 6 = 18 crayons.'),
    Q('A box has 13 crayons. Another box has 3. How many crayons are there altogether?', ['14', '16', '15', '17'], 1, '13 + 3 = 16 crayons.'),
    Q('A box has 14 crayons. Another box has 8. How many crayons are there altogether?', ['20', '21', '22', '23'], 2, '14 + 8 = 22 crayons.'),
    Q('A box has 15 crayons. Another box has 5. How many crayons are there altogether?', ['18', '19', '21', '20'], 3, '15 + 5 = 20 crayons.'),
    Q('A box has 16 crayons. Another box has 2. How many crayons are there altogether?', ['18', '16', '17', '19'], 0, '16 + 2 = 18 crayons.'),
    Q('A box has 17 crayons. Another box has 7. How many crayons are there altogether?', ['22', '24', '23', '25'], 1, '17 + 7 = 24 crayons.'),
    Q('A box has 18 crayons. Another box has 4. How many crayons are there altogether?', ['20', '21', '22', '23'], 2, '18 + 4 = 22 crayons.'),
    Q('A box has 19 crayons. Another box has 9. How many crayons are there altogether?', ['26', '27', '29', '28'], 3, '19 + 9 = 28 crayons.'),
    Q('A box has 20 crayons. Another box has 6. How many crayons are there altogether?', ['26', '24', '25', '27'], 0, '20 + 6 = 26 crayons.'),
    Q('A box has 21 crayons. Another box has 3. How many crayons are there altogether?', ['22', '24', '23', '25'], 1, '21 + 3 = 24 crayons.'),
    Q('A box has 22 crayons. Another box has 8. How many crayons are there altogether?', ['28', '29', '30', '31'], 2, '22 + 8 = 30 crayons.'),
    Q('A box has 23 crayons. Another box has 5. How many crayons are there altogether?', ['26', '27', '29', '28'], 3, '23 + 5 = 28 crayons.'),
    Q('A box has 24 crayons. Another box has 2. How many crayons are there altogether?', ['26', '24', '25', '27'], 0, '24 + 2 = 26 crayons.'),
    Q('A box has 25 crayons. Another box has 7. How many crayons are there altogether?', ['30', '32', '31', '33'], 1, '25 + 7 = 32 crayons.'),
    Q('A box has 26 crayons. Another box has 4. How many crayons are there altogether?', ['28', '29', '30', '31'], 2, '26 + 4 = 30 crayons.'),
    Q('A box has 27 crayons. Another box has 9. How many crayons are there altogether?', ['34', '35', '37', '36'], 3, '27 + 9 = 36 crayons.'),
    Q('A box has 28 crayons. Another box has 6. How many crayons are there altogether?', ['34', '32', '33', '35'], 0, '28 + 6 = 34 crayons.'),
    Q('A box has 29 crayons. Another box has 3. How many crayons are there altogether?', ['30', '32', '31', '33'], 1, '29 + 3 = 32 crayons.'),
    Q('Sam has 10 marbles and wins 8 more. How many marbles does Sam have now?', ['17', '19', '18', '20'], 2, '10 + 8 = 18 marbles.'),
    Q('Sam has 11 marbles and wins 6 more. How many marbles does Sam have now?', ['16', '18', '19', '17'], 3, '11 + 6 = 17 marbles.'),
    Q('Sam has 12 marbles and wins 4 more. How many marbles does Sam have now?', ['16', '15', '17', '18'], 0, '12 + 4 = 16 marbles.'),
    Q('Sam has 13 marbles and wins 2 more. How many marbles does Sam have now?', ['14', '15', '16', '17'], 1, '13 + 2 = 15 marbles.'),
    Q('Sam has 14 marbles and wins 9 more. How many marbles does Sam have now?', ['22', '24', '23', '25'], 2, '14 + 9 = 23 marbles.'),
    Q('Sam has 15 marbles and wins 7 more. How many marbles does Sam have now?', ['21', '23', '24', '22'], 3, '15 + 7 = 22 marbles.'),
    Q('Sam has 16 marbles and wins 5 more. How many marbles does Sam have now?', ['21', '20', '22', '23'], 0, '16 + 5 = 21 marbles.'),
    Q('Sam has 17 marbles and wins 3 more. How many marbles does Sam have now?', ['19', '20', '21', '22'], 1, '17 + 3 = 20 marbles.'),
    Q('Sam has 18 marbles and wins 1 more. How many marbles does Sam have now?', ['18', '20', '19', '21'], 2, '18 + 1 = 19 marbles.'),
    Q('Sam has 19 marbles and wins 8 more. How many marbles does Sam have now?', ['26', '28', '29', '27'], 3, '19 + 8 = 27 marbles.'),
    Q('Sam has 20 marbles and wins 6 more. How many marbles does Sam have now?', ['26', '25', '27', '28'], 0, '20 + 6 = 26 marbles.'),
    Q('Sam has 21 marbles and wins 4 more. How many marbles does Sam have now?', ['24', '25', '26', '27'], 1, '21 + 4 = 25 marbles.'),
    Q('Sam has 22 marbles and wins 2 more. How many marbles does Sam have now?', ['23', '25', '24', '26'], 2, '22 + 2 = 24 marbles.'),
    Q('Sam has 23 marbles and wins 9 more. How many marbles does Sam have now?', ['31', '33', '34', '32'], 3, '23 + 9 = 32 marbles.'),
    Q('Sam has 24 marbles and wins 7 more. How many marbles does Sam have now?', ['31', '30', '32', '33'], 0, '24 + 7 = 31 marbles.'),
    Q('Sam has 25 marbles and wins 5 more. How many marbles does Sam have now?', ['29', '30', '31', '32'], 1, '25 + 5 = 30 marbles.'),
    Q('Sam has 26 marbles and wins 3 more. How many marbles does Sam have now?', ['28', '30', '29', '31'], 2, '26 + 3 = 29 marbles.'),
    Q('Sam has 27 marbles and wins 1 more. How many marbles does Sam have now?', ['27', '29', '30', '28'], 3, '27 + 1 = 28 marbles.'),
  ]),
  Chapter('Subtraction', Icons.remove_circle_outline, [
    Q('What is 18 − 1?', ['17', '16', '18', '19'], 0, '18 − 1 = 17.'),
    Q('What is 19 − 4?', ['14', '15', '16', '17'], 1, '19 − 4 = 15.'),
    Q('What is 20 − 7?', ['12', '14', '13', '15'], 2, '20 − 7 = 13.'),
    Q('What is 21 − 1?', ['19', '21', '22', '20'], 3, '21 − 1 = 20.'),
    Q('What is 22 − 4?', ['18', '17', '19', '20'], 0, '22 − 4 = 18.'),
    Q('What is 23 − 7?', ['15', '16', '17', '18'], 1, '23 − 7 = 16.'),
    Q('What is 24 − 1?', ['22', '24', '23', '25'], 2, '24 − 1 = 23.'),
    Q('What is 25 − 4?', ['20', '22', '23', '21'], 3, '25 − 4 = 21.'),
    Q('What is 26 − 7?', ['19', '18', '20', '21'], 0, '26 − 7 = 19.'),
    Q('What is 27 − 1?', ['25', '26', '27', '28'], 1, '27 − 1 = 26.'),
    Q('What is 28 − 4?', ['23', '25', '24', '26'], 2, '28 − 4 = 24.'),
    Q('What is 29 − 7?', ['21', '23', '24', '22'], 3, '29 − 7 = 22.'),
    Q('What is 30 − 1?', ['29', '28', '30', '31'], 0, '30 − 1 = 29.'),
    Q('What is 31 − 4?', ['26', '27', '28', '29'], 1, '31 − 4 = 27.'),
    Q('What is 32 − 7?', ['24', '26', '25', '27'], 2, '32 − 7 = 25.'),
    Q('What is 33 − 1?', ['31', '33', '34', '32'], 3, '33 − 1 = 32.'),
    Q('What is 34 − 4?', ['30', '29', '31', '32'], 0, '34 − 4 = 30.'),
    Q('What is 35 − 7?', ['27', '28', '29', '30'], 1, '35 − 7 = 28.'),
    Q('What is 30 − 2?', ['26', '27', '28', '29'], 2, '30 − 2 = 28.'),
    Q('What is 31 − 4?', ['25', '26', '28', '27'], 3, '31 − 4 = 27.'),
    Q('What is 32 − 6?', ['26', '24', '25', '27'], 0, '32 − 6 = 26.'),
    Q('What is 33 − 8?', ['23', '25', '24', '26'], 1, '33 − 8 = 25.'),
    Q('What is 34 − 10?', ['22', '23', '24', '25'], 2, '34 − 10 = 24.'),
    Q('What is 35 − 2?', ['31', '32', '34', '33'], 3, '35 − 2 = 33.'),
    Q('What is 36 − 4?', ['32', '30', '31', '33'], 0, '36 − 4 = 32.'),
    Q('What is 37 − 6?', ['29', '31', '30', '32'], 1, '37 − 6 = 31.'),
    Q('What is 38 − 8?', ['28', '29', '30', '31'], 2, '38 − 8 = 30.'),
    Q('What is 39 − 10?', ['27', '28', '30', '29'], 3, '39 − 10 = 29.'),
    Q('What is 40 − 2?', ['38', '36', '37', '39'], 0, '40 − 2 = 38.'),
    Q('What is 41 − 4?', ['35', '37', '36', '38'], 1, '41 − 4 = 37.'),
    Q('What is 42 − 6?', ['34', '35', '36', '37'], 2, '42 − 6 = 36.'),
    Q('What is 43 − 8?', ['33', '34', '36', '35'], 3, '43 − 8 = 35.'),
    Q('What is 44 − 10?', ['34', '32', '33', '35'], 0, '44 − 10 = 34.'),
    Q('What is 45 − 2?', ['41', '43', '42', '44'], 1, '45 − 2 = 43.'),
    Q('What is 46 − 4?', ['40', '41', '42', '43'], 2, '46 − 4 = 42.'),
    Q('What is 47 − 6?', ['39', '40', '42', '41'], 3, '47 − 6 = 41.'),
    Q('There are 22 balloons. 3 fly away. How many balloons are left?', ['19', '18', '20', '21'], 0, '22 − 3 = 19 balloons.'),
    Q('There are 23 balloons. 8 fly away. How many balloons are left?', ['14', '15', '16', '17'], 1, '23 − 8 = 15 balloons.'),
    Q('There are 24 balloons. 4 fly away. How many balloons are left?', ['19', '21', '20', '22'], 2, '24 − 4 = 20 balloons.'),
    Q('There are 25 balloons. 9 fly away. How many balloons are left?', ['15', '17', '18', '16'], 3, '25 − 9 = 16 balloons.'),
    Q('There are 26 balloons. 5 fly away. How many balloons are left?', ['21', '20', '22', '23'], 0, '26 − 5 = 21 balloons.'),
    Q('There are 27 balloons. 1 fly away. How many balloons are left?', ['25', '26', '27', '28'], 1, '27 − 1 = 26 balloons.'),
    Q('There are 28 balloons. 6 fly away. How many balloons are left?', ['21', '23', '22', '24'], 2, '28 − 6 = 22 balloons.'),
    Q('There are 29 balloons. 2 fly away. How many balloons are left?', ['26', '28', '29', '27'], 3, '29 − 2 = 27 balloons.'),
    Q('There are 30 balloons. 7 fly away. How many balloons are left?', ['23', '22', '24', '25'], 0, '30 − 7 = 23 balloons.'),
    Q('There are 31 balloons. 3 fly away. How many balloons are left?', ['27', '28', '29', '30'], 1, '31 − 3 = 28 balloons.'),
    Q('There are 32 balloons. 8 fly away. How many balloons are left?', ['23', '25', '24', '26'], 2, '32 − 8 = 24 balloons.'),
    Q('There are 33 balloons. 4 fly away. How many balloons are left?', ['28', '30', '31', '29'], 3, '33 − 4 = 29 balloons.'),
    Q('There are 34 balloons. 9 fly away. How many balloons are left?', ['25', '24', '26', '27'], 0, '34 − 9 = 25 balloons.'),
    Q('There are 35 balloons. 5 fly away. How many balloons are left?', ['29', '30', '31', '32'], 1, '35 − 5 = 30 balloons.'),
    Q('There are 36 balloons. 1 fly away. How many balloons are left?', ['34', '36', '35', '37'], 2, '36 − 1 = 35 balloons.'),
    Q('There are 37 balloons. 6 fly away. How many balloons are left?', ['30', '32', '33', '31'], 3, '37 − 6 = 31 balloons.'),
    Q('There are 38 balloons. 2 fly away. How many balloons are left?', ['36', '35', '37', '38'], 0, '38 − 2 = 36 balloons.'),
    Q('There are 39 balloons. 7 fly away. How many balloons are left?', ['31', '32', '33', '34'], 1, '39 − 7 = 32 balloons.'),
    Q('A shop has 20 pencils and sells 5. How many pencils remain?', ['13', '14', '15', '16'], 2, '20 − 5 = 15 pencils.'),
    Q('A shop has 21 pencils and sells 4. How many pencils remain?', ['15', '16', '18', '17'], 3, '21 − 4 = 17 pencils.'),
    Q('A shop has 22 pencils and sells 3. How many pencils remain?', ['19', '17', '18', '20'], 0, '22 − 3 = 19 pencils.'),
    Q('A shop has 23 pencils and sells 2. How many pencils remain?', ['19', '21', '20', '22'], 1, '23 − 2 = 21 pencils.'),
    Q('A shop has 24 pencils and sells 1. How many pencils remain?', ['21', '22', '23', '24'], 2, '24 − 1 = 23 pencils.'),
    Q('A shop has 25 pencils and sells 8. How many pencils remain?', ['15', '16', '18', '17'], 3, '25 − 8 = 17 pencils.'),
    Q('A shop has 26 pencils and sells 7. How many pencils remain?', ['19', '17', '18', '20'], 0, '26 − 7 = 19 pencils.'),
    Q('A shop has 27 pencils and sells 6. How many pencils remain?', ['19', '21', '20', '22'], 1, '27 − 6 = 21 pencils.'),
    Q('A shop has 28 pencils and sells 5. How many pencils remain?', ['21', '22', '23', '24'], 2, '28 − 5 = 23 pencils.'),
    Q('A shop has 29 pencils and sells 4. How many pencils remain?', ['23', '24', '26', '25'], 3, '29 − 4 = 25 pencils.'),
    Q('A shop has 30 pencils and sells 3. How many pencils remain?', ['27', '25', '26', '28'], 0, '30 − 3 = 27 pencils.'),
    Q('A shop has 31 pencils and sells 2. How many pencils remain?', ['27', '29', '28', '30'], 1, '31 − 2 = 29 pencils.'),
    Q('A shop has 32 pencils and sells 1. How many pencils remain?', ['29', '30', '31', '32'], 2, '32 − 1 = 31 pencils.'),
    Q('A shop has 33 pencils and sells 8. How many pencils remain?', ['23', '24', '26', '25'], 3, '33 − 8 = 25 pencils.'),
    Q('A shop has 34 pencils and sells 7. How many pencils remain?', ['27', '25', '26', '28'], 0, '34 − 7 = 27 pencils.'),
    Q('A shop has 35 pencils and sells 6. How many pencils remain?', ['27', '29', '28', '30'], 1, '35 − 6 = 29 pencils.'),
    Q('A shop has 36 pencils and sells 5. How many pencils remain?', ['29', '30', '31', '32'], 2, '36 − 5 = 31 pencils.'),
    Q('A shop has 37 pencils and sells 4. How many pencils remain?', ['31', '32', '34', '33'], 3, '37 − 4 = 33 pencils.'),
  ]),
  Chapter('Multiplication', Icons.close, [
    Q('What is 2 × 2?', ['4', '3', '5', '6'], 0, '2 groups of 2 make 4.'),
    Q('What is 2 × 3?', ['5', '6', '7', '8'], 1, '2 groups of 3 make 6.'),
    Q('What is 2 × 4?', ['7', '9', '8', '10'], 2, '2 groups of 4 make 8.'),
    Q('What is 2 × 5?', ['9', '11', '12', '10'], 3, '2 groups of 5 make 10.'),
    Q('What is 3 × 2?', ['6', '5', '7', '8'], 0, '3 groups of 2 make 6.'),
    Q('What is 3 × 3?', ['8', '9', '10', '11'], 1, '3 groups of 3 make 9.'),
    Q('What is 3 × 4?', ['11', '13', '12', '14'], 2, '3 groups of 4 make 12.'),
    Q('What is 3 × 5?', ['14', '16', '17', '15'], 3, '3 groups of 5 make 15.'),
    Q('What is 4 × 2?', ['8', '7', '9', '10'], 0, '4 groups of 2 make 8.'),
    Q('What is 4 × 3?', ['11', '12', '13', '14'], 1, '4 groups of 3 make 12.'),
    Q('What is 4 × 4?', ['15', '17', '16', '18'], 2, '4 groups of 4 make 16.'),
    Q('What is 4 × 5?', ['19', '21', '22', '20'], 3, '4 groups of 5 make 20.'),
    Q('What is 5 × 2?', ['10', '9', '11', '12'], 0, '5 groups of 2 make 10.'),
    Q('What is 5 × 3?', ['14', '15', '16', '17'], 1, '5 groups of 3 make 15.'),
    Q('What is 5 × 4?', ['19', '21', '20', '22'], 2, '5 groups of 4 make 20.'),
    Q('What is 5 × 5?', ['24', '26', '27', '25'], 3, '5 groups of 5 make 25.'),
    Q('What is 6 × 2?', ['12', '11', '13', '14'], 0, '6 groups of 2 make 12.'),
    Q('What is 6 × 3?', ['17', '18', '19', '20'], 1, '6 groups of 3 make 18.'),
    Q('What is 6 × 4?', ['23', '25', '24', '26'], 2, '6 groups of 4 make 24.'),
    Q('What is 6 × 5?', ['29', '31', '32', '30'], 3, '6 groups of 5 make 30.'),
    Q('What is 7 × 2?', ['14', '13', '15', '16'], 0, '7 groups of 2 make 14.'),
    Q('What is 7 × 3?', ['20', '21', '22', '23'], 1, '7 groups of 3 make 21.'),
    Q('What is 7 × 4?', ['27', '29', '28', '30'], 2, '7 groups of 4 make 28.'),
    Q('What is 7 × 5?', ['34', '36', '37', '35'], 3, '7 groups of 5 make 35.'),
    Q('What is 8 × 2?', ['16', '15', '17', '18'], 0, '8 groups of 2 make 16.'),
    Q('What is 8 × 3?', ['23', '24', '25', '26'], 1, '8 groups of 3 make 24.'),
    Q('What is 8 × 4?', ['31', '33', '32', '34'], 2, '8 groups of 4 make 32.'),
    Q('What is 8 × 5?', ['39', '41', '42', '40'], 3, '8 groups of 5 make 40.'),
    Q('What is 9 × 2?', ['18', '17', '19', '20'], 0, '9 groups of 2 make 18.'),
    Q('What is 9 × 3?', ['26', '27', '28', '29'], 1, '9 groups of 3 make 27.'),
    Q('What is 9 × 4?', ['35', '37', '36', '38'], 2, '9 groups of 4 make 36.'),
    Q('What is 9 × 5?', ['44', '46', '47', '45'], 3, '9 groups of 5 make 45.'),
    Q('There are 2 bags with 4 oranges in each. How many oranges are there?', ['8', '6', '7', '9'], 0, '2 × 4 = 8 oranges.'),
    Q('There are 3 bags with 5 oranges in each. How many oranges are there?', ['13', '15', '14', '16'], 1, '3 × 5 = 15 oranges.'),
    Q('There are 4 bags with 2 oranges in each. How many oranges are there?', ['6', '7', '8', '9'], 2, '4 × 2 = 8 oranges.'),
    Q('There are 5 bags with 3 oranges in each. How many oranges are there?', ['13', '14', '16', '15'], 3, '5 × 3 = 15 oranges.'),
    Q('There are 6 bags with 4 oranges in each. How many oranges are there?', ['24', '22', '23', '25'], 0, '6 × 4 = 24 oranges.'),
    Q('There are 7 bags with 5 oranges in each. How many oranges are there?', ['33', '35', '34', '36'], 1, '7 × 5 = 35 oranges.'),
    Q('There are 8 bags with 2 oranges in each. How many oranges are there?', ['14', '15', '16', '17'], 2, '8 × 2 = 16 oranges.'),
    Q('There are 9 bags with 3 oranges in each. How many oranges are there?', ['25', '26', '28', '27'], 3, '9 × 3 = 27 oranges.'),
    Q('How many wheels do 2 bicycles have altogether?', ['4', '3', '5', '6'], 0, 'Each bicycle has 2 wheels, so 2 × 2 = 4.'),
    Q('How many wheels do 3 bicycles have altogether?', ['5', '6', '7', '8'], 1, 'Each bicycle has 2 wheels, so 3 × 2 = 6.'),
    Q('How many wheels do 4 bicycles have altogether?', ['7', '9', '8', '10'], 2, 'Each bicycle has 2 wheels, so 4 × 2 = 8.'),
    Q('How many wheels do 5 bicycles have altogether?', ['9', '11', '12', '10'], 3, 'Each bicycle has 2 wheels, so 5 × 2 = 10.'),
    Q('How many wheels do 6 bicycles have altogether?', ['12', '11', '13', '14'], 0, 'Each bicycle has 2 wheels, so 6 × 2 = 12.'),
    Q('How many wheels do 7 bicycles have altogether?', ['13', '14', '15', '16'], 1, 'Each bicycle has 2 wheels, so 7 × 2 = 14.'),
    Q('How many wheels do 8 bicycles have altogether?', ['15', '17', '16', '18'], 2, 'Each bicycle has 2 wheels, so 8 × 2 = 16.'),
    Q('How many wheels do 9 bicycles have altogether?', ['17', '19', '20', '18'], 3, 'Each bicycle has 2 wheels, so 9 × 2 = 18.'),
    Q('What is 2 groups of 4?', ['8', '6', '7', '9'], 0, '2 × 4 = 8.'),
    Q('What is 3 groups of 2?', ['4', '6', '5', '7'], 1, '3 × 2 = 6.'),
    Q('What is 4 groups of 3?', ['10', '11', '12', '13'], 2, '4 × 3 = 12.'),
    Q('What is 5 groups of 4?', ['18', '19', '21', '20'], 3, '5 × 4 = 20.'),
    Q('What is 6 groups of 2?', ['12', '10', '11', '13'], 0, '6 × 2 = 12.'),
    Q('What is 7 groups of 3?', ['19', '21', '20', '22'], 1, '7 × 3 = 21.'),
    Q('What is 8 groups of 4?', ['30', '31', '32', '33'], 2, '8 × 4 = 32.'),
    Q('What is 9 groups of 2?', ['16', '17', '19', '18'], 3, '9 × 2 = 18.'),
    Q('What is 2 multiplied by 5?', ['10', '8', '9', '11'], 0, '2 × 5 = 10.'),
    Q('What is 3 multiplied by 6?', ['16', '18', '17', '19'], 1, '3 × 6 = 18.'),
    Q('What is 4 multiplied by 3?', ['10', '11', '12', '13'], 2, '4 × 3 = 12.'),
    Q('What is 5 multiplied by 4?', ['18', '19', '21', '20'], 3, '5 × 4 = 20.'),
    Q('What is 6 multiplied by 5?', ['30', '28', '29', '31'], 0, '6 × 5 = 30.'),
    Q('What is 7 multiplied by 6?', ['40', '42', '41', '43'], 1, '7 × 6 = 42.'),
    Q('What is 8 multiplied by 3?', ['22', '23', '24', '25'], 2, '8 × 3 = 24.'),
    Q('What is 9 multiplied by 4?', ['34', '35', '37', '36'], 3, '9 × 4 = 36.'),
    Q('A child puts 6 stickers on each of 2 pages. How many stickers are used?', ['12', '10', '11', '13'], 0, '2 × 6 = 12 stickers.'),
    Q('A child puts 4 stickers on each of 3 pages. How many stickers are used?', ['10', '12', '11', '13'], 1, '3 × 4 = 12 stickers.'),
    Q('A child puts 5 stickers on each of 4 pages. How many stickers are used?', ['18', '19', '20', '21'], 2, '4 × 5 = 20 stickers.'),
    Q('A child puts 6 stickers on each of 5 pages. How many stickers are used?', ['28', '29', '31', '30'], 3, '5 × 6 = 30 stickers.'),
    Q('A child puts 4 stickers on each of 6 pages. How many stickers are used?', ['24', '22', '23', '25'], 0, '6 × 4 = 24 stickers.'),
    Q('A child puts 5 stickers on each of 7 pages. How many stickers are used?', ['33', '35', '34', '36'], 1, '7 × 5 = 35 stickers.'),
    Q('A child puts 6 stickers on each of 8 pages. How many stickers are used?', ['46', '47', '48', '49'], 2, '8 × 6 = 48 stickers.'),
    Q('A child puts 4 stickers on each of 9 pages. How many stickers are used?', ['34', '35', '37', '36'], 3, '9 × 4 = 36 stickers.'),
  ]),
  Chapter('Shapes', Icons.category, [
    Q('How many sides does a triangle have?', ['3', '2', '4', '5'], 0, 'A triangle has 3 sides.'),
    Q('How many sides does a square have?', ['3', '4', '5', '6'], 1, 'A square has 4 sides.'),
    Q('How many corners does a rectangle have?', ['2', '3', '4', '5'], 2, 'A rectangle has 4 corners.'),
    Q('Which shape has no corners?', ['Triangle', 'Square', 'Rectangle', 'Circle'], 3, 'A circle has no corners.'),
    Q('Which shape has 3 corners?', ['Triangle', 'Circle', 'Square', 'Oval'], 0, 'A triangle has 3 corners.'),
    Q('Which shape has 4 equal sides?', ['Rectangle', 'Square', 'Circle', 'Triangle'], 1, 'A square has 4 equal sides.'),
    Q('Which solid shape is like a ball?', ['Cube', 'Cone', 'Sphere', 'Cylinder'], 2, 'A ball is shaped like a sphere.'),
    Q('Which solid shape is like a dice?', ['Sphere', 'Cone', 'Cylinder', 'Cube'], 3, 'A dice is shaped like a cube.'),
    Q('Which solid shape is like an ice-cream cone?', ['Cone', 'Cube', 'Sphere', 'Cylinder'], 0, 'An ice-cream cone has a cone shape.'),
    Q('Which object is shaped like a cylinder?', ['Ball', 'Tin can', 'Dice', 'Party hat'], 1, 'A tin can is shaped like a cylinder.'),
    Q('Which shape can roll easily?', ['Cube', 'Cuboid', 'Sphere', 'Square'], 2, 'A sphere is round and can roll.'),
    Q('Which shape has one curved edge and no corners?', ['Square', 'Triangle', 'Rectangle', 'Circle'], 3, 'A circle has one curved edge and no corners.'),
    Q('How many faces does a cube have?', ['6', '4', '5', '8'], 0, 'A cube has 6 flat faces.'),
    Q('How many edges does a cube have?', ['6', '12', '8', '10'], 1, 'A cube has 12 edges.'),
    Q('Which shape looks like a door?', ['Circle', 'Triangle', 'Rectangle', 'Oval'], 2, 'A door is usually rectangular.'),
    Q('How many sides does a triangle have? (Question 2)', ['2', '4', '5', '3'], 3, 'A triangle has 3 sides.'),
    Q('How many sides does a square have? (Question 2)', ['4', '3', '5', '6'], 0, 'A square has 4 sides.'),
    Q('How many corners does a rectangle have? (Question 2)', ['2', '4', '3', '5'], 1, 'A rectangle has 4 corners.'),
    Q('Can you identify which shape has no corners? (Question 2)', ['Triangle', 'Square', 'Circle', 'Rectangle'], 2, 'A circle has no corners.'),
    Q('Can you identify which shape has 3 corners? (Question 2)', ['Circle', 'Square', 'Oval', 'Triangle'], 3, 'A triangle has 3 corners.'),
    Q('Can you identify which shape has 4 equal sides? (Question 2)', ['Square', 'Rectangle', 'Circle', 'Triangle'], 0, 'A square has 4 equal sides.'),
    Q('Can you identify which solid shape is like a ball? (Question 2)', ['Cube', 'Sphere', 'Cone', 'Cylinder'], 1, 'A ball is shaped like a sphere.'),
    Q('Can you identify which solid shape is like a dice? (Question 2)', ['Sphere', 'Cone', 'Cube', 'Cylinder'], 2, 'A dice is shaped like a cube.'),
    Q('Can you identify which solid shape is like an ice-cream cone? (Question 2)', ['Cube', 'Sphere', 'Cylinder', 'Cone'], 3, 'An ice-cream cone has a cone shape.'),
    Q('Can you identify which object is shaped like a cylinder? (Question 2)', ['Tin can', 'Ball', 'Dice', 'Party hat'], 0, 'A tin can is shaped like a cylinder.'),
    Q('Can you identify which shape can roll easily? (Question 2)', ['Cube', 'Sphere', 'Cuboid', 'Square'], 1, 'A sphere is round and can roll.'),
    Q('Can you identify which shape has one curved edge and no corners? (Question 2)', ['Square', 'Triangle', 'Circle', 'Rectangle'], 2, 'A circle has one curved edge and no corners.'),
    Q('How many faces does a cube have? (Question 2)', ['4', '5', '8', '6'], 3, 'A cube has 6 flat faces.'),
    Q('How many edges does a cube have? (Question 2)', ['12', '6', '8', '10'], 0, 'A cube has 12 edges.'),
    Q('Can you identify which shape looks like a door? (Question 2)', ['Circle', 'Rectangle', 'Triangle', 'Oval'], 1, 'A door is usually rectangular.'),
    Q('How many sides does a triangle have? (Question 3)', ['2', '4', '3', '5'], 2, 'A triangle has 3 sides.'),
    Q('How many sides does a square have? (Question 3)', ['3', '5', '6', '4'], 3, 'A square has 4 sides.'),
    Q('How many corners does a rectangle have? (Question 3)', ['4', '2', '3', '5'], 0, 'A rectangle has 4 corners.'),
    Q('Can you identify which shape has no corners? (Question 3)', ['Triangle', 'Circle', 'Square', 'Rectangle'], 1, 'A circle has no corners.'),
    Q('Can you identify which shape has 3 corners? (Question 3)', ['Circle', 'Square', 'Triangle', 'Oval'], 2, 'A triangle has 3 corners.'),
    Q('Can you identify which shape has 4 equal sides? (Question 3)', ['Rectangle', 'Circle', 'Triangle', 'Square'], 3, 'A square has 4 equal sides.'),
    Q('Can you identify which solid shape is like a ball? (Question 3)', ['Sphere', 'Cube', 'Cone', 'Cylinder'], 0, 'A ball is shaped like a sphere.'),
    Q('Can you identify which solid shape is like a dice? (Question 3)', ['Sphere', 'Cube', 'Cone', 'Cylinder'], 1, 'A dice is shaped like a cube.'),
    Q('Can you identify which solid shape is like an ice-cream cone? (Question 3)', ['Cube', 'Sphere', 'Cone', 'Cylinder'], 2, 'An ice-cream cone has a cone shape.'),
    Q('Can you identify which object is shaped like a cylinder? (Question 3)', ['Ball', 'Dice', 'Party hat', 'Tin can'], 3, 'A tin can is shaped like a cylinder.'),
    Q('Can you identify which shape can roll easily? (Question 3)', ['Sphere', 'Cube', 'Cuboid', 'Square'], 0, 'A sphere is round and can roll.'),
    Q('Can you identify which shape has one curved edge and no corners? (Question 3)', ['Square', 'Circle', 'Triangle', 'Rectangle'], 1, 'A circle has one curved edge and no corners.'),
    Q('How many faces does a cube have? (Question 3)', ['4', '5', '6', '8'], 2, 'A cube has 6 flat faces.'),
    Q('How many edges does a cube have? (Question 3)', ['6', '8', '10', '12'], 3, 'A cube has 12 edges.'),
    Q('Can you identify which shape looks like a door? (Question 3)', ['Rectangle', 'Circle', 'Triangle', 'Oval'], 0, 'A door is usually rectangular.'),
    Q('How many sides does a triangle have? (Question 4)', ['2', '3', '4', '5'], 1, 'A triangle has 3 sides.'),
    Q('How many sides does a square have? (Question 4)', ['3', '5', '4', '6'], 2, 'A square has 4 sides.'),
    Q('How many corners does a rectangle have? (Question 4)', ['2', '3', '5', '4'], 3, 'A rectangle has 4 corners.'),
    Q('Can you identify which shape has no corners? (Question 4)', ['Circle', 'Triangle', 'Square', 'Rectangle'], 0, 'A circle has no corners.'),
    Q('Can you identify which shape has 3 corners? (Question 4)', ['Circle', 'Triangle', 'Square', 'Oval'], 1, 'A triangle has 3 corners.'),
    Q('Can you identify which shape has 4 equal sides? (Question 4)', ['Rectangle', 'Circle', 'Square', 'Triangle'], 2, 'A square has 4 equal sides.'),
    Q('Can you identify which solid shape is like a ball? (Question 4)', ['Cube', 'Cone', 'Cylinder', 'Sphere'], 3, 'A ball is shaped like a sphere.'),
    Q('Can you identify which solid shape is like a dice? (Question 4)', ['Cube', 'Sphere', 'Cone', 'Cylinder'], 0, 'A dice is shaped like a cube.'),
    Q('Can you identify which solid shape is like an ice-cream cone? (Question 4)', ['Cube', 'Cone', 'Sphere', 'Cylinder'], 1, 'An ice-cream cone has a cone shape.'),
    Q('Can you identify which object is shaped like a cylinder? (Question 4)', ['Ball', 'Dice', 'Tin can', 'Party hat'], 2, 'A tin can is shaped like a cylinder.'),
    Q('Can you identify which shape can roll easily? (Question 4)', ['Cube', 'Cuboid', 'Square', 'Sphere'], 3, 'A sphere is round and can roll.'),
    Q('Can you identify which shape has one curved edge and no corners? (Question 4)', ['Circle', 'Square', 'Triangle', 'Rectangle'], 0, 'A circle has one curved edge and no corners.'),
    Q('How many faces does a cube have? (Question 4)', ['4', '6', '5', '8'], 1, 'A cube has 6 flat faces.'),
    Q('How many edges does a cube have? (Question 4)', ['6', '8', '12', '10'], 2, 'A cube has 12 edges.'),
    Q('Can you identify which shape looks like a door? (Question 4)', ['Circle', 'Triangle', 'Oval', 'Rectangle'], 3, 'A door is usually rectangular.'),
    Q('How many sides does a triangle have? (Question 5)', ['3', '2', '4', '5'], 0, 'A triangle has 3 sides.'),
    Q('How many sides does a square have? (Question 5)', ['3', '4', '5', '6'], 1, 'A square has 4 sides.'),
    Q('How many corners does a rectangle have? (Question 5)', ['2', '3', '4', '5'], 2, 'A rectangle has 4 corners.'),
    Q('Can you identify which shape has no corners? (Question 5)', ['Triangle', 'Square', 'Rectangle', 'Circle'], 3, 'A circle has no corners.'),
    Q('Can you identify which shape has 3 corners? (Question 5)', ['Triangle', 'Circle', 'Square', 'Oval'], 0, 'A triangle has 3 corners.'),
    Q('Can you identify which shape has 4 equal sides? (Question 5)', ['Rectangle', 'Square', 'Circle', 'Triangle'], 1, 'A square has 4 equal sides.'),
    Q('Can you identify which solid shape is like a ball? (Question 5)', ['Cube', 'Cone', 'Sphere', 'Cylinder'], 2, 'A ball is shaped like a sphere.'),
    Q('Can you identify which solid shape is like a dice? (Question 5)', ['Sphere', 'Cone', 'Cylinder', 'Cube'], 3, 'A dice is shaped like a cube.'),
    Q('Can you identify which solid shape is like an ice-cream cone? (Question 5)', ['Cone', 'Cube', 'Sphere', 'Cylinder'], 0, 'An ice-cream cone has a cone shape.'),
    Q('Can you identify which object is shaped like a cylinder? (Question 5)', ['Ball', 'Tin can', 'Dice', 'Party hat'], 1, 'A tin can is shaped like a cylinder.'),
    Q('Can you identify which shape can roll easily? (Question 5)', ['Cube', 'Cuboid', 'Sphere', 'Square'], 2, 'A sphere is round and can roll.'),
  ]),
  Chapter('Measurement', Icons.straighten, [
    Q('Which unit is used to measure the length of a pencil?', ['Centimetres', 'Litres', 'Kilograms', 'Hours'], 0, 'Centimetres measure short lengths.'),
    Q('Which unit is used to measure the weight of a bag of rice?', ['Litres', 'Kilograms', 'Metres', 'Minutes'], 1, 'Kilograms measure weight.'),
    Q('Which unit is used to measure milk?', ['Metres', 'Centimetres', 'Litres', 'Hours'], 2, 'Litres measure liquids.'),
    Q('Which tool is used to measure length?', ['Clock', 'Cup', 'Scale for weighing', 'Ruler'], 3, 'A ruler measures length.'),
    Q('Which is heavier?', ['An elephant', 'A feather', 'A leaf', 'A paper clip'], 0, 'An elephant is much heavier.'),
    Q('Which is lighter?', ['A truck', 'A feather', 'A bus', 'A horse'], 1, 'A feather is very light.'),
    Q('Which is longer?', ['A pencil', 'An eraser', 'A bus', 'A spoon'], 2, 'A bus is longer than these objects.'),
    Q('Which is shorter than one metre?', ['2 metres', '3 metres', '150 centimetres', '50 centimetres'], 3, '50 centimetres is less than 100 centimetres.'),
    Q('How many centimetres are in one metre?', ['100', '10', '50', '1000'], 0, '1 metre equals 100 centimetres.'),
    Q('Which can hold the most water?', ['A spoon', 'A bucket', 'A cup', 'A bottle cap'], 1, 'A bucket holds more water.'),
    Q('Which is taller?', ['A cup', 'A shoe', 'A tree', 'A pencil'], 2, 'A tree is taller than these objects.'),
    Q('What do we use to compare the weight of two objects?', ['A clock', 'A ruler', 'A calendar', 'A weighing scale'], 3, 'A weighing scale compares weight.'),
    Q('Which is usually measured in litres?', ['Water in a bottle', 'Length of a table', 'Weight of a child', 'Time in a day'], 0, 'Litres measure liquid capacity.'),
    Q('Which is longer: 1 metre or 80 centimetres?', ['80 centimetres', '1 metre', 'They are equal', 'Cannot compare'], 1, '1 metre is 100 centimetres, which is longer than 80 centimetres.'),
    Q('Which is heavier: 2 kg or 1 kg?', ['1 kg', 'They are equal', '2 kg', 'Neither'], 2, '2 kilograms is heavier than 1 kilogram.'),
    Q('Which unit is used to measure the length of a pencil? (Practice example 2)', ['Litres', 'Kilograms', 'Hours', 'Centimetres'], 3, 'Centimetres measure short lengths.'),
    Q('Which unit is used to measure the weight of a bag of rice? (Practice example 2)', ['Kilograms', 'Litres', 'Metres', 'Minutes'], 0, 'Kilograms measure weight.'),
    Q('Which unit is used to measure milk? (Practice example 2)', ['Metres', 'Litres', 'Centimetres', 'Hours'], 1, 'Litres measure liquids.'),
    Q('Which tool is used to measure length? (Practice example 2)', ['Clock', 'Cup', 'Ruler', 'Scale for weighing'], 2, 'A ruler measures length.'),
    Q('Which is heavier? (Practice example 2)', ['A feather', 'A leaf', 'A paper clip', 'An elephant'], 3, 'An elephant is much heavier.'),
    Q('Which is lighter? (Practice example 2)', ['A feather', 'A truck', 'A bus', 'A horse'], 0, 'A feather is very light.'),
    Q('Which is longer? (Practice example 2)', ['A pencil', 'A bus', 'An eraser', 'A spoon'], 1, 'A bus is longer than these objects.'),
    Q('Which is shorter than one metre? (Practice example 2)', ['2 metres', '3 metres', '50 centimetres', '150 centimetres'], 2, '50 centimetres is less than 100 centimetres.'),
    Q('How many centimetres are in one metre? (Practice example 2)', ['10', '50', '1000', '100'], 3, '1 metre equals 100 centimetres.'),
    Q('Which can hold the most water? (Practice example 2)', ['A bucket', 'A spoon', 'A cup', 'A bottle cap'], 0, 'A bucket holds more water.'),
    Q('Which is taller? (Practice example 2)', ['A cup', 'A tree', 'A shoe', 'A pencil'], 1, 'A tree is taller than these objects.'),
    Q('What do we use to compare the weight of two objects? (Practice example 2)', ['A clock', 'A ruler', 'A weighing scale', 'A calendar'], 2, 'A weighing scale compares weight.'),
    Q('Which is usually measured in litres? (Practice example 2)', ['Length of a table', 'Weight of a child', 'Time in a day', 'Water in a bottle'], 3, 'Litres measure liquid capacity.'),
    Q('Which is longer: 1 metre or 80 centimetres? (Practice example 2)', ['1 metre', '80 centimetres', 'They are equal', 'Cannot compare'], 0, '1 metre is 100 centimetres, which is longer than 80 centimetres.'),
    Q('Which is heavier: 2 kg or 1 kg? (Practice example 2)', ['1 kg', '2 kg', 'They are equal', 'Neither'], 1, '2 kilograms is heavier than 1 kilogram.'),
    Q('Which unit is used to measure the length of a pencil? (Practice example 3)', ['Litres', 'Kilograms', 'Centimetres', 'Hours'], 2, 'Centimetres measure short lengths.'),
    Q('Which unit is used to measure the weight of a bag of rice? (Practice example 3)', ['Litres', 'Metres', 'Minutes', 'Kilograms'], 3, 'Kilograms measure weight.'),
    Q('Which unit is used to measure milk? (Practice example 3)', ['Litres', 'Metres', 'Centimetres', 'Hours'], 0, 'Litres measure liquids.'),
    Q('Which tool is used to measure length? (Practice example 3)', ['Clock', 'Ruler', 'Cup', 'Scale for weighing'], 1, 'A ruler measures length.'),
    Q('Which is heavier? (Practice example 3)', ['A feather', 'A leaf', 'An elephant', 'A paper clip'], 2, 'An elephant is much heavier.'),
    Q('Which is lighter? (Practice example 3)', ['A truck', 'A bus', 'A horse', 'A feather'], 3, 'A feather is very light.'),
    Q('Which is longer? (Practice example 3)', ['A bus', 'A pencil', 'An eraser', 'A spoon'], 0, 'A bus is longer than these objects.'),
    Q('Which is shorter than one metre? (Practice example 3)', ['2 metres', '50 centimetres', '3 metres', '150 centimetres'], 1, '50 centimetres is less than 100 centimetres.'),
    Q('How many centimetres are in one metre? (Practice example 3)', ['10', '50', '100', '1000'], 2, '1 metre equals 100 centimetres.'),
    Q('Which can hold the most water? (Practice example 3)', ['A spoon', 'A cup', 'A bottle cap', 'A bucket'], 3, 'A bucket holds more water.'),
    Q('Which is taller? (Practice example 3)', ['A tree', 'A cup', 'A shoe', 'A pencil'], 0, 'A tree is taller than these objects.'),
    Q('What do we use to compare the weight of two objects? (Practice example 3)', ['A clock', 'A weighing scale', 'A ruler', 'A calendar'], 1, 'A weighing scale compares weight.'),
    Q('Which is usually measured in litres? (Practice example 3)', ['Length of a table', 'Weight of a child', 'Water in a bottle', 'Time in a day'], 2, 'Litres measure liquid capacity.'),
    Q('Which is longer: 1 metre or 80 centimetres? (Practice example 3)', ['80 centimetres', 'They are equal', 'Cannot compare', '1 metre'], 3, '1 metre is 100 centimetres, which is longer than 80 centimetres.'),
    Q('Which is heavier: 2 kg or 1 kg? (Practice example 3)', ['2 kg', '1 kg', 'They are equal', 'Neither'], 0, '2 kilograms is heavier than 1 kilogram.'),
    Q('Which unit is used to measure the length of a pencil? (Practice example 4)', ['Litres', 'Centimetres', 'Kilograms', 'Hours'], 1, 'Centimetres measure short lengths.'),
    Q('Which unit is used to measure the weight of a bag of rice? (Practice example 4)', ['Litres', 'Metres', 'Kilograms', 'Minutes'], 2, 'Kilograms measure weight.'),
    Q('Which unit is used to measure milk? (Practice example 4)', ['Metres', 'Centimetres', 'Hours', 'Litres'], 3, 'Litres measure liquids.'),
    Q('Which tool is used to measure length? (Practice example 4)', ['Ruler', 'Clock', 'Cup', 'Scale for weighing'], 0, 'A ruler measures length.'),
    Q('Which is heavier? (Practice example 4)', ['A feather', 'An elephant', 'A leaf', 'A paper clip'], 1, 'An elephant is much heavier.'),
    Q('Which is lighter? (Practice example 4)', ['A truck', 'A bus', 'A feather', 'A horse'], 2, 'A feather is very light.'),
    Q('Which is longer? (Practice example 4)', ['A pencil', 'An eraser', 'A spoon', 'A bus'], 3, 'A bus is longer than these objects.'),
    Q('Which is shorter than one metre? (Practice example 4)', ['50 centimetres', '2 metres', '3 metres', '150 centimetres'], 0, '50 centimetres is less than 100 centimetres.'),
    Q('How many centimetres are in one metre? (Practice example 4)', ['10', '100', '50', '1000'], 1, '1 metre equals 100 centimetres.'),
    Q('Which can hold the most water? (Practice example 4)', ['A spoon', 'A cup', 'A bucket', 'A bottle cap'], 2, 'A bucket holds more water.'),
    Q('Which is taller? (Practice example 4)', ['A cup', 'A shoe', 'A pencil', 'A tree'], 3, 'A tree is taller than these objects.'),
    Q('What do we use to compare the weight of two objects? (Practice example 4)', ['A weighing scale', 'A clock', 'A ruler', 'A calendar'], 0, 'A weighing scale compares weight.'),
    Q('Which is usually measured in litres? (Practice example 4)', ['Length of a table', 'Water in a bottle', 'Weight of a child', 'Time in a day'], 1, 'Litres measure liquid capacity.'),
    Q('Which is longer: 1 metre or 80 centimetres? (Practice example 4)', ['80 centimetres', 'They are equal', '1 metre', 'Cannot compare'], 2, '1 metre is 100 centimetres, which is longer than 80 centimetres.'),
    Q('Which is heavier: 2 kg or 1 kg? (Practice example 4)', ['1 kg', 'They are equal', 'Neither', '2 kg'], 3, '2 kilograms is heavier than 1 kilogram.'),
    Q('Which unit is used to measure the length of a pencil? (Practice example 5)', ['Centimetres', 'Litres', 'Kilograms', 'Hours'], 0, 'Centimetres measure short lengths.'),
    Q('Which unit is used to measure the weight of a bag of rice? (Practice example 5)', ['Litres', 'Kilograms', 'Metres', 'Minutes'], 1, 'Kilograms measure weight.'),
    Q('Which unit is used to measure milk? (Practice example 5)', ['Metres', 'Centimetres', 'Litres', 'Hours'], 2, 'Litres measure liquids.'),
    Q('Which tool is used to measure length? (Practice example 5)', ['Clock', 'Cup', 'Scale for weighing', 'Ruler'], 3, 'A ruler measures length.'),
    Q('Which is heavier? (Practice example 5)', ['An elephant', 'A feather', 'A leaf', 'A paper clip'], 0, 'An elephant is much heavier.'),
    Q('Which is lighter? (Practice example 5)', ['A truck', 'A feather', 'A bus', 'A horse'], 1, 'A feather is very light.'),
    Q('Which is longer? (Practice example 5)', ['A pencil', 'An eraser', 'A bus', 'A spoon'], 2, 'A bus is longer than these objects.'),
    Q('Which is shorter than one metre? (Practice example 5)', ['2 metres', '3 metres', '150 centimetres', '50 centimetres'], 3, '50 centimetres is less than 100 centimetres.'),
    Q('How many centimetres are in one metre? (Practice example 5)', ['100', '10', '50', '1000'], 0, '1 metre equals 100 centimetres.'),
    Q('Which can hold the most water? (Practice example 5)', ['A spoon', 'A bucket', 'A cup', 'A bottle cap'], 1, 'A bucket holds more water.'),
    Q('Which is taller? (Practice example 5)', ['A cup', 'A shoe', 'A tree', 'A pencil'], 2, 'A tree is taller than these objects.'),
  ]),
  Chapter('Time and Money', Icons.access_time, [
    Q('How many days are in a week?', ['7', '5', '6', '8'], 0, 'There are 7 days in a week.'),
    Q('How many months are in a year?', ['10', '12', '11', '13'], 1, 'There are 12 months in a year.'),
    Q('How many hours are in one day?', ['12', '18', '24', '30'], 2, 'There are 24 hours in a day.'),
    Q('How many minutes are in one hour?', ['30', '45', '100', '60'], 3, 'One hour has 60 minutes.'),
    Q('Which day comes after Monday?', ['Tuesday', 'Sunday', 'Friday', 'Saturday'], 0, 'Tuesday comes after Monday.'),
    Q('Which month comes after March?', ['May', 'April', 'June', 'February'], 1, 'April comes after March.'),
    Q('Which month has 28 or 29 days?', ['January', 'March', 'February', 'April'], 2, 'February has 28 days, or 29 in a leap year.'),
    Q('What time is half past 2?', ['2:00', '2:15', '3:00', '2:30'], 3, 'Half an hour after 2 is 2:30.'),
    Q('At 4 o’clock, where does the hour hand point?', ['4', '12', '6', '9'], 0, 'At 4 o’clock, the hour hand points to 4.'),
    Q('Which note has the greatest value?', ['₹5', '₹50', '₹10', '₹20'], 1, '₹50 is the greatest value listed.'),
    Q('You have ₹10 and spend ₹4. How much is left?', ['₹4', '₹5', '₹6', '₹7'], 2, '₹10 − ₹4 = ₹6.'),
    Q('A toy costs ₹10. You pay ₹20. What change do you get?', ['₹5', '₹15', '₹20', '₹10'], 3, '₹20 − ₹10 = ₹10.'),
    Q('How many days are in a weekend?', ['2', '1', '3', '4'], 0, 'Saturday and Sunday make 2 weekend days.'),
    Q('Which coin is worth five rupees?', ['₹1', '₹5', '₹2', '₹10'], 1, 'A ₹5 coin is worth five rupees.'),
    Q('What time is one hour after 6 o’clock?', ['5:00', '6:30', '7:00', '8:00'], 2, 'One hour after 6:00 is 7:00.'),
    Q('How many days are in a week? (Question set 2)', ['5', '6', '8', '7'], 3, 'There are 7 days in a week.'),
    Q('How many months are in a year? (Question set 2)', ['12', '10', '11', '13'], 0, 'There are 12 months in a year.'),
    Q('How many hours are in one day? (Question set 2)', ['12', '24', '18', '30'], 1, 'There are 24 hours in a day.'),
    Q('How many minutes are in one hour? (Question set 2)', ['30', '45', '60', '100'], 2, 'One hour has 60 minutes.'),
    Q('Which day comes after Monday? (Question set 2)', ['Sunday', 'Friday', 'Saturday', 'Tuesday'], 3, 'Tuesday comes after Monday.'),
    Q('Which month comes after March? (Question set 2)', ['April', 'May', 'June', 'February'], 0, 'April comes after March.'),
    Q('Which month has 28 or 29 days? (Question set 2)', ['January', 'February', 'March', 'April'], 1, 'February has 28 days, or 29 in a leap year.'),
    Q('What time is half past 2? (Question set 2)', ['2:00', '2:15', '2:30', '3:00'], 2, 'Half an hour after 2 is 2:30.'),
    Q('At 4 o’clock, where does the hour hand point? (Question set 2)', ['12', '6', '9', '4'], 3, 'At 4 o’clock, the hour hand points to 4.'),
    Q('Which note has the greatest value? (Question set 2)', ['₹50', '₹5', '₹10', '₹20'], 0, '₹50 is the greatest value listed.'),
    Q('You have ₹10 and spend ₹4. How much is left? (Question set 2)', ['₹4', '₹6', '₹5', '₹7'], 1, '₹10 − ₹4 = ₹6.'),
    Q('A toy costs ₹10. You pay ₹20. What change do you get? (Question set 2)', ['₹5', '₹15', '₹10', '₹20'], 2, '₹20 − ₹10 = ₹10.'),
    Q('How many days are in a weekend? (Question set 2)', ['1', '3', '4', '2'], 3, 'Saturday and Sunday make 2 weekend days.'),
    Q('Which coin is worth five rupees? (Question set 2)', ['₹5', '₹1', '₹2', '₹10'], 0, 'A ₹5 coin is worth five rupees.'),
    Q('What time is one hour after 6 o’clock? (Question set 2)', ['5:00', '7:00', '6:30', '8:00'], 1, 'One hour after 6:00 is 7:00.'),
    Q('How many days are in a week? (Question set 3)', ['5', '6', '7', '8'], 2, 'There are 7 days in a week.'),
    Q('How many months are in a year? (Question set 3)', ['10', '11', '13', '12'], 3, 'There are 12 months in a year.'),
    Q('How many hours are in one day? (Question set 3)', ['24', '12', '18', '30'], 0, 'There are 24 hours in a day.'),
    Q('How many minutes are in one hour? (Question set 3)', ['30', '60', '45', '100'], 1, 'One hour has 60 minutes.'),
    Q('Which day comes after Monday? (Question set 3)', ['Sunday', 'Friday', 'Tuesday', 'Saturday'], 2, 'Tuesday comes after Monday.'),
    Q('Which month comes after March? (Question set 3)', ['May', 'June', 'February', 'April'], 3, 'April comes after March.'),
    Q('Which month has 28 or 29 days? (Question set 3)', ['February', 'January', 'March', 'April'], 0, 'February has 28 days, or 29 in a leap year.'),
    Q('What time is half past 2? (Question set 3)', ['2:00', '2:30', '2:15', '3:00'], 1, 'Half an hour after 2 is 2:30.'),
    Q('At 4 o’clock, where does the hour hand point? (Question set 3)', ['12', '6', '4', '9'], 2, 'At 4 o’clock, the hour hand points to 4.'),
    Q('Which note has the greatest value? (Question set 3)', ['₹5', '₹10', '₹20', '₹50'], 3, '₹50 is the greatest value listed.'),
    Q('You have ₹10 and spend ₹4. How much is left? (Question set 3)', ['₹6', '₹4', '₹5', '₹7'], 0, '₹10 − ₹4 = ₹6.'),
    Q('A toy costs ₹10. You pay ₹20. What change do you get? (Question set 3)', ['₹5', '₹10', '₹15', '₹20'], 1, '₹20 − ₹10 = ₹10.'),
    Q('How many days are in a weekend? (Question set 3)', ['1', '3', '2', '4'], 2, 'Saturday and Sunday make 2 weekend days.'),
    Q('Which coin is worth five rupees? (Question set 3)', ['₹1', '₹2', '₹10', '₹5'], 3, 'A ₹5 coin is worth five rupees.'),
    Q('What time is one hour after 6 o’clock? (Question set 3)', ['7:00', '5:00', '6:30', '8:00'], 0, 'One hour after 6:00 is 7:00.'),
    Q('How many days are in a week? (Question set 4)', ['5', '7', '6', '8'], 1, 'There are 7 days in a week.'),
    Q('How many months are in a year? (Question set 4)', ['10', '11', '12', '13'], 2, 'There are 12 months in a year.'),
    Q('How many hours are in one day? (Question set 4)', ['12', '18', '30', '24'], 3, 'There are 24 hours in a day.'),
    Q('How many minutes are in one hour? (Question set 4)', ['60', '30', '45', '100'], 0, 'One hour has 60 minutes.'),
    Q('Which day comes after Monday? (Question set 4)', ['Sunday', 'Tuesday', 'Friday', 'Saturday'], 1, 'Tuesday comes after Monday.'),
    Q('Which month comes after March? (Question set 4)', ['May', 'June', 'April', 'February'], 2, 'April comes after March.'),
    Q('Which month has 28 or 29 days? (Question set 4)', ['January', 'March', 'April', 'February'], 3, 'February has 28 days, or 29 in a leap year.'),
    Q('What time is half past 2? (Question set 4)', ['2:30', '2:00', '2:15', '3:00'], 0, 'Half an hour after 2 is 2:30.'),
    Q('At 4 o’clock, where does the hour hand point? (Question set 4)', ['12', '4', '6', '9'], 1, 'At 4 o’clock, the hour hand points to 4.'),
    Q('Which note has the greatest value? (Question set 4)', ['₹5', '₹10', '₹50', '₹20'], 2, '₹50 is the greatest value listed.'),
    Q('You have ₹10 and spend ₹4. How much is left? (Question set 4)', ['₹4', '₹5', '₹7', '₹6'], 3, '₹10 − ₹4 = ₹6.'),
    Q('A toy costs ₹10. You pay ₹20. What change do you get? (Question set 4)', ['₹10', '₹5', '₹15', '₹20'], 0, '₹20 − ₹10 = ₹10.'),
    Q('How many days are in a weekend? (Question set 4)', ['1', '2', '3', '4'], 1, 'Saturday and Sunday make 2 weekend days.'),
    Q('Which coin is worth five rupees? (Question set 4)', ['₹1', '₹2', '₹5', '₹10'], 2, 'A ₹5 coin is worth five rupees.'),
    Q('What time is one hour after 6 o’clock? (Question set 4)', ['5:00', '6:30', '8:00', '7:00'], 3, 'One hour after 6:00 is 7:00.'),
    Q('How many days are in a week? (Question set 5)', ['7', '5', '6', '8'], 0, 'There are 7 days in a week.'),
    Q('How many months are in a year? (Question set 5)', ['10', '12', '11', '13'], 1, 'There are 12 months in a year.'),
    Q('How many hours are in one day? (Question set 5)', ['12', '18', '24', '30'], 2, 'There are 24 hours in a day.'),
    Q('How many minutes are in one hour? (Question set 5)', ['30', '45', '100', '60'], 3, 'One hour has 60 minutes.'),
    Q('Which day comes after Monday? (Question set 5)', ['Tuesday', 'Sunday', 'Friday', 'Saturday'], 0, 'Tuesday comes after Monday.'),
    Q('Which month comes after March? (Question set 5)', ['May', 'April', 'June', 'February'], 1, 'April comes after March.'),
    Q('Which month has 28 or 29 days? (Question set 5)', ['January', 'March', 'February', 'April'], 2, 'February has 28 days, or 29 in a leap year.'),
    Q('What time is half past 2? (Question set 5)', ['2:00', '2:15', '3:00', '2:30'], 3, 'Half an hour after 2 is 2:30.'),
    Q('At 4 o’clock, where does the hour hand point? (Question set 5)', ['4', '12', '6', '9'], 0, 'At 4 o’clock, the hour hand points to 4.'),
    Q('Which note has the greatest value? (Question set 5)', ['₹5', '₹50', '₹10', '₹20'], 1, '₹50 is the greatest value listed.'),
  ]),
];


// The complete bank contains exactly 10,000 questions across Classes 1–12.
// Class 2's original 500 questions are retained and supplemented to its target.
const _chapterNames = <String>[
  'Number Sense', 'Addition', 'Subtraction', 'Multiplication',
  'Fractions', 'Geometry', 'Measurement & Patterns'
];
const _chapterIcons = <IconData>[
  Icons.numbers, Icons.add, Icons.remove, Icons.close,
  Icons.pie_chart_outline, Icons.category, Icons.straighten
];

int _targetForClass(int grade) => grade <= 4 ? 834 : 833;

Q _generatedQuestion(int grade, int chapter, int serial) {
  final int level = grade + 1;
  final int a = 10 + ((serial * 7 + grade * 13 + chapter * 3) % (level * 19));
  final int b = 2 + ((serial * 5 + grade * 3 + chapter) % (level * 9));
  late String prompt;
  late String explanation;
  late int answer;
  switch (chapter) {
    case 0:
      final int value = a * (grade >= 4 ? 10 : 1);
      prompt = 'What number comes after $value?';
      answer = value + 1;
      explanation = 'The next whole number is one more: $value + 1 = $answer.';
      break;
    case 1:
      answer = a + b;
      prompt = 'What is $a + $b?';
      explanation = '$a + $b = $answer.';
      break;
    case 2:
      final int larger = a + b;
      answer = larger - b;
      prompt = 'What is $larger − $b?';
      explanation = '$larger − $b = $answer.';
      break;
    case 3:
      final int x = 2 + (a % (grade + 5));
      final int y = 2 + (b % (grade + 4));
      answer = x * y;
      prompt = 'What is $x × $y?';
      explanation = '$x groups of $y make $answer.';
      break;
    case 4:
      final int denominator = 2 + (serial % 5);
      final int whole = denominator * (2 + (b % 12));
      answer = whole ~/ denominator;
      prompt = 'What is 1/$denominator of $whole?';
      explanation = '$whole ÷ $denominator = $answer.';
      break;
    case 5:
      final int length = 3 + (a % (grade + 8));
      final int width = 2 + (b % (grade + 6));
      answer = 2 * (length + width);
      prompt = 'A rectangle is $length units long and $width units wide. What is its perimeter?';
      explanation = 'Perimeter = 2 × (length + width) = 2 × ($length + $width) = $answer units.';
      break;
    default:
      if (serial % 2 == 0) {
        answer = a * 10;
        prompt = 'Convert $a centimetres into millimetres.';
        explanation = '1 centimetre = 10 millimetres, so $a cm = $answer mm.';
      } else {
        final int start = a;
        final int step = 2 + (b % 9);
        answer = start + 4 * step;
        prompt = 'Find the next number: $start, ${start + step}, ${start + 2 * step}, ${start + 3 * step}, ?';
        explanation = 'The pattern adds $step each time, so the next number is $answer.';
      }
  }
  // Four distinct choices; rotate the correct answer's position.
  final int correct = serial % 4;
  final List<int> values = List<int>.generate(4, (i) => answer + i - correct);
  return Q(prompt, values.map((v) => v.toString()).toList(), correct, explanation);
}

List<Chapter> chaptersForClass(int grade) {
  const int target = 834;

  final List<List<Q>> grouped =
      List.generate(7, (_) => <Q>[]);

  // Keep your existing Class 2 questions.
  if (grade == 2) {
    for (int i = 0; i < 7; i++) {
      grouped[i].addAll(class2Chapters[i].questions);
    }
  }

  final List<Map<String, dynamic>> imported =
      questionData[grade] ?? [];

  int serial = 0;

  for (final item in imported) {
    final int total = grouped.fold(
      0,
      (sum, chapter) => sum + chapter.length,
    );

    if (total >= target) break;

    final String topic =
        (item['topic'] ?? '').toString().toLowerCase();

    int chapterIndex;

    if (topic.contains('addition')) {
      chapterIndex = 1;
    } else if (topic.contains('subtraction')) {
      chapterIndex = 2;
    } else if (topic.contains('multiplication')) {
      chapterIndex = 3;
    } else if (topic.contains('fraction') ||
        topic.contains('percent')) {
      chapterIndex = 4;
    } else if (topic.contains('geometry') ||
        topic.contains('algebra') ||
        topic.contains('polynomial')) {
      chapterIndex = 5;
    } else if (topic.contains('measurement') ||
        topic.contains('mensuration') ||
        topic.contains('data')) {
      chapterIndex = 6;
    } else {
      chapterIndex = serial % 7;
    }

    grouped[chapterIndex].add(
      Q(
        item['question'].toString(),
        List<String>.from(item['options']),
        item['answerIndex'] as int,
        item['explanation'].toString(),
      ),
    );

    serial++;
  }

  return List<Chapter>.generate(
    7,
    (i) => Chapter(
      _chapterNames[i],
      _chapterIcons[i],
      grouped[i],
    ),
  );
}
  final int target = _targetForClass(grade);
  final int each = target ~/ 7;
  final int remainder = target % 7;
  final List<Chapter> result = [];
  for (int c = 0; c < 7; c++) {
    final int wanted = each + (c < remainder ? 1 : 0);
    final List<Q> questions = <Q>[];
    if (grade == 2) questions.addAll(class2Chapters[c].questions);
    int serial = 0;
    while (questions.length < wanted) {
      questions.add(_generatedQuestion(grade, c, serial++));
    }
    result.add(Chapter(_chapterNames[c], _chapterIcons[c], questions));
  }
  return result;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tab = 0, answered = 0, correct = 0;
  int schoolClass = 2;
  List<Chapter> get currentChapters => chaptersForClass(schoolClass);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('QUESTION BANK', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1)),
        Text('Learn • Practise • Succeed', style: TextStyle(fontSize: 11)),
      ]),
    ),
    body: IndexedStack(index: tab, children: [_home(), _chapters(), _results(), _account()]),
    bottomNavigationBar: NavigationBar(
      selectedIndex: tab,
      onDestinationSelected: (v) => setState(() => tab = v),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.menu_book_outlined), label: 'Chapters'),
        NavigationDestination(icon: Icon(Icons.emoji_events_outlined), label: 'Results'),
        NavigationDestination(icon: Icon(Icons.person_outline), label: 'Account'),
      ],
    ),
  );

  Widget _picker() => Card(child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14),
    child: Row(children: [
      const Icon(Icons.school),
      const SizedBox(width: 12),
      const Expanded(child: Text('Select your class')),
      DropdownButton<int>(
        value: schoolClass,
        items: List.generate(12, (i) => DropdownMenuItem(value: i + 1, child: Text('Class ${i + 1}'))),
        onChanged: (v) => setState(() => schoolClass = v ?? 2),
      ),
    ]),
  ));

  Widget _home() => ListView(padding: const EdgeInsets.all(16), children: [
    Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(colors: [Color(0xFF172554), Color(0xFF3157C8)]),
      ),
      child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Welcome to QUESTION BANK!', style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('Build strong Maths skills, one chapter at a time.', style: TextStyle(color: Colors.white70)),
      ]),
    ),
    const SizedBox(height: 16),
    _picker(),
    const SizedBox(height: 14),
    const Text('Mathematics', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
    Card(child: ListTile(
      leading: const CircleAvatar(child: Icon(Icons.calculate)),
      title: const Text('Maths learning'),
      subtitle: Text('${currentChapters.fold<int>(0, (sum, c) => sum + c.questions.length)} questions across 7 chapters'),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () => setState(() => tab = 1),
    )),
    const SizedBox(height: 12),
    Row(children: [
      Expanded(child: _stat('Answered', answered.toString(), Icons.quiz_outlined)),
      const SizedBox(width: 10),
      Expanded(child: _stat('Correct', correct.toString(), Icons.check_circle_outline)),
    ]),
    const SizedBox(height: 18),
    FilledButton.icon(onPressed: () => setState(() => tab = 1), icon: const Icon(Icons.play_arrow), label: const Text('Explore chapters')),
  ]);

  Widget _stat(String label, String value, IconData icon) => Card(child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(children: [Icon(icon), Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), Text(label)]),
  ));

  Widget _chapters() => ListView(padding: const EdgeInsets.all(16), children: [
    _picker(),
    const SizedBox(height: 14),
    Text('Class $schoolClass • Mathematics', style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
    ...currentChapters.map((c) => Card(
      child: ListTile(
        leading: CircleAvatar(child: Icon(c.icon)),
        title: Text(c.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text('Practice and chapter test'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChapterPage(
          chapter: c,
          onDone: (a, b) => setState(() { answered += a; correct += b; }),
        ))),
      ),
    )),
  ]);

  Widget _results() => Center(child: Card(
    margin: const EdgeInsets.all(20),
    child: Padding(padding: const EdgeInsets.all(24), child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.emoji_events, size: 55, color: Colors.amber),
        const Text('Your results', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Text('$correct / $answered correct', style: const TextStyle(fontSize: 26)),
        Text(answered == 0 ? 'Complete a practice session or test to see your progress.' : 'Keep practising to improve!'),
      ],
    )),
  ));

  Widget _account() => const Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
    CircleAvatar(radius: 36, child: Icon(Icons.person, size: 40)),
    SizedBox(height: 10),
    Text('Student Account', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
    Text('Premium features coming soon'),
    SizedBox(height: 8),
    Text('About QUESTION BANK'),
  ]));
}

class ChapterPage extends StatelessWidget {
  final Chapter chapter;
  final void Function(int, int) onDone;
  const ChapterPage({super.key, required this.chapter, required this.onDone});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(chapter.name)),
    body: Padding(padding: const EdgeInsets.all(18), child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 25),
        Icon(chapter.icon, size: 58),
        const SizedBox(height: 12),
        Text(chapter.name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text('${chapter.questions.length} questions', textAlign: TextAlign.center),
        const SizedBox(height: 25),
        Card(child: ListTile(
          leading: const Icon(Icons.lightbulb_outline),
          title: const Text('Practice mode'),
          subtitle: const Text('See the answer and explanation after each question.'),
          onTap: () => _start(context, false),
        )),
        Card(child: ListTile(
          leading: const Icon(Icons.assignment_outlined),
          title: const Text('Chapter test'),
          subtitle: const Text('Get your final score at the end.'),
          onTap: () => _start(context, true),
        )),
      ],
    )),
  );

  void _start(BuildContext context, bool test) => Navigator.push(context, MaterialPageRoute(
    builder: (_) => QuizPage(chapter: chapter, test: test, onDone: onDone),
  ));
}

class QuizPage extends StatefulWidget {
  final Chapter chapter;
  final bool test;
  final void Function(int, int) onDone;
  const QuizPage({super.key, required this.chapter, required this.test, required this.onDone});
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = 0, score = 0;
  int? selected;
  bool checked = false;
  Q get q => widget.chapter.questions[index];

  void choose(int n) {
    if (checked) return;
    setState(() { selected = n; if (!widget.test) checked = true; });
  }

  void next() {
    if (selected == null) return;
    if (selected == q.answer) score++;
    if (index == widget.chapter.questions.length - 1) {
      widget.onDone(widget.chapter.questions.length, score);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>
        ScorePage(score: score, total: widget.chapter.questions.length, test: widget.test)));
    } else {
      setState(() { index++; selected = null; checked = false; });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(widget.test ? 'Chapter Test' : 'Practice')),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      LinearProgressIndicator(value: (index + 1) / widget.chapter.questions.length),
      const SizedBox(height: 12),
      Text('Question ${index + 1} of ${widget.chapter.questions.length}'),
      const SizedBox(height: 14),
      Text(q.text, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      const SizedBox(height: 16),
      ...q.options.asMap().entries.map((e) {
        final right = e.key == q.answer;
        final chosen = e.key == selected;
        Color? bg;
        if (checked && !widget.test && right) bg = Colors.green.shade100;
        if (checked && !widget.test && chosen && !right) bg = Colors.red.shade100;
        return Card(color: bg, child: ListTile(
          leading: CircleAvatar(child: Text(String.fromCharCode(65 + e.key))),
          title: Text(e.value),
          trailing: chosen ? const Icon(Icons.check_circle) : null,
          onTap: () => choose(e.key),
        ));
      }),
      if (checked && !widget.test) Card(
        color: Colors.blue.shade50,
        child: Padding(padding: const EdgeInsets.all(14), child: Text(
          '${selected == q.answer ? 'Correct!' : 'Try to remember:'} ${q.explanation}',
        )),
      ),
      const SizedBox(height: 16),
      FilledButton(onPressed: selected == null ? null : next,
        child: Text(index == widget.chapter.questions.length - 1 ? 'Finish' : 'Next')),
    ]),
  );
}

class ScorePage extends StatelessWidget {
  final int score, total;
  final bool test;
  const ScorePage({super.key, required this.score, required this.total, required this.test});
  @override
  Widget build(BuildContext context) {
    final pct = (score * 100 / total).round();
    return Scaffold(
      appBar: AppBar(title: const Text('Your Score')),
      body: Center(child: Padding(padding: const EdgeInsets.all(24), child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.emoji_events, size: 76, color: Colors.amber),
          const SizedBox(height: 12),
          Text(test ? 'Chapter test complete!' : 'Practice complete!', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text('$score / $total', style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold)),
          Text('$pct% correct'),
          const SizedBox(height: 20),
          FilledButton(onPressed: () => Navigator.popUntil(context, (r) => r.isFirst), child: const Text('Back to home')),
        ],
      ))),
    );
  }
}
