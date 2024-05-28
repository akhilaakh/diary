import 'dart:io';
import 'package:diary/db/user_db_functions.dart';
import 'package:diary/menue%20button/profile_page.dart';
import 'package:diary/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class EditProfile extends StatefulWidget {
  UserModel userModel;
  EditProfile({required this.userModel, super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late UserModel userModel;

  late TextEditingController usernameController;
  late TextEditingController usergenderController;
  // ignore: non_constant_identifier_names
  get UsernameController => null;
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    userModel = widget.userModel;
    usernameController = TextEditingController(text: userModel.name);
    usergenderController = TextEditingController(text: userModel.gender);

    // ignore: unused_local_variable

    super.initState();
  }

  File? _image;
  final ImagePicker _picker = ImagePicker();
  String image = "";

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<UserModel>>(
        valueListenable: userListnotifier,
        builder: (context, value, _) {
          var user = value.first;

          return Scaffold(
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
                            GestureDetector(
                              onTap: () {
                                _getImage();
                              },
                              child: SizedBox(
                                height: 60,
                                width: 300,
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: _image != null
                                      ? FileImage(_image!)
                                      : userModel.photo != null &&
                                              userModel.photo!.isNotEmpty
                                          ? FileImage(File(userModel.photo!))
                                          : const AssetImage(
                                                  'assets/images/download.jpeg')
                                              as ImageProvider,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Form(
                              key: formkey,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: TextFormField(
                                  controller: usernameController,
                                  decoration: const InputDecoration(
                                    hintText: 'name',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(),
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: const OutlineInputBorder(),
                                hintText: value[0].gender,
                              ),
                              items: <String>[
                                'MALE',
                                'FEMALE',
                                'OTHER',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  usergenderController.text = newValue!;
                                });
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(43.0),
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Discard'),
                                  ),
                                  const SizedBox(width: 40),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await updateuser();
                                      Navigator.pop(context);
                                      // ignore: use_build_context_synchronously
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Profile()));
                                    },
                                    child: const Text('Save'),
                                  ),
                                ],
                              ),
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

  updateuser() async {
    if (formkey.currentState!.validate()) {
      userModel.name = usernameController.text;
      userModel.gender = usergenderController.text;
      userModel.photo = _image?.path;
    }
  }

  Future<void> _getImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 40);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
}
