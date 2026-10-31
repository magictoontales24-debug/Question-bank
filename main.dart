import 'package:flutter/material.dart';

void main() => runApp(const QuestionBankApp());

class QuestionBankApp extends StatelessWidget {
  const QuestionBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QUESTION BANK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6554D9)),
        scaffoldBackgroundColor: const Color(0xFFF7F7FC),
        fontFamily: 'Roboto',
      ),
      home: const MainShell(),
    );
  }
}

class Question {
  final String prompt;
  final List<String> options;
  final int answer;
  final String explanation;
  const Question(this.prompt, this.options, this.answer, this.explanation);
}

const classTwoQuestions = <Question>[
  Question('What is 8 + 7?', ['13', '14', '15', '16'], 2, '8 + 7 = 15.'),
  Question('What is 20 - 6?', ['12', '13', '14', '15'], 2, '20 - 6 = 14.'),
  Question('Which number comes after 49?', ['48', '50', '51', '59'], 1, '50 comes immediately after 49.'),
  Question('How many sides does a triangle have?', ['2', '3', '4', '5'], 1, 'A triangle has 3 sides.'),
  Question('What is 5 groups of 2?', ['7', '8', '10', '12'], 2, '5 groups of 2 means 5 × 2 = 10.'),
  Question('Which is the smallest number?', ['32', '23', '42', '34'], 1, '23 is the smallest number.'),
  Question('How many days are there in one week?', ['5', '6', '7', '8'], 2, 'There are 7 days in a week.'),
  Question('You have ₹10 and spend ₹4. How much is left?', ['₹4', '₹5', '₹6', '₹7'], 2, '₹10 - ₹4 = ₹6.'),
  Question('What is 10 + 10 + 10?', ['20', '25', '30', '40'], 2, '10 + 10 + 10 = 30.'),
  Question('Which shape has no corners?', ['Square', 'Circle', 'Triangle', 'Rectangle'], 1, 'A circle has no corners.'),
];

