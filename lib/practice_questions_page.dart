import 'package:flutter/material.dart';
import 'package:area_and_volume/models/questions.dart'; // Import the Question model

class PracticeQuestionsPage extends StatefulWidget {
  const PracticeQuestionsPage({Key? key}) : super(key: key);

  @override
  _PracticeQuestionsPageState createState() => _PracticeQuestionsPageState();
}

class _PracticeQuestionsPageState extends State<PracticeQuestionsPage> {
  int currentIndex = 0;

  // List of questions for the user to practice
  List<Question> questions = [
    Question(
      question: "1. Calculate the area of the rectangle.",
      imageUrl: "assets/images/rectangle_q1.png",
      options: ['10', '8', '12', '7'],
      correctAnswer: '12',
    ),
    Question(
      question: "2. Calculate the area of the rectangle.",
      imageUrl: "assets/images/rectangle_q2.png",
      options: ['12', '13', '24', '17'],
      correctAnswer: '24',
    ),
    Question(
      question: "3. Calculate the area of the rectangle.",
      imageUrl: "assets/images/rectangle_q3.png",
      options: ['104', '80', '120', '55.5'],
      correctAnswer: '104',
    ),
    // Add more questions here
  ];

  @override
  Widget build(BuildContext context) {
    final question = questions[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Practice Section - Area -> Rectangle"),
        leading: IconButton(
          icon: const Icon(Icons.home), // Home button on top-left
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(question.question,
                    style: const TextStyle(fontSize: 20)),
              ),
              SizedBox(
                width: 400, // Set desired width
                height: 200, // Set desired height
                child: Image.asset(question.imageUrl),
              ),
              const SizedBox(height: 20), // Add spacing before the buttons

              // Display two buttons in a row
              for (int i = 0; i < question.options.length; i += 2)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(
                          context, question.options[i]), // First button
                      if (i + 1 < question.options.length)
                        _buildButton(
                            context,
                            question
                                .options[i + 1]), // Second button if it exists
                    ],
                  ),
                ),
            ],
          ),

          // Left navigation arrow
          Positioned(
            left: 10,
            top: 0,
            bottom: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 40,
              onPressed: currentIndex > 0
                  ? () {
                      setState(() {
                        currentIndex--;
                      });
                    }
                  : null, // Disable if at the first question
            ),
          ),

          // Right navigation arrow
          Positioned(
            right: 10,
            top: 0,
            bottom: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward),
              iconSize: 40,
              onPressed: currentIndex < questions.length - 1
                  ? () {
                      setState(() {
                        currentIndex++;
                      });
                    }
                  : null, // Disable if at the last question
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String option) {
    return Flexible(
      child: SizedBox(
        width: 150, // Set desired button width
        height: 50, // Set desired button height
        child: ElevatedButton(
          onPressed: () => checkAnswer(option),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 23, 127, 237),
          ),
          child: Text(
            option,
            style: const TextStyle(
              color: Colors.white, // Set the text color to white
              fontWeight: FontWeight.bold, // Make the text bold
              fontSize: 18, // Optionally, increase the font size
            ),
          ),
        ),
      ),
    );
  }

  void checkAnswer(String selectedOption) {
    if (selectedOption == questions[currentIndex].correctAnswer) {
      // Handle correct answer
    } else {
      // Handle incorrect answer
    }

    // Handle quiz completion or navigation to next question
  }
}
