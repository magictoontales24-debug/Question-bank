import 'package:flutter/material.dart';

void main() => runApp(const QuestionBank());

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

const chapters = <Chapter>[
  Chapter('Number Fun', Icons.numbers, [
    Q('Which number comes after 39?', ['38','40','41','29'], 1, '40 comes immediately after 39.'),
    Q('What is the place value of 5 in 52?', ['5','50','2','20'], 1, '5 is in the tens place, so its value is 50.'),
    Q('Which is the greatest number?', ['27','72','62','17'], 1, '72 is the greatest number here.'),
    Q('How many tens are there in 80?', ['8','80','0','10'], 0, '80 is made of 8 tens.'),
    Q('What is 10 more than 34?', ['35','40','44','24'], 2, '34 + 10 = 44.'),
  ]),
  Chapter('Addition', Icons.add_circle_outline, [
    Q('What is 12 + 5?', ['16','17','18','15'], 1, '12 + 5 = 17.'),
    Q('What is 23 + 14?', ['36','37','38','35'], 1, '20 + 10 = 30 and 3 + 4 = 7. Total 37.'),
    Q('Riya has 8 pencils and gets 6 more. How many?', ['12','13','14','15'], 2, '8 + 6 = 14 pencils.'),
    Q('What is 30 + 20?', ['40','50','60','70'], 1, '3 tens + 2 tens = 5 tens.'),
    Q('What is 9 + 9?', ['16','17','18','19'], 2, '9 + 9 = 18.'),
  ]),
  Chapter('Subtraction', Icons.remove_circle_outline, [
    Q('What is 15 − 4?', ['9','10','11','12'], 2, '15 − 4 = 11.'),
    Q('What is 28 − 10?', ['18','19','20','17'], 0, '28 − 10 = 18.'),
    Q('12 birds sit on a tree. 5 fly away. How many remain?', ['6','7','8','9'], 1, '12 − 5 = 7 birds.'),
    Q('What is 40 − 20?', ['10','20','30','40'], 1, '4 tens − 2 tens = 2 tens.'),
    Q('What is 17 − 9?', ['7','8','9','6'], 1, '17 − 9 = 8.'),
  ]),
  Chapter('Multiplication', Icons.close, [
    Q('What is 3 × 2?', ['5','6','7','8'], 1, '3 groups of 2 make 6.'),
    Q('What is 2 × 5?', ['7','8','10','12'], 2, '2 groups of 5 make 10.'),
    Q('What is 4 × 2?', ['6','8','10','12'], 1, '4 + 4 = 8.'),
    Q('3 bags have 4 oranges each. How many oranges?', ['7','10','12','14'], 2, '3 groups of 4 make 12.'),
    Q('What is 5 × 1?', ['0','1','5','10'], 2, 'Any number multiplied by 1 stays the same.'),
  ]),
  Chapter('Shapes', Icons.category, [
    Q('How many sides does a triangle have?', ['2','3','4','5'], 1, 'A triangle has 3 sides.'),
    Q('Which shape has 4 equal sides?', ['Circle','Triangle','Square','Oval'], 2, 'A square has 4 equal sides.'),
    Q('Which shape is round?', ['Circle','Rectangle','Square','Triangle'], 0, 'A circle is round and has no corners.'),
    Q('How many corners does a rectangle have?', ['2','3','4','5'], 2, 'A rectangle has 4 corners.'),
    Q('Which object is shaped like a sphere?', ['Book','Ball','Door','Box'], 1, 'A ball is shaped like a sphere.'),
  ]),
  Chapter('Measurement', Icons.straighten, [
    Q('Which is heavier?', ['Feather','Elephant','Leaf','Paper'], 1, 'An elephant is much heavier.'),
    Q('We measure a pencil in:', ['Litres','Centimetres','Kilograms','Hours'], 1, 'Centimetres measure short lengths.'),
    Q('Which holds more water?', ['Cup','Bucket','Spoon','Bottle cap'], 1, 'A bucket holds more water.'),
    Q('Which is shorter?', ['1 metre','50 centimetres','2 metres','3 metres'], 1, '50 centimetres is half a metre.'),
    Q('Milk is commonly measured in:', ['Litres','Metres','Hours','Kilograms'], 0, 'Litres measure liquids.'),
  ]),
  Chapter('Time and Money', Icons.access_time, [
    Q('How many days are in a week?', ['5','6','7','8'], 2, 'There are 7 days in a week.'),
    Q('How many months are in a year?', ['10','11','12','13'], 2, 'There are 12 months in a year.'),
    Q('Which coin has a value of ₹5?', ['₹1','₹2','₹5','₹10'], 2, 'The ₹5 coin is worth five rupees.'),
    Q('How many minutes are in one hour?', ['30','45','60','100'], 2, 'One hour has 60 minutes.'),
    Q('A toy costs ₹10. You pay ₹20. What change do you get?', ['₹5','₹10','₹15','₹20'], 1, '₹20 − ₹10 = ₹10 change.'),
  ]),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tab = 0, answered = 0, correct = 0;
  int schoolClass = 2;

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
      subtitle: Text(schoolClass == 2 ? '7 Class 2 chapters available' : 'Class 2 sample course is ready first'),
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
    if (schoolClass != 2) const Card(child: Padding(
      padding: EdgeInsets.all(14),
      child: Text('Class 2 is the first sample course. More class content can be added next.'),
    )),
    ...chapters.map((c) => Card(
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
        Text('${chapter.questions.length} sample questions', textAlign: TextAlign.center),
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