class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int tab = 0;
  int selectedClass = 2;
  int totalTests = 0;
  int bestScore = 0;

  void openQuiz() async {
    final score = await Navigator.push<int>(
      context,
      MaterialPageRoute(builder: (_) => QuizScreen(classNumber: selectedClass)),
    );
    if (score != null) {
      setState(() {
        totalTests++;
        if (score > bestScore) bestScore = score;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(
        selectedClass: selectedClass,
        onClassChanged: (v) => setState(() => selectedClass = v),
        onStart: openQuiz,
        onNavigate: (v) => setState(() => tab = v),
        totalTests: totalTests,
        bestScore: bestScore,
      ),
      ChaptersScreen(classNumber: selectedClass, onStart: openQuiz),
      TestSeriesScreen(classNumber: selectedClass, onStart: openQuiz),
      ResultsScreen(totalTests: totalTests, bestScore: bestScore),
      const AccountScreen(),
    ];

    return Scaffold(
      body: SafeArea(child: pages[tab]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (v) => setState(() => tab = v),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book), label: 'Chapters'),
          NavigationDestination(icon: Icon(Icons.assignment_outlined), selectedIcon: Icon(Icons.assignment), label: 'Tests'),
          NavigationDestination(icon: Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart), label: 'Results'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final int selectedClass, totalTests, bestScore;
  final ValueChanged<int> onClassChanged;
  final VoidCallback onStart;
  final ValueChanged<int> onNavigate;
  const HomeScreen({super.key, required this.selectedClass, required this.onClassChanged,
    required this.onStart, required this.onNavigate, required this.totalTests, required this.bestScore});

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(20), children: [
      Row(children: [
        Container(padding: const EdgeInsets.all(11), decoration: BoxDecoration(
          color: const Color(0xFFECE9FF), borderRadius: BorderRadius.circular(14)),
          child: const Icon(Icons.auto_stories, color: Color(0xFF6554D9), size: 28)),
        const SizedBox(width: 12),
        const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('QUESTION BANK', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: .4)),
          Text('Learn • Practice • Succeed', style: TextStyle(color: Colors.black54)),
        ])),
        IconButton(onPressed: () => onNavigate(4), icon: const Icon(Icons.account_circle_outlined, size: 29)),
      ]),
      const SizedBox(height: 24),
      Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF6554D9), Color(0xFF8878F0)]),
        borderRadius: BorderRadius.circular(24)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Your learning journey starts here!', style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold)),
          const SizedBox(height: 7),
          const Text('Choose your class and practise every day.', style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 16),
          DropdownButtonFormField<int>(
            value: selectedClass,
            dropdownColor: Colors.white,
            decoration: InputDecoration(filled: true, fillColor: Colors.white, labelText: 'Select class',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(13), borderSide: BorderSide.none)),
            items: List.generate(12, (i) => DropdownMenuItem(value: i + 1, child: Text('Class ${i + 1}'))),
            onChanged: (v) { if (v != null) onClassChanged(v); },
          ),
        ])),
      const SizedBox(height: 22),
      const Text('Explore learning', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
      const SizedBox(height: 12),
      Row(children: [
        Expanded(child: _HomeTile(icon: Icons.calculate_outlined, title: 'Maths practice', subtitle: 'Solve questions', color: const Color(0xFFECE9FF), onTap: onStart)),
        const SizedBox(width: 12),
        Expanded(child: _HomeTile(icon: Icons.assignment_turned_in_outlined, title: 'Test series', subtitle: 'Check your skills', color: const Color(0xFFFFF0D9), onTap: () => onNavigate(2))),
      ]),
      const SizedBox(height: 12),
      Row(children: [
        Expanded(child: _HomeTile(icon: Icons.library_books_outlined, title: 'Chapters', subtitle: 'Learn by topic', color: const Color(0xFFE1F6EC), onTap: () => onNavigate(1))),
        const SizedBox(width: 12),
        Expanded(child: _HomeTile(icon: Icons.emoji_events_outlined, title: 'My results', subtitle: 'Track progress', color: const Color(0xFFFFE8EE), onTap: () => onNavigate(3))),
      ]),
      const SizedBox(height: 22),
      const Text('Your progress', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
      const SizedBox(height: 12),
      Row(children: [
        Expanded(child: _StatCard(label: 'Tests taken', value: '$totalTests', icon: Icons.edit_note)),
        const SizedBox(width: 10),
        Expanded(child: _StatCard(label: 'Best score', value: '$bestScore / 10', icon: Icons.star_outline)),
      ]),
      const SizedBox(height: 20),
      const Text('Available subjects', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
      const SizedBox(height: 10),
      const ListTile(leading: CircleAvatar(backgroundColor: Color(0xFFECE9FF), child: Icon(Icons.calculate, color: Color(0xFF6554D9))),
        title: Text('Mathematics'), subtitle: Text('Available demo questions for Class 2')),
      const ListTile(leading: CircleAvatar(child: Icon(Icons.science_outlined)), title: Text('Science'),
        subtitle: Text('Subject section – content can be added')),
      const ListTile(leading: CircleAvatar(child: Icon(Icons.spellcheck)), title: Text('English'),
        subtitle: Text('Subject section – content can be added')),
    ]);
  }
}

class _HomeTile extends StatelessWidget {
  final IconData icon; final String title, subtitle; final Color color; final VoidCallback onTap;
  const _HomeTile({required this.icon, required this.title, required this.subtitle, required this.color, required this.onTap});
  @override Widget build(BuildContext context) => InkWell(onTap: onTap, borderRadius: BorderRadius.circular(18),
    child: Container(padding: const EdgeInsets.all(15), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CircleAvatar(backgroundColor: color, child: Icon(icon, color: const Color(0xFF5142B5))),
        const SizedBox(height: 12), Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 12)),
      ])));
}

class _StatCard extends StatelessWidget {
  final String label, value; final IconData icon;
  const _StatCard({required this.label, required this.value, required this.icon});
  @override Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(17)),
    child: Row(children: [Icon(icon, color: const Color(0xFF6554D9)), const SizedBox(width: 10),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.black54, fontSize: 12)),
      ])]));
}

List<String> chaptersFor(int c) {
  if (c == 2) return ['Numbers and counting', 'Addition', 'Subtraction', 'Multiplication basics',
    'Shapes and patterns', 'Time and calendar', 'Money', 'Measurement', 'Word problems'];
  return ['Number systems', 'Basic operations', 'Fractions and decimals', 'Geometry',
    'Measurement and data', 'Word problems', 'Revision practice'];
}

