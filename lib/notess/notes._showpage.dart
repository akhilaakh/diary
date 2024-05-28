import 'package:diary/model/notesmodel.dart';
import 'package:diary/notess/edit_notess.dart';
import 'package:flutter/material.dart';

class NotesShowPage extends StatefulWidget {
  final NoteModel noteModel;

  const NotesShowPage({super.key, required this.noteModel});

  @override
  State<NotesShowPage> createState() => _NotesShowPageState();
}

class _NotesShowPageState extends State<NotesShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
        title: const Text(
          'Notes',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigate to the edit page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditNotes(noteModel: widget.noteModel),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          alignment: Alignment.topLeft,
          decoration: const BoxDecoration(
            color: Colors.orange,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                ),
                Text(
                  widget.noteModel.date,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  widget.noteModel.heading,
                  style: const TextStyle(fontSize: 25),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          widget.noteModel.subtitle,
                          style: const TextStyle(fontSize: 20),
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
