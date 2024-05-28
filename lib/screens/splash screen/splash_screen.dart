import 'package:diary/db/db_diary.dart';
import 'package:diary/db/user_db_functions.dart';
import 'package:diary/bottom/bootom_navigation.dart';
import 'package:diary/screens/onboarding/first_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     gotoFirstOnboarding(context);
  //   });
  // }
  void initState() {
    super.initState();

    gotoFirstOnboarding(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
            child: Container(
                child: Lottie.asset(
          'assets/animations/Animation - 1709271189307.json',
        ))),
      ),
    );
  }

  // void gotologin(BuildContext context) async {
  //   await Future.delayed(const Duration(seconds: 5));
  // }
}

void gotoFirstOnboarding(BuildContext context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final bool? done = preferences.getBool('value');

  if (done == null || done == false) {
    // Navigate to onboarding screen if the user hasn't completed it yet
    await Future.delayed(const Duration(seconds: 5));
    // ignore: use_build_context_synchronously
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const FirstOnboarding()));
  } else {
    // Navigate to the main app screen if the onboarding is already done
    await getUser(); // Assuming this function is defined elsewhere
    await DiaryDbFunctions()
        .getdiary(); // Assuming this function is defined elsewhere
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const BottomNavigation()));
  }
}
