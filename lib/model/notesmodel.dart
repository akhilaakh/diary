import 'package:hive_flutter/hive_flutter.dart';
part 'notesmodel.g.dart';

@HiveType(typeId: 2)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String heading;
  @HiveField(1)
  final String subtitle;
  @HiveField(2)
  final String date;

  NoteModel(
      {required this.heading,
      required this.subtitle,
      required this.date,
      required String title});
}
