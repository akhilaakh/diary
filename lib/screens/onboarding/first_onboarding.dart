import 'package:diary/profile%20create/sign_in.dart';
import 'package:diary/screens/onboarding/second_onboarding.dart';
import 'package:flutter/material.dart';

class FirstOnboarding extends StatefulWidget {
  const FirstOnboarding({super.key});

  @override
  State<FirstOnboarding> createState() => _FirstOnboardingState();
}

class _FirstOnboardingState extends State<FirstOnboarding> {
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
                // width: 500,
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/Screenshot 2024-03-13 123332.png',
                  height: height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/Screenshot 2024-03-02 105001.png',
                  height: height * 0.23,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              '"Unlock the treasure chest of \nyour heart through the key \nof your diary, revealing the \npriceless jewels of your \nunique journey"',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: height * 0.03,
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            //
            Stack(children: [
              Image.asset('assets/images/Screenshot 2024-03-13 105824.png',
                  width: MediaQuery.of(context).size.width, fit: BoxFit.fill),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondOnboarding()),
                      );
                    },
                    icon: const Icon(Icons.check),
                    label: Text(
                      'continue',
                      style: TextStyle(
                          fontSize: height * 0.025, color: Colors.black),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const SignIn()),
                      );
                    },
                    icon: const Icon(Icons.check),
                    label: Text(
                      'skip',
                      style: TextStyle(
                          fontSize: height * 0.025, color: Colors.black),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  ),
                ],
              ),
            ])
          ],
        ),
      )),
    );
  }
}
