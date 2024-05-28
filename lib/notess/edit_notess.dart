import 'package:diary/db/db_notes.dart';
import 'package:diary/model/notesmodel.dart';
import 'package:diary/notess/custom.item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditNotes extends StatefulWidget {
  NoteModel noteModel;

  EditNotes({super.key, required this.noteModel});

  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  final headingController = TextEditingController();

  final subtitleController = TextEditingController();
  final dateController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  DateTime? notedate;
  @override
  void initState() {
    super.initState();

    //  UserwitingController.text = widget.diaryModel.writings;
    headingController.text = widget.noteModel.heading;
    subtitleController.text = widget.noteModel.subtitle;
    dateController.text = widget.noteModel.date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
        title: const Text(
          'EDITNOTE',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.check_box,
              color: Colors.white,
            ), // Change the icon as needed
            onPressed: () {
              updatenote(
                  widget.noteModel.key,
                  context,
                  formkey,
                  NoteModel(
                      heading: headingController.text,
                      subtitle: subtitleController.text,
                      date: dateController.text,
                      title: ''));
            },
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: noteNotifierList,
        builder: (context, value, child) {
          return Form(
            key: formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(''),
                      TextFormField(
                        controller: dateController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Memory date is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            onPressed: () async {
                              notedate = await pickDate(true, context);
                            },
                            icon: const Icon(Icons.calendar_month),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: headingController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        //       borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: subtitleController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        //       borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: 'content',
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  updatenote(int key, BuildContext context, GlobalKey<FormState> formkey,
      NoteModel noteModel) async {
    // ignore: prefer_typing_uninitialized_variables
    if (formkey.currentState!.validate()) {
      // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables

      await noteDbFunctions()
          .editNote(key, noteModel)
          .then((value) => Navigator.pop(context, NoteItems(note: noteModel)));
    }
  }

  Future<DateTime?> pickDate(bool startDate, BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        if (startDate) {
          dateController.text = picked.toString().split(" ")[0];
        }
      });
      return picked;
    }
    return null;
  }
}

// import 'package:diary/db/user_db_functions.dart';
// import 'package:diary/model/user_model.dart';
// import 'package:flutter/material.dart';

// class EditNewViewBody extends StatefulWidget {
//   const EditNewViewBody({super.key});

//   @override
//   State<EditNewViewBody> createState() => _EditNewViewBodyState();
// }

// class _EditNewViewBodyState extends State<EditNewViewBody> {
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
//               body: SingleChildScrollView(
//                   child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                       ))));
//         });
//   }