class ChaptersScreen extends StatelessWidget {
  final int classNumber; final VoidCallback onStart;
  const ChaptersScreen({super.key, required this.classNumber, required this.onStart});
  @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(20), children: [
    const Text('Chapters', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
    Text('Class $classNumber • Mathematics', style: const TextStyle(color: Colors.black54)),
    const SizedBox(height: 16),
    ...chaptersFor(classNumber).asMap().entries.map((e) => Card(color: Colors.white, child: ListTile(
      leading: CircleAvatar(backgroundColor: const Color(0xFFECE9FF), child: Text('${e.key + 1}')),
      title: Text(e.value), subtitle: const Text('Lesson and practice questions'),
      trailing: const Icon(Icons.chevron_right), onTap: onStart))),
    const SizedBox(height: 12),
    const Text('Note: Class 2 currently includes the first demo question set. Other classes have starter chapter lists ready for content.', style: TextStyle(color: Colors.black54)),
  ]);
}

class TestSeriesScreen extends StatelessWidget {
  final int classNumber; final VoidCallback onStart;
  const TestSeriesScreen({super.key, required this.classNumber, required this.onStart});
  @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(20), children: [
    const Text('Test Series', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
    Text('Class $classNumber • Mathematics', style: const TextStyle(color: Colors.black54)),
    const SizedBox(height: 18),
    _TestCard(title: 'Quick Practice', detail: '10 questions • No time limit', icon: Icons.bolt, onTap: onStart),
    _TestCard(title: 'Weekly Test', detail: '10 questions • Practice mode', icon: Icons.calendar_month, onTap: onStart),
    _TestCard(title: 'Mock Examination', detail: '10 questions • Demo test', icon: Icons.school_outlined, onTap: onStart),
    const SizedBox(height: 10),
    const Text('Timed exams, saved test history and a larger question library can be connected in the next development stage.', style: TextStyle(color: Colors.black54)),
  ]);
}

class _TestCard extends StatelessWidget {
  final String title, detail; final IconData icon; final VoidCallback onTap;
  const _TestCard({required this.title, required this.detail, required this.icon, required this.onTap});
  @override Widget build(BuildContext context) => Card(color: Colors.white, child: ListTile(
    contentPadding: const EdgeInsets.all(14), leading: CircleAvatar(backgroundColor: const Color(0xFFECE9FF), child: Icon(icon, color: const Color(0xFF6554D9))),
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), subtitle: Text(detail),
    trailing: const Icon(Icons.play_circle_fill, color: Color(0xFF6554D9)), onTap: onTap));
}

