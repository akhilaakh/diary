import 'package:hive_flutter/adapters.dart';
part 'diarymodel.g.dart';

@HiveType(typeId: 1)
class DiaryModel extends HiveObject {
  @HiveField(0)
  String title; // Corrected typo from 'tittle' to 'title'

  @HiveField(1)
  String writings;

  @HiveField(2)
  String? image;

  @HiveField(3)
  DateTime? date;

  @HiveField(4)
  bool? favourite;

  DiaryModel({
    required this.title,
    required this.writings,
    this.image,
    this.date,
    String? datetime,
    this.favourite,
    // required int key,
  });

  get imagePath => null;
}
