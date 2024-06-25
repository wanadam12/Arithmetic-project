import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(PageFive());
}

class PageFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arithmetic Exercise',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen, // Set the primary color to light green
      ),
      home: ArithmeticExercisePage(),
    );
  }
}

class ArithmeticExercisePage extends StatefulWidget {
  @override
  _ArithmeticExercisePageState createState() => _ArithmeticExercisePageState();
}

class _ArithmeticExercisePageState extends State<ArithmeticExercisePage> {
  int num1 = 0;
  int num2 = 0;
  int result = 0;
  String operator = '+';
  TextEditingController answerController = TextEditingController();
  bool showAnswer = false;

  @override
  void initState() {
    super.initState();
    generateQuestion();
  }

  void generateQuestion() {
    Random random = Random();
    num1 = random.nextInt(50) + 1;
    num2 = random.nextInt(50) + 1;
    int operatorIndex = random.nextInt(4);
    switch (operatorIndex) {
      case 0:
        operator = '+';
        result = num1 + num2;
        break;
      case 1:
        operator = '-';
        result = num1 - num2;
        break;
      case 2:
        operator = '*';
        result = num1 * num2;
        break;
      case 3:
        operator = '/';
        // Ensure non-zero division
        num1 = (random.nextInt(10) + 1) * num2;
        result = num1 ~/ num2; // Integer division
        break;
      default:
        break;
    }
    answerController.clear();
    setState(() {
      showAnswer = false;
    });
  }

  void checkAnswer() {
    int? userAnswer = int.tryParse(answerController.text);
    setState(() {
      showAnswer = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Arithmetic Exercise',
          style: TextStyle(color: Colors.white), // Set the text color to white
        ),
        backgroundColor: Colors.lightGreen, // Set the header color to light green
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$num1 $operator $num2 = ?',
              style: TextStyle(fontSize: 24, color: Colors.black), // Set the text color to black
            ),
            SizedBox(height: 20),
            Container(
              width: 100,
              child: TextField(
                controller: answerController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black), // Set the text color to black
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Check', style: TextStyle(color: Colors.black)), // Set the text color to black
              onPressed: checkAnswer,
              style: ElevatedButton.styleFrom(
                primary: Colors.lightGreen, // Set the button color to light green
              ),
            ),
            SizedBox(height: 20),
            Visibility(
              visible: showAnswer,
              child: Text(
                'The correct answer is $result.',
                style: TextStyle(fontSize: 18, color: Colors.black), // Set the text color to black
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Next Question', style: TextStyle(color: Colors.black)), // Set the text color to black
              onPressed: generateQuestion,
              style: ElevatedButton.styleFrom(
                primary: Colors.lightGreen, // Set the button color to light green
              ),
            ),
          ],
        ),
      ),
    );
  }
}
