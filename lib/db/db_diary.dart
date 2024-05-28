import 'package:diary/model/diarymodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<DiaryModel>> diaryNotifierList = ValueNotifier([]);
ValueNotifier<List<DiaryModel>> favouriteNotifierList = ValueNotifier([]);

class DiaryDbFunctions extends ChangeNotifier {
  //adding diary
  Future addtitle(DiaryModel diaryname) async {
    final Box<DiaryModel> box = await Hive.openBox('diary');
    await box.add(diaryname);
    await getdiary();
    await box.close();
  }

  //getting diary
  Future getdiary() async {
    final Box<DiaryModel> box = await Hive.openBox('diary');
    diaryNotifierList.value.clear();
    diaryNotifierList.value.addAll(box.values);
    diaryNotifierList.notifyListeners();
  }

  Future deletediary(int key) async {
    final Box<DiaryModel> box = await Hive.openBox('diary');
    box.delete(key);
    await getdiary();
  }

  Future editdiary(int key, DiaryModel diaryModel) async {
    final Box<DiaryModel> box = await Hive.openBox('diary');
    await box.put(key, diaryModel);
    await getdiary();
    await favourit();
  }

  Future favourit() async {
    final Box<DiaryModel> box = await Hive.openBox('diary');
    List<DiaryModel> alldiary = box.values.toList();
    List<DiaryModel> favoriteEntries =
        alldiary.where((entry) => entry.favourite == true).toList();
    print(favoriteEntries.length);
    favouriteNotifierList.value.clear();
    favouriteNotifierList.value.addAll(favoriteEntries);

    favouriteNotifierList.notifyListeners();
    return favoriteEntries;
  }

  void unfavoritEntry(int index) {}
}
