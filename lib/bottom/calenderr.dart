// ignore_for_file: non_constant_identifier_names, invalid_use_of_visible_for_testing_member

import 'package:diary/db/db_notes.dart';
import 'package:diary/model/notesmodel.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../notess/notes._showpage.dart';

ValueNotifier<List<NoteModel>> NoteNotifierList = ValueNotifier([]);

// ignore: camel_case_types
class calenderr extends StatefulWidget {
  const calenderr({
    super.key,
  });

  @override
  State<calenderr> createState() => _calenderrState();
}

// ignore: camel_case_types
class _calenderrState extends State<calenderr> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime Day, DateTime focusedDay) async {
    setState(() {
      today = Day;
    });
    await getCurrentUsertaskOnSelectedDay(today);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
        title: const Padding(
          padding: EdgeInsets.all(110.0),
          child: Text(
            ' My Calender',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Today's   ${today.toString().split(" ")[0]}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TableCalendar(
                locale: "en_US",
                rowHeight: 30,
                headerStyle: const HeaderStyle(
                    formatButtonVisible: false, titleCentered: true),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 10, 18),
                onDaySelected: _onDaySelected),
            ValueListenableBuilder(
                valueListenable: noteNotifierList,
                builder: (context, value, child) => value.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.all(100.0),
                        child: Text(
                          'No Notes In This Date',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      )
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ListView.builder(
                              itemCount: value.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  NotesShowPage(
                                                      noteModel:
                                                          value[index])));
                                    },
                                    child: Container(
                                      // child: Text(value[index].date),

                                      height: 100,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color: Colors.orange,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          ListTile(
                                            title: Text(value[index].heading),
                                            subtitle:
                                                Text(value[index].subtitle),
                                            trailing: Text(value[index].date),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      )),
          ],
        ),
      ),
    );
  }

  Future getCurrentUsertaskOnSelectedDay(DateTime selecteddate) async {
    await noteDbFunctions().getnote();
    List<NoteModel> allnotes = noteNotifierList.value.toList();
    List<NoteModel> currentUserTaskOnselectedDay = allnotes
        .where((notes) => isSameDay(DateTime.parse(notes.date), selecteddate))
        .toList();
    noteNotifierList.value = currentUserTaskOnselectedDay;
    // ignore: invalid_use_of_protected_member
    noteNotifierList.notifyListeners();
    // currentUserTaskOnSelecteDdayNotifier.value = currentUserTaskOnselectedDay;
    // currentUserTaskOnSelecteDdayNotifier.notifyListeners();
  }
}
