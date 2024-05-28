import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
          title: const Text(
            '                 app info',
            style: TextStyle(color: Colors.white),
          )),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                'Introducing Journey App: Your Personal Diary and Note-Taking Companion',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Welcome to Journey App, your ultimate destination for capturing life s most precious moments and fleeting ',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'thoughts. Whether you re looking to document your adventures, reflect on your daily experiences, or simply jot',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'down your musings, Journey App is here to accompany you every step of the way.',
                style: TextStyle(fontSize: 15),
              ),
              Text(''),
              Text(
                'Diary for Cherished Memories:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'With Journey App, you can effortlessly chronicle your life s journey. Record your memorable moments, milestones,and ',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'reflections in our intuitive diary feature.From heartwarming stories to significant events, every entry is a timeless treasure waiting to be preserved. Easily edit, delete,and mark favorites to personalize your journey.',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'Notes Section for Random Thoughts:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Capture your spontaneous ideas,calculations,and inspirations in the notes section of Journey App.Whether',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'it s a sudden burst of creativity or a practical reminder, never let a thought slip away. With the same editing and',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'deleting capabilities as the diary, your notes are always within reach,organized and ready for exploration.',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'Gallery for Visual Memories:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Immerse yourself in the visual tapestry of your life with Journey App s gallery feature. Relive your cherished memories through photos and videos, seamlessly integrated into your digital diary.From breathtaking',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'landscapes to candid snapshots, every image tells a story worth revisiting.',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'Calendar with Reminder Functionalities:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Stay organized and never miss a beat with Journey App s built-in calendar and reminder functionalities. Effortlessly schedule events,set reminders, and plan ahead to make the most of every moment. Whether it s an upcoming appointment, anniversary, or deadline, Journey App keeps you on track and in sync with your life.Embark on a journey ',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'of self-discovery,creativity,and reflection with Journey App.Download now and start capturing the essence of your life, one moment at a time. ',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