class ResultsScreen extends StatelessWidget {
  final int totalTests, bestScore;
  const ResultsScreen({super.key, required this.totalTests, required this.bestScore});
  @override Widget build(BuildContext context) => Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Text('My Results', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
    const SizedBox(height: 18),
    _StatCard(label: 'Tests completed this session', value: '$totalTests', icon: Icons.assignment_turned_in),
    const SizedBox(height: 12),
    _StatCard(label: 'Best score', value: '$bestScore / 10', icon: Icons.emoji_events),
    const SizedBox(height: 20),
    const Text('Keep practising!', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
    const Text('Your scores are shown during this app session. Persistent accounts and cloud-saved history are planned for the next stage.', style: TextStyle(color: Colors.black54)),
  ]));
}

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(20), children: const [
    Text('Account', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
    SizedBox(height: 20),
    CircleAvatar(radius: 36, child: Icon(Icons.person, size: 38)),
    SizedBox(height: 10),
    Center(child: Text('Guest learner', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    SizedBox(height: 20),
    Card(child: ListTile(leading: Icon(Icons.workspace_premium), title: Text('Premium membership'), subtitle: Text('Premium plans can be configured later.'))),
    Card(child: ListTile(leading: Icon(Icons.settings_outlined), title: Text('Settings'), subtitle: Text('App preferences'))),
    Card(child: ListTile(leading: Icon(Icons.info_outline), title: Text('About QUESTION BANK'), subtitle: Text('Learn • Practice • Succeed'))),
  ]);
}

class QuizScreen extends StatefulWidget {
  final int classNumber;
  const QuizScreen({super.key, required this.classNumber});
  @override State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int index = 0, score = 0;
  int? selected;
  bool submitted = false;
  late final List<Question> questions;

  @override void initState() {
    super.initState();
    questions = widget.classNumber == 2 ? classTwoQuestions : _starterQuestions(widget.classNumber);
  }

  void submit() {
    if (selected == null) return;
    setState(() { submitted = true; if (selected == questions[index].answer) score++; });
  }

  void next() {
    if (index == questions.length - 1) {
      Navigator.pop(context, score);
    } else {
      setState(() { index++; selected = null; submitted = false; });
    }
  }

  @override Widget build(BuildContext context) {
    final q = questions[index];
    return Scaffold(
      appBar: AppBar(title: Text('Class ${widget.classNumber} • Maths Test'), backgroundColor: const Color(0xFFF7F7FC)),
      body: Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Question ${index + 1} of ${questions.length}', style: const TextStyle(fontWeight: FontWeight.bold)),
          Text('Score: $score', style: const TextStyle(color: Color(0xFF6554D9), fontWeight: FontWeight.bold)),
        ]),
        const SizedBox(height: 10),
        LinearProgressIndicator(value: (index + 1) / questions.length, minHeight: 7, borderRadius: BorderRadius.circular(10)),
        const SizedBox(height: 28),
        Text(q.prompt, style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        ...List.generate(q.options.length, (i) {
          final isChosen = selected == i;
          final isCorrect = submitted && i == q.answer;
          final isWrong = submitted && isChosen && i != q.answer;
          return Container(margin: const EdgeInsets.only(bottom: 10), child: InkWell(
            onTap: submitted ? null : () => setState(() => selected = i),
            borderRadius: BorderRadius.circular(14),
            child: Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(
              color: isCorrect ? const Color(0xFFE1F6EC) : isWrong ? const Color(0xFFFFE8EE) : isChosen ? const Color(0xFFECE9FF) : Colors.white,
              border: Border.all(color: isCorrect ? Colors.green : isWrong ? Colors.red : isChosen ? const Color(0xFF6554D9) : Colors.black12),
              borderRadius: BorderRadius.circular(14)),
              child: Row(children: [Expanded(child: Text('${String.fromCharCode(65+i)}. ${q.options[i]}', style: const TextStyle(fontSize: 16))),
                if (isCorrect) const Icon(Icons.check_circle, color: Colors.green),
                if (isWrong) const Icon(Icons.cancel, color: Colors.red),
              ])),
          ));
        }),
        if (submitted) Container(width: double.infinity, padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: const Color(0xFFECE9FF), borderRadius: BorderRadius.circular(14)),
          child: Text(q.explanation, style: const TextStyle(fontWeight: FontWeight.w500))),
        const Spacer(),
        SizedBox(width: double.infinity, child: FilledButton(
          onPressed: submitted ? next : (selected == null ? null : submit),
          child: Text(submitted ? (index == questions.length - 1 ? 'Finish test' : 'Next question') : 'Check answer'),
        )),
      ])),
    );
  }
}

List<Question> _starterQuestions(int c) => const [
  Question('Which number is greater: 18 or 25?', ['18', '25', 'Both are equal', 'Cannot tell'], 1, '25 is greater than 18.'),
  Question('What is 6 + 9?', ['13', '14', '15', '16'], 2, '6 + 9 = 15.'),
  Question('What is 14 - 5?', ['7', '8', '9', '10'], 2, '14 - 5 = 9.'),
  Question('How many sides does a square have?', ['3', '4', '5', '6'], 1, 'A square has four sides.'),
  Question('What comes next: 2, 4, 6, ...?', ['7', '8', '9', '10'], 1, 'The pattern increases by 2.'),
  Question('Which is an even number?', ['7', '9', '12', '15'], 2, '12 is divisible by 2.'),
  Question('How many months are in a year?', ['10', '11', '12', '13'], 2, 'A year has 12 months.'),
  Question('What is half of 10?', ['2', '4', '5', '6'], 2, 'Half of 10 is 5.'),
  Question('Which shape is round?', ['Triangle', 'Square', 'Circle', 'Rectangle'], 2, 'A circle is round.'),
  Question('What is 3 × 2?', ['5', '6', '7', '8'], 1, '3 × 2 = 6.'),
];
