import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GLOBAL TOURS & TRAVELS',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.jpg"), // Path to your background image
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite, size: 80, color: Colors.red),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(userType: 'Customer'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    'Made with Love ❤️ in VIT-AP',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black,
                          offset: Offset(1.0, 1.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10), // Add some space between the text and the icon
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
