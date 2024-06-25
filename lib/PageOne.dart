
import 'package:flutter/material.dart';

void main() => runApp(PageOne());

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primaryColor: Colors.lightGreen,
        secondaryHeaderColor: Colors.lightGreenAccent,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 16),
        ).apply(
          bodyColor: Colors.black,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.lightGreen,
            textStyle: TextStyle(color: Colors.white),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen),
          ),
        ),
      ),
      home: BlogScreen(),
    );
  }
}

class BlogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 133, 229, 23),
        title: Text(
          'Arithmetic Operation',
          style: TextStyle(color: Colors.white), // Set the text color to white
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeaderSection(
              title: 'Addition',
              content: 'combining two or more values into one value. Summation is the mathematical term for the addition of n values. Due to the fact that adding 0 to any value produces the same outcome, 0 is referred to as the identity element of addition.',
            ),
            SizedBox(height: 20),
            Text(
              'Let\'s try adding numbers:',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6!,
            ),
            SizedBox(height: 10),
            NumberAdditionSection(),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  final String title;
  final String content;

  const HeaderSection({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.lightGreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
          ),
          SizedBox(height: 10),
            Image.asset(
              'assets/images/add.png', // Replace this with your image path
              height: 200,
              width: 100,
              
            ),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}


class NumberAdditionSection extends StatefulWidget {
  @override
  _NumberAdditionSectionState createState() => _NumberAdditionSectionState();
}

class _NumberAdditionSectionState extends State<NumberAdditionSection> {
  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();
  TextEditingController resultController = TextEditingController();

void _addNumbers() {
  double number1 = double.tryParse(number1Controller.text) ?? 0.0;
  double number2 = double.tryParse(number2Controller.text) ?? 0.0;
  double result = number1 + number2;
  resultController.text = result.toStringAsFixed(2); // Set the result to two decimal places
}


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: number1Controller,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Number 1',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                '+',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: number2Controller,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Number 2',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
              child: Text('Add Numbers'),
              onPressed: _addNumbers,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: resultController,
            enabled: false,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              labelText: 'Result',
              labelStyle: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
