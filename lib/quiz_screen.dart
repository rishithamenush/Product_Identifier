import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Map<int, int> selectedAnswers = {};

  void pickAnswer(int questionIndex, int answerIndex) {
    setState(() {
      selectedAnswers[questionIndex] = answerIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 154, 162, 248),
        title: Text(
          'PRODUCT IDENTIFIER',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          color: Colors.white,
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: questions.asMap().entries.map((entry) {
            int qIndex = entry.key;
            Question question = entry.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.question,
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                ...question.options.asMap().entries.map((optionEntry) {
                  int optionIndex = optionEntry.key;
                  String option = optionEntry.value;
                  return GestureDetector(
                    onTap: () => pickAnswer(qIndex, optionIndex),
                    child: AnswerCard(
                      index: optionIndex,
                      text: option,
                      isSelected: selectedAnswers[qIndex] == optionIndex,
                    ),
                  );
                }).toList(),
                SizedBox(height: 20),
              ],
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Color.fromARGB(255, 116, 122, 188),
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Color.fromARGB(255, 154, 162, 248),
        gap: 8,
        padding: EdgeInsets.all(16),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.search,
            text: 'Search',
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: 'Cart',
          ),
          GButton(
            icon: Icons.settings,
            text: 'Settings',
          ),
        ],
      ),
    );
  }
}

class AnswerCard extends StatelessWidget {
  final int index;
  final String text;
  final bool isSelected;

  const AnswerCard({
    Key? key,
    required this.index,
    required this.text,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? Colors.blue : null,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(text,
            style: TextStyle(
                color: isSelected ? Colors.white : null, fontSize: 16)),
      ),
    );
  }
}

class Question {
  final String question;
  final List<String> options;

  const Question({
    required this.question,
    required this.options,
  });
}

const List<Question> questions = [
  Question(
    question: 'Is the Identify Product correct?',
    options: ['Yes', 'No'],
  ),
  Question(
    question: 'Is the Identify Product Color correct?',
    options: ['Yes', 'No'],
  ),
  Question(
    question: 'Is the Identify Product correct?',
    options: ['Yes', 'No'],
  ),
  Question(
    question: 'Is the Identify Product Color correct?',
    options: ['Yes', 'No'],
  ),
  Question(
    question: 'Is the Identify Product correct?',
    options: ['Yes', 'No'],
  ),
  Question(
    question: 'Is the Identify Product Color correct?',
    options: ['Yes', 'No'],
  ),
  // Add more questions as needed
];
