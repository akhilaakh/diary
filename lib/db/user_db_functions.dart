import 'package:diary/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<UserModel>> userListnotifier = ValueNotifier([]);
//adding user
Future addUser(UserModel user) async {
  final Box<UserModel> userBox = await Hive.openBox<UserModel>('user_db');
  await userBox.add(user);
  await getUser();

  await userBox.close();
}

Future getUser() async {
  final Box<UserModel> userBox = await Hive.openBox<UserModel>('user_db');
  print(userBox.length);
  userListnotifier.value.clear();
  userListnotifier.value.addAll(userBox.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  userListnotifier.notifyListeners();
  await userBox.close();
}

Future editUser(UserModel value) async {
  final userVariable = await Hive.openBox<UserModel>('user_db');
  await userVariable.putAt(0, value);
  await userVariable.close();

  getUser();
}
