import 'package:flutter/material.dart';

void main() => runApp(PageThree());

class PageThree extends StatelessWidget {
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
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Arithmetic Operation',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeaderSection(
              title: 'Multiplication',
              content: 'combines two values like addition and subtraction, into a single value or product. The two original values are known as the multiplier. The product of a and b is expressed as a·b or a × b, where ‘×’ is the multiplication operator.',
            ),
            SizedBox(height: 20),
            Text(
              'Let\'s try multiplying numbers:',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6!,
            ),
            SizedBox(height: 10),
            NumberMultiplicationSection(),
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
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          ),
          SizedBox(height: 10),
          Image.asset(
             'assets/images/multiply.png', 
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

class NumberMultiplicationSection extends StatefulWidget {
  @override
  _NumberMultiplicationSectionState createState() =>
      _NumberMultiplicationSectionState();
}

class _NumberMultiplicationSectionState
    extends State<NumberMultiplicationSection> {
  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();
  TextEditingController resultController = TextEditingController();

  void _multiplyNumbers() {
    double number1 = double.tryParse(number1Controller.text) ?? 0;
    double number2 = double.tryParse(number2Controller.text) ?? 0;
    double result = number1 * number2;
    resultController.text = result.toStringAsFixed(2); 
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
                'x',
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
              child: Text('Multiply Numbers'),
              onPressed: _multiplyNumbers,
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
