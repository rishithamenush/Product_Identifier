import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as devtools;

import 'package:product_identifier/quiz_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? filePath;
  String label = '';
  double confidence = 0.0;
  Future<void> _tfLteInit() async {
    String? res = await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt",
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false);
  }

  pickImageGallery() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    var imageMap = File(image.path);

    setState(() {
      filePath = imageMap;
    });
    var recognitions = await Tflite.runModelOnImage(
        path: image.path, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );

    if (recognitions == null) {
      devtools.log("recognition is Null ");
    }
    devtools.log(recognitions.toString());
    setState(() {
      confidence = (recognitions?[0]['confidence'] * 100);

      label = recognitions![0]['label'].toString();
    });
  }

  pickImageCamera() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    var imageMap = File(image.path);

    setState(() {
      filePath = imageMap;
    });
    var recognitions = await Tflite.runModelOnImage(
        path: image.path, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );

    if (recognitions == null) {
      devtools.log("recognition is Null ");
    }
    devtools.log(recognitions.toString());
    setState(() {
      confidence = (recognitions?[0]['confidence'] * 100);

      label = recognitions![0]['label'].toString();
    });
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  @override
  void initState() {
    super.initState();
    _tfLteInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 154, 162, 248),
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
          onPressed: () {
            //open menu
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Card(
                elevation: 20,
                clipBehavior: Clip.hardEdge,
                color: const Color.fromARGB(128, 161, 167, 243),
                child: SizedBox(
                  width: 300,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(133, 255, 255, 255),
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                              image: AssetImage('assets/search.png'),
                            ),
                          ),
                          child: filePath == null
                              ? const Text('')
                              : Image.file(
                                  filePath!,
                                  fit: BoxFit.fill,
                                ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                label,
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  pickImageCamera();
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  foregroundColor: const Color.fromARGB(255, 121, 131, 246),
                ),
                child: const Text("Capture Product"),
              ),
              const SizedBox(
                height: 10,
              ),
              //Check  out the product using Gallery Image (Find out the reliability)
              ElevatedButton(
                onPressed: () {
                  pickImageGallery();
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  foregroundColor: const Color.fromARGB(255, 121, 131, 246),
                ),
                child: const Text("Pick From the Gallery"),
              ),
              const SizedBox(
                height: 30,
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const QuizScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  foregroundColor: const Color.fromARGB(255, 121, 131, 246),
                ),
                child: const Text("Go to Questionnaire"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const GNav(
        backgroundColor: Color.fromARGB(169, 129, 136, 209),
        color: Colors.white,
        tabBackgroundColor: Color.fromARGB(255, 116, 122, 188),
        tabs: [
          GButton(
            gap: 8,
            padding: EdgeInsets.all(16),
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.search_rounded,
            text: 'search',
          ),
          GButton(
            icon: Icons.add_shopping_cart,
            text: 'Cart',
          ),
          GButton(
            icon: Icons.settings,
            text: 'settings',
          ),
        ],
      ),
    );
  }
}
