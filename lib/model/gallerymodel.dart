import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
part 'gallerymodel.g.dart';

@HiveType(typeId: 3)
class GalleryModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String date;
  @HiveField(2)
  List<String>? memoryimage;
  @HiveField(3)
  int? id;
  GalleryModel(
      {required this.date,
      required this.memoryimage,
      required this.name,
      this.id});
}
