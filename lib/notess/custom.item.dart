import 'package:diary/db/db_notes.dart';
import 'package:diary/model/notesmodel.dart';
import 'package:diary/notess/notes._showpage.dart';
import 'package:flutter/material.dart';

class NoteItems extends StatefulWidget {
  final NoteModel note;
  const NoteItems({super.key, required this.note});

  @override
  State<NoteItems> createState() => _NoteItemsState();
}

// final DateNotesController = TextEditingController();
// DateTime? notesdate;

class _NoteItemsState extends State<NoteItems> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NotesShowPage(
            noteModel: widget.note,
          );
        }));
      },
      child: Container(
          padding: const EdgeInsets.only(top: 24, bottom: 24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  widget.note.heading,
                  style: const TextStyle(color: Colors.black, fontSize: 26),
                ),
                subtitle: Text(
                  widget.note.subtitle,
                  style: TextStyle(
                      color: Colors.black.withOpacity(.4), fontSize: 20),
                ),
                trailing: IconButton(
                    onPressed: () {
                      _showDeleteConfirmationDialog(context);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                    )),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(15.0),
              //   child: TextFormField(
              //     controller: DateNotesController,
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return "memoryname is required";
              //       }
              //       return null;
              //     },
              //     decoration: InputDecoration(
              //       labelText: 'Memory Date', // This is the label text
              //       prefixIcon: IconButton(
              //         onPressed: () async {
              //           notesdate = await pickDate(true);
              //         },
              //         icon: Icon(Icons.calendar_month),
              //       ),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(8),
              //         // borderSide: BorderSide(color: Colors.white),
              //       ),
              //     ),
              //   ),
              // ),
              Text(
                widget.note.date,
                style: TextStyle(color: Colors.black),
              ),
            ],
          )),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Note"),
          content: const Text("Are you sure you want to delete this note?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Perform delete operation here
                noteDbFunctions().deletenote(widget.note.key);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
//   Future<DateTime?> pickDate(bool startDate) async {
//     DateTime? _picked = await showDatePicker(
//         context: context,
//         firstDate: DateTime(2020),
//         lastDate: DateTime(2050),
//         initialDate: DateTime.now());
//     if (_picked != null) {
//       setState(() {
//         if (startDate) {
//           DateNotesController.text = _picked.toString().split(" ")[0];
//         }
//       });
//       return _picked;
//     }
//     return null;
//   }
// }
