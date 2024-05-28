import 'package:diary/model/notesmodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<NoteModel>> noteNotifierList = ValueNotifier([]);

// ignore: camel_case_types
class noteDbFunctions extends ChangeNotifier {
  //adding diary
  Future addnote(NoteModel notename) async {
    final Box<NoteModel> box = await Hive.openBox('note');
    await box.add(notename);
    await getnote();
    await box.close();
  }

  Future getnote() async {
    final Box<NoteModel> box = await Hive.openBox('note');
    noteNotifierList.value.clear();
    noteNotifierList.value.addAll(box.values);
    noteNotifierList.notifyListeners();
  }

  Future deletenote(int key) async {
    final Box<NoteModel> box = await Hive.openBox('note');
    box.delete(key);
    await getnote();
  }

  Future<void> editNote(int key, NoteModel noteModel) async {
    final Box<NoteModel> box = await Hive.openBox('note');
    await box.put(key, noteModel);
    await getnote();
  }
}

























































  // This assumes you have a getNote() function defined elsewhere.

  // Future EditNotes(int key, NoteModel noteModel) async {
  //   final Box<NoteModel> box = await Hive.openBox('note');
  //   await box.put(note noteModel)
  //   await getnote();
  // }

