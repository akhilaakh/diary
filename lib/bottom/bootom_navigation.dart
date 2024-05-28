import 'package:diary/bottom/calenderr.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:diary/bottom/add.dart';
import 'package:diary/bottom/favourite.dart';
import 'package:diary/bottom/home_page.dart';
import 'package:diary/bottom/photos.dart';

void main() => runApp(const MaterialApp(home: BottomNavigation()));

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late List<Widget> _page;

  @override
  void initState() {
    super.initState();
    _page = [
      const HomePage(),
      const Favourite(),
      const Add(),
      calenderr(),
      const Photos(),
    ];
  }

  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: currentindex,
        height: 60.0,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Color.fromARGB(255, 224, 158, 16),
          ),
          Icon(
            Icons.favorite,
            size: 30,
            color: Color.fromARGB(255, 224, 158, 16),
          ),
          Icon(
            Icons.add,
            size: 30,
            color: Color.fromARGB(255, 224, 158, 16),
          ),
          Icon(
            Icons.calendar_month_outlined,
            size: 30,
            color: Color.fromARGB(255, 224, 158, 16),
          ),
          Icon(
            Icons.photo,
            size: 30,
            color: Color.fromARGB(255, 224, 158, 16),
          ),
        ],
        color: const Color.fromRGBO(77, 75, 72, 1.0),
        buttonBackgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
      ),
      body: _page[currentindex],
    );
  }
}



































// import 'package:diary/bottom/add.dart';
// import 'package:diary/bottom/calender.dart';
// import 'package:diary/bottom/favourite.dart';
// import 'package:diary/bottom/home_page.dart';
// import 'package:diary/bottom/photos.dart';
// import 'package:diary/model/diarymodel.dart';
// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// void main() => runApp(const MaterialApp(home: BottomNavigation()));

// class BottomNavigation extends StatefulWidget {
//   const BottomNavigation({Key? key}) : super(key: key);

//   @override
//   State<BottomNavigation> createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation> {
//   late List _page;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _page = [
//       const HomePage(),
//       const Favourite(),
//       const Add(),
//       const Calender(),
//       const Photos(),
//     ];
//   }

//   int currentindex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         index: currentindex,
//         height: 60.0,
//         items: const <Widget>[
//           Icon(
//             Icons.home,
//             size: 30,
//             color: Color.fromARGB(255, 224, 158, 16),
//           ),
//           Icon(
//             Icons.favorite,
//             size: 30,
//             color: Color.fromARGB(255, 224, 158, 16),
//           ),
//           Icon(
//             Icons.add,
//             size: 30,
//             color: Color.fromARGB(255, 224, 158, 16),
//           ),
//           Icon(
//             Icons.calendar_view_day_rounded,
//             size: 30,
//             color: Color.fromARGB(255, 224, 158, 16),
//           ),
//           Icon(
//             Icons.photo,
//             size: 30,
//             color: Color.fromARGB(255, 224, 158, 16),
//           ),
//         ],
//         color: const Color.fromRGBO(77, 75, 72, 1.0),
//         buttonBackgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
//         backgroundColor: Colors.white,
//         animationCurve: Curves.easeInOut,
//         animationDuration: const Duration(milliseconds: 300),
//         onTap: (index) {
//           setState(() {
//             currentindex = index;
//           });
//         },
//       ),
//       body: _page[currentindex],
//     );
//   }
// }
