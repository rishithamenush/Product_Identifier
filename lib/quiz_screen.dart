import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:product_identifier/home_page.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;

  void pickAnswer(int value) {
    setState(() {
      selectedAnswerIndex = value;
    });
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
    } else {}
    setState(() {
      selectedAnswerIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 154, 162, 248),
        elevation: 0,
        title: Center(
          child: Text(
            'PRODUCT IDENTIFIER',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
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
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              question.question,
              style: TextStyle(fontSize: 21),
              textAlign: TextAlign.center,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => pickAnswer(index),
                  child: AnswerCard(
                    index: index,
                    text: question.options[index],
                    isSelected: selectedAnswerIndex == index,
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: goToNextQuestion,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                foregroundColor: const Color.fromARGB(255, 121, 131, 246),
              ),
              child: Text(
                  questionIndex < questions.length - 1 ? 'Next' : 'Submit'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Color.fromARGB(169, 129, 136, 209),
        color: Colors.white,
        tabBackgroundColor: Color.fromARGB(255, 116, 122, 188),
        onTabChange: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const MyHomePage()));
          }
          // Handle other tabs if necessary
        },
        tabs: const [
          GButton(
            gap: 8,
            padding: EdgeInsets.all(16),
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.search_rounded,
            text: 'Search',
          ),
          GButton(
            icon: Icons.add_shopping_cart,
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
            style: TextStyle(color: isSelected ? Colors.white : null)),
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
    options: [
      'Yes',
      'No',
    ],
  ),
  Question(
    question: 'Is the Identify Product Color correct?',
    options: [
      'Yes',
      'No',
    ],
  ),
];
