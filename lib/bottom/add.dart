import 'dart:io';
import 'package:diary/bottom/bootom_navigation.dart';
import 'package:diary/db/db_diary.dart';
import 'package:diary/db/user_db_functions.dart';
import 'package:diary/model/diarymodel.dart';
import 'package:diary/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool _isImageEnlarged = false;
  // ignore: non_constant_identifier_names
  final UsertitleController = TextEditingController();
  // ignore: non_constant_identifier_names
  final WritingController = TextEditingController();
  late String image;
  final bool _isFavorite = false;

  DateTime _dateTime = DateTime.now();
  void datePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      initialDate: DateTime.now(),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

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
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.amberAccent,
                      ),
                      // height: 670,
                      width: 1000,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              DateFormat('dd-MM-yyy').format(_dateTime),
                              style: const TextStyle(fontSize: 20),
                            ),
                            MaterialButton(
                              onPressed: () {
                                datePicker();
                              },
                              color: Colors.amber,
                              child: const Icon(Icons.calendar_view_month),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                controller: UsertitleController,
                                decoration: const InputDecoration(
                                    hintText: 'title....',
                                    hintStyle: TextStyle(fontSize: 20)),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                            SingleChildScrollView(
                              child: TextFormField(
                                controller: WritingController,
                                maxLines:
                                    null, // Set maxLines to null to allow unlimited lines
                                keyboardType: TextInputType
                                    .multiline, // Set keyboardType to allow multiline input
                                decoration: const InputDecoration(
                                  hintText: 'Type here...',
                                ),
                              ),
                            ),
                            // const SizedBox(height: 300),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                // IconButton(
                                //   onPressed: () {
                                //     setState(() {
                                //       _isFavorite = !_isFavorite;
                                //     });
                                //   },
                                //   icon: Icon(
                                //     Icons.favorite_border,
                                //     color: _isFavorite ? Colors.red : null,
                                //   ),
                                // ),
                                IconButton(
                                  onPressed: _getImage,
                                  icon: const Icon(Icons.image),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Spacer(),
                                const Spacer(),
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    saving();
                                  },
                                  icon: const Icon(Icons.check),
                                  label: const Text(
                                    'Save',
                                    style: TextStyle(
                                        height: 2,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.amber),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isImageEnlarged = !_isImageEnlarged;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    width: _isImageEnlarged ? 200 : 60,
                                    height: _isImageEnlarged ? 200 : 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.amber,
                                      image: _image != null
                                          ? DecorationImage(
                                              image: FileImage(_image!),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        });
  }

  Future<void> _getImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 40);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
    image = pickedFile!.path;
  }

  saving() async {
    if (UsertitleController.text.isEmpty) {
    } else {
      final title = UsertitleController.text.trim();
      final writings = WritingController.text.trim();
      await DiaryDbFunctions().addtitle(DiaryModel(
          title: title,
          writings: writings,
          date: _dateTime,
          image: image,
          favourite: _isFavorite));
      // print(writings);

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavigation()),
      );
    }
  }
}
