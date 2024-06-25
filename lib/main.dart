import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'PageOne.dart';
import 'PageTwo.dart';
import 'PageThree.dart'; 
import 'PageFour.dart'; 
import 'PageFive.dart'; 

void main() {
  runApp(MaterialApp(
    home: LoginPage(), // Launch the login page initially
  ));
}

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) {
    // Dummy login logic. Replace this with your actual login authentication.
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'Azrul' && password == '') {
      // Navigate to the main page after successful login.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ArithmeticExercisePage(username: username),
        ),
      );
    } else {
      // Show an error dialog for invalid credentials.
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Error'),
          content: Text('Invalid username or password.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK', style: TextStyle(color: Colors.white)),
            ),
          ],
          backgroundColor: Colors.red, // Set the background color for the dialog
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.lightGreen, // Set the app bar background color
        centerTitle: true, // Center the title in the app bar
      ),
      body: Container(
        color: const Color.fromARGB(255, 243, 240, 236),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.lock,
                  size: 100.0,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                Column(
                  children: [
                    SizedBox(height: 300), // Add spacing above the username
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 2, 14, 32),
                        ), // Set the label text color
                      ),
                    ),
                    SizedBox(height: 16), // Add spacing between username and password
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 23, 1, 1),
                        ), // Set the label text color
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16), // Add spacing below the password field
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text('Login', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Set the button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Set the button border radius
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // Handle Twitter login
                  },
                  icon: Icon(Icons.tiktok),
                  iconSize: 40.0,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                SizedBox(width: 16),
                IconButton(
                  onPressed: () {
                    // Handle Gmail login
                  },
                  icon: Icon(Icons.mail),
                  iconSize: 40.0,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ArithmeticApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arithmetic Exercise',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArithmeticExercisePage(username: ''), // Provide an empty username initially
    );
  }
}

class ArithmeticExercisePage extends StatefulWidget {
  final String username;

  ArithmeticExercisePage({required this.username});

  @override
  _ArithmeticExercisePageState createState() => _ArithmeticExercisePageState();
}

class _ArithmeticExercisePageState extends State<ArithmeticExercisePage> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.username.isNotEmpty) {
      _showWelcomePopUp();
    }
  }

  void _showWelcomePopUp() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Welcome, ${widget.username}!'),
          content: Text('Let\'s discover some basic operations.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomePage(),
      PageOne(),
      PageTwo(),
      PageThree(), 
      PageFour(),  
      PageFive(), 
    ];

    return Scaffold(
      appBar: null, // Remove the header from all pages
      body: Center(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        selectedItemColor: Colors.blue, // Set the color for the selected icon
        unselectedItemColor: Colors.grey, // Set the color for the unselected icons
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Addition',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove),
            label: 'Subtraction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.close),
            label: 'Multiplication',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.percent),
            label: 'Division',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Exercise',
          ),
          // Add more bottom navigation items here if needed
        ],
      ),
    );
  }
}
