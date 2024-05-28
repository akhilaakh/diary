import 'dart:io';

import 'package:diary/db/user_db_functions.dart';
import 'package:diary/model/user_model.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bottom/bootom_navigation.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // ignore: non_constant_identifier_names
  final UsernameController = TextEditingController();
  // ignore: non_constant_identifier_names
  final UsergenderController = TextEditingController();
  final userpasswordController = TextEditingController();
  final userpasswordconfirmController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();
  String image = "";
  bool obscuretext = true;
  bool obscuretext2 = true;
  final formkey = GlobalKey<FormState>();
  late String sign;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Stack(children: [
                      Image.asset(
                        'assets/images/Screenshot 2024-03-13 123332.png',
                        height: height * 0.5,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 100, left: 150),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: const Color.fromARGB(255, 255, 7, 7),
                          backgroundImage: _image != null
                              ? FileImage(_image!) as ImageProvider
                              : const AssetImage(
                                  'assets/images/Screenshot 2024-03-02 104548.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 170, left: 200),
                        child: IconButton(
                            onPressed: _getImage,
                            icon: const Icon(
                              Icons.image,
                              size: 32,
                            )),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: TextFormField(
                        controller: UsernameController,
                        decoration: const InputDecoration(
                            fillColor: Colors.orange,
                            filled: true,
                            border: OutlineInputBorder(),
                            hintText: 'Enter your name',
                            label: Text('name')),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'name is Empty';
                          } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                            return 'name must contain only alphabets';
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          fillColor: Colors.orange,
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: 'Enter your gender',
                          label: Text('Gender'),
                        ),
                        value: UsergenderController.text.isNotEmpty
                            ? UsergenderController.text
                            : null,
                        items: <String>['MALE', 'FEMALE', 'OTHER']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            UsergenderController.text = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Gender is Empty';
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: TextFormField(
                        controller: userpasswordController,
                        obscureText: obscuretext,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscuretext = !obscuretext;
                                  });
                                },
                                icon: Icon(obscuretext
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility)),
                            fillColor: Colors.orange,
                            filled: true,
                            border: const OutlineInputBorder(),
                            hintText: 'Enter your password',
                            label: const Text('password')),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is Empty';
                          } else if (!RegExp(r'^\d{4}$').hasMatch(value)) {
                            return 'password must be exactly 4 digits';
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: TextFormField(
                        controller: userpasswordconfirmController,
                        obscureText: obscuretext2,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscuretext2 = !obscuretext2;
                                });
                              },
                              icon: Icon(obscuretext2
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility),
                            ),
                            fillColor: Colors.orange,
                            filled: true,
                            border: const OutlineInputBorder(),
                            hintText: ' enter your confirm password',
                            label: const Text('confirm password')),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm Password is empty';
                          } else if (userpasswordController.text != value) {
                            return 'Passwords do not match';
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 29,
                ),
                Stack(children: [
                  Image.asset(
                    'assets/images/Screenshot 2024-03-13 105824.png',
                    height: height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () async {
                          sign = 'create';
                          addUserOnpressed();
                        },
                        icon: const Icon(Icons.check),
                        label: const Text(
                          'create',
                          style: TextStyle(
                              height: 1, color: Colors.black, fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber),
                      ),
                    ],
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future addUserOnpressed() async {
    if (formkey.currentState!.validate()) {
      UserModel userr = UserModel(
          name: UsernameController.text.trim(),
          gender: UsergenderController.text.trim(),
          password: userpasswordController.text.trim(),
          photo: _image?.path);
      signcheck();

      await addUser(userr).then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const BottomNavigation()),
          ));
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

  Future<void> signcheck() async {
    if (sign.isNotEmpty) {
      SharedPreferences prefrence = await SharedPreferences.getInstance();
      prefrence.setBool('value', true);
    }
  }
}
