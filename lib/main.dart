import 'package:diary/model/diarymodel.dart';
import 'package:diary/model/gallerymodel.dart';
import 'package:diary/model/notesmodel.dart';
import 'package:diary/screens/splash%20screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'model/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(DiaryModelAdapter());
  Hive.registerAdapter(NoteModelAdapter());
  Hive.registerAdapter(GalleryModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
