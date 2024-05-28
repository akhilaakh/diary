import 'package:hive_flutter/adapters.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String gender;

  @HiveField(2)
  String password;

  @HiveField(3)
  String? photo;

  // ignore: prefer_typing_uninitialized_variables
  static var title;

  // ignore: prefer_typing_uninitialized_variables
  static var writing;
  // ignore: prefer_typing_uninitialized_variables
  static var date;

  // static String title;

  // static String writings;

  UserModel(
      {required this.name,
      required this.gender,
      required this.password,
      this.photo});
}
