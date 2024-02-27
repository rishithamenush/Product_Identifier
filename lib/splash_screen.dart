import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
          // Logo Text "Product Identifier"
          Positioned(
            top: 100, // Adjust based on your layout
            child: Text(
              'Product Identifier',
              style: TextStyle(
                color: Colors.white, // Choose a color that fits the background
                fontSize: 40, // Adjust font size as needed
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Center(
            child: Lottie.network(
                'https://lottie.host/26aabf37-daf6-4161-aa7a-9aa990a552d8/KiaWLbthWL.json'),
          ),
          Positioned(
            bottom: 50,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  foregroundColor: Color.fromARGB(255, 0, 0, 0),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
