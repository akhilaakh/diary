import 'package:diary/profile%20create/sign_in.dart';
import 'package:flutter/material.dart';

class ThirdOnboarding extends StatefulWidget {
  const ThirdOnboarding({super.key});

  @override
  State<ThirdOnboarding> createState() => _ThirdOnboardingState();
}

class _ThirdOnboardingState extends State<ThirdOnboarding> {
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
            Center(
              child: Container(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/Screenshot 2024-03-14 103829.png',
                  height: 200,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '"In the dance of days, each\n square on the calendar is a\n step forward in the beautiful\nchoreography of life."',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(
              height: 77,
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
                        MaterialPageRoute(builder: (context) => const SignIn()),
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
            ])
          ],
        ),
      )),
    );
  }
}
