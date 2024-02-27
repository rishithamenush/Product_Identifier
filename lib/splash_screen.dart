import 'package:flutter/material.dart';
import 'package:product_identifier/home_page.dart'; // Make sure this import is correct

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 154, 162, 248),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/finder.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            bottom: 50, // Adjust the value to change the gap
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 50), // This adds padding specifically at the bottom
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to MyHomePage
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                ),
                child: const Text("Get Started"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
