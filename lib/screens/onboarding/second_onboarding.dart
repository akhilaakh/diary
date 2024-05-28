import 'package:diary/screens/onboarding/third_onboarding.dart';
import 'package:flutter/material.dart';

class SecondOnboarding extends StatefulWidget {
  const SecondOnboarding({super.key});

  @override
  State<SecondOnboarding> createState() => _SecondOnboardingState();
}

class _SecondOnboardingState extends State<SecondOnboarding> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/Screenshot 2024-03-13 123332.png',
                  height: height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 0.5,
            ),
            const Text(
              '"A photograph captures a\n moment in time, but the \nmemories it holds are timeless."',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/Screenshot 2024-03-02 105001.png',
                  height: 200,
                ),
              ),
            ),
            const SizedBox(
              height: 88,
            ),
            Stack(children: [
              Image.asset('assets/images/Screenshot 2024-03-13 105824.png',
                  height: height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThirdOnboarding()),
                      );
                    },
                    icon: const Icon(Icons.check),
                    label: const Text(
                      'continue',
                      style: TextStyle(
                          height: 1, fontSize: 20, color: Colors.black),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  ),
                ],
              ),
            ]),
          ],
        ),
      )),
    );
  }
}
