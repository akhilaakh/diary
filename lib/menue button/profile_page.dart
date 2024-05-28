import 'dart:io';

import 'package:diary/db/user_db_functions.dart';
import 'package:diary/menue%20button/edit_profile.dart';
import 'package:diary/model/user_model.dart';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<UserModel>>(
        valueListenable: userListnotifier,
        builder: (context, value, _) {
          var user = value.first;

          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                toolbarHeight: 100,
                centerTitle: true,
                backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Text(
                    "${user.name}'S JOURNEY",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfile(
                                  userModel: user,
                                )),
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(40.0),
                child: SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.amberAccent,
                    ),
                    height: 500,
                    width: 500,
                    child: ValueListenableBuilder(
                      valueListenable: userListnotifier,
                      builder: (context, value, child) {
                        // print(value[0].photo!);
                        return Column(
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            SizedBox(
                              height: 60,
                              width: 300,
                              child: CircleAvatar(
                                  backgroundImage: value[0].photo != null
                                      ? FileImage(File(value[0].photo!))
                                          as ImageProvider
                                      : const AssetImage(
                                          'assets/images/Screenshot 2024-03-02 104548.png')),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Colors.white,
                              ),
                              height: 60,
                              width: 300,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  value[0].name,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Colors.white,
                              ),
                              height: 60,
                              width: 300,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  value[0].gender,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ));
        });
  }
}
