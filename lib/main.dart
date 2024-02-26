import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Super Market Product Identifier"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Card(
            elevation: 20,
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              width: 300,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      height: 280,
                      width: 280,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                              image: AssetImage('assets/capture.png'))),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
