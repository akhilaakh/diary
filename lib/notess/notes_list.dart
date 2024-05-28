import 'package:diary/db/db_notes.dart';
import 'package:diary/notess/custom.item.dart';
import 'package:flutter/material.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  final data = const [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ValueListenableBuilder(
          valueListenable: noteNotifierList,
          builder: (context, value, _) {
            return ListView.builder(
              itemCount: value.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: NoteItems(
                    note: value[index],
                  ),
                );
              },
            );
          }),
    );
  }
}
