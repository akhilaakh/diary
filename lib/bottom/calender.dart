// import 'package:diary/db/db_notes.dart';
// import 'package:diary/db/user_db_functions.dart';
// import 'package:diary/model/notesmodel.dart';
// import 'package:diary/model/user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// // ValueNotifier<List<DiaryModel>> diaryNotifierList = ValueNotifier([]);
// ValueNotifier<List<NoteModel>> NoteNotifierList = ValueNotifier([]);

// class Calender extends StatefulWidget {
//   const Calender({super.key});

//   @override
//   State<Calender> createState() => _CalenderState();
// }

// class _CalenderState extends State<Calender> {
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<List<UserModel>>(
//         valueListenable: userListnotifier,
//         builder: (context, value, _) {
//           var user = value.first;

//           return Scaffold(
//               backgroundColor: Colors.white,
//               appBar: AppBar(
//                 centerTitle: true,
//                 backgroundColor: Color.fromRGBO(77, 75, 72, 1.0),
//                 title: Text(
//                   "${user.name}'S JOURNEY",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               body: SafeArea(
//                   child: Column(
//                 children: [
//                   Text(
//                       'selected Day=' + DateTime.now().toString().split("")[0]),
//                   Container(
//                     child: TableCalendar(
//                       locale: "en_US",
//                       rowHeight: 43,

//                       headerStyle: HeaderStyle(
//                         formatButtonVisible: false,
//                         titleCentered: true,
//                       ),
//                       availableGestures: AvailableGestures.all,
//                       selectedDayPredicate: (day) =>
//                           isSameDay(day, DateTime.now()),
//                       firstDay: DateTime.utc(2010, 10, 28),
//                       lastDay: DateTime.utc(2040, 10, 28),
//                       focusedDay: DateTime.now(),
//                       // onDaySelected: _OnDaySelected,
//                       calendarStyle: CalendarStyle(
//                           todayTextStyle:
//                               TextStyle(fontSize: 20, color: Colors.black26)),
//                     ),
//                   ),
//                 ],
//               )));
//         });
//   }

//   Future getCurrentUsertaskOnSelectedDay(DateTime selecteddate) async {
//     List<NoteModel> allnotes = noteNotifierList.value.toList();
//     List<NoteModel> currentUserTaskOnselectedDay = allnotes
//         .where((notes) => isSameDay(DateTime.parse(notes.date!), selecteddate))
//         .toList();
//     noteNotifierList.value = currentUserTaskOnselectedDay;
//     noteNotifierList.notifyListeners();
//     // currentUserTaskOnSelecteDdayNotifier.value = currentUserTaskOnselectedDay;
//     // currentUserTaskOnSelecteDdayNotifier.notifyListeners();
//   }
// }
//  ValueNotifier<List<NoteModel>> NoteNotifierList = ValueNotifier([]);