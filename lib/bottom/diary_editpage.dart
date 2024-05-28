import 'dart:io';
import 'package:diary/db/db_diary.dart';
import 'package:diary/db/user_db_functions.dart';
import 'package:diary/model/diarymodel.dart';
import 'package:diary/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';

class DiaryEditPage extends StatefulWidget {
  final DiaryModel diaryModel;

  const DiaryEditPage({required this.diaryModel, Key? key}) : super(key: key);

  @override
  State<DiaryEditPage> createState() => DiaryEditPageState();
}

class DiaryEditPageState extends State<DiaryEditPage> {
  final ImagePicker _picker = ImagePicker();
  final bool _isImageEnlarged = false;

  // ignore: non_constant_identifier_names
  final TextEditingController UsertitleController = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController UserwitingController = TextEditingController();

  late String image;
  late DiaryModel diaryModel;
  final formkey = GlobalKey<FormState>();
  late DateTime _dateTime;

  DateTime _selectedDate = DateTime.now();

  void datePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      initialDate: diaryModel.date,
    ).then((value) {
      if (value != null) {
        setState(() {
          _selectedDate = value;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    UsertitleController.text = widget.diaryModel.title;
    UserwitingController.text = widget.diaryModel.writings;
    image = widget.diaryModel.image ?? '';
    diaryModel = widget.diaryModel;
    _dateTime = widget.diaryModel.date!;
    _selectedDate = _dateTime;
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
                      width: 1000,
                      child: Form(
                        key: formkey,
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                DateFormat('dd-MM-yyy').format(_selectedDate),
                                style: const TextStyle(fontSize: 20),
                              ),
                              MaterialButton(
                                onPressed: datePicker,
                                color: Colors.amber,
                                child: const Icon(Icons.calendar_month_sharp),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextFormField(
                                  controller: UsertitleController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                ),
                              ),
                              SingleChildScrollView(
                                child: TextFormField(
                                  controller: UserwitingController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(),
                                ),
                              ),
                              IconButton(
                                  onPressed: _getImage,
                                  icon: const Icon(Icons.image)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Spacer(),
                                  const Spacer(),
                                  ElevatedButton.icon(
                                    onPressed: () async {
                                      diaryModel.date = _selectedDate;
                                      diaryModel.image = image;
                                      diaryModel.title =
                                          UsertitleController.text;
                                      diaryModel.writings =
                                          UserwitingController.text;
                                      await updateuser(diaryModel.key, context,
                                          formkey, diaryModel);
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
                                  const SizedBox(width: 15),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PhotoView(
                                                imageProvider:
                                                    FileImage(File(image)))),
                                      );
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      width: _isImageEnlarged ? 200 : 60,
                                      height: _isImageEnlarged ? 200 : 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.amber,
                                        image: image.isNotEmpty
                                            ? DecorationImage(
                                                image: FileImage(File(image)),
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
                ),
              ));
        });
  }

  Future<void> _getImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 40);

    if (pickedFile != null) {
      setState(() {
        image = pickedFile.path;
      });
    }
  }

  void updateDate(DateTime value) {}

  Future<void> updateuser(int key, BuildContext context,
      GlobalKey<FormState> formkey, DiaryModel diaryModel) async {
    if (formkey.currentState!.validate()) {
      await DiaryDbFunctions()
          .editdiary(key, diaryModel)
          .then((value) => Navigator.pop(context, diaryModel));
    }
  }
}






















// import 'dart:io';
// import 'package:diary/bottom/diary_viewpage.dart';
// import 'package:diary/db/db_diary.dart';
// import 'package:diary/db/user_db_functions.dart';
// import 'package:diary/model/diarymodel.dart';
// import 'package:diary/model/user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:photo_view/photo_view.dart';

// class DiaryEditPage extends StatefulWidget {
//   DiaryModel diaryModel;

//   DiaryEditPage({required this.diaryModel, Key? key}) : super(key: key);

//   @override
//   State<DiaryEditPage> createState() => DiaryEditPageState();
// }

// class DiaryEditPageState extends State<DiaryEditPage> {
//   final ImagePicker _picker = ImagePicker();
//   bool _isImageEnlarged = false;

//   final UsertitleController = TextEditingController();
//   final UserwitingController = TextEditingController();

//   late String image = '';
//   late DiaryModel diaryModel;
//   final formkey = GlobalKey<FormState>();
//   late String title;
//   // late String date;
//   late final DiaryModel index;
//   late final DateTime date;

//   DateTime _dateTime = DateTime.now();
//   void datePicker() {
//     showDatePicker(
//       context: context,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2025),
//       initialDate: diaryModel.date,
//     ).then((value) {
//       if (value != null) {
//         updateDate(value);
//       }
//       setState(() {
//         _dateTime = value!;
//       });
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     UsertitleController.text = widget.diaryModel.title;
//     UserwitingController.text = widget.diaryModel.writings;
//     image = widget.diaryModel.image ?? '';
//     diaryModel = widget.diaryModel;
//     _dateTime = widget.diaryModel.date!;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<List<UserModel>>(
//         valueListenable: userListnotifier,
//         builder: (context, value, _) {
//           print(diaryModel.key);
//           var user = value.first;
//           return Scaffold(
//               backgroundColor: Colors.white,
//               appBar: AppBar(
//                 toolbarHeight: 100,
//                 centerTitle: true,
//                 backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
//                 title: Padding(
//                   padding: const EdgeInsets.only(bottom: 50),
//                   child: Text(
//                     "${user.name}'S JOURNEY",
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               body: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(9.0),
//                   child: Center(
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                         color: Colors.amberAccent,
//                       ),
//                       // height: 670,
//                       width: 1000,
//                       child: Form(
//                         key: formkey,
//                         child: Center(
//                           child: Column(
//                             children: [
//                               Text(
//                                 DateFormat('dd-MM-yyy').format(_dateTime),
//                                 style: const TextStyle(fontSize: 20),
//                               ),
//                               MaterialButton(
//                                 onPressed: () {
//                                   datePicker();
//                                 },
//                                 color: Colors.amber,
//                                 child: const Icon(Icons.calendar_month_sharp),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(15.0),
//                                 child: TextFormField(
//                                   controller: UsertitleController,
//                                   autovalidateMode:
//                                       AutovalidateMode.onUserInteraction,
//                                 ),
//                               ),
//                               SingleChildScrollView(
//                                 child: TextFormField(
//                                   controller: UserwitingController,
//                                   autovalidateMode:
//                                       AutovalidateMode.onUserInteraction,
//                                   // Set maxLines to null to allow unlimited lines
//                                   keyboardType: TextInputType
//                                       .multiline, // Set keyboardType to allow multiline input
//                                   decoration: const InputDecoration(),
//                                 ),
//                               ),
//                               // const SizedBox(height: 300),
//                               IconButton(
//                                   onPressed: _getImage,
//                                   icon: const Icon(Icons.image)),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   const Spacer(),
//                                   const Spacer(),
//                                   ElevatedButton.icon(
//                                     onPressed: () async {
//                                       diaryModel.date = _dateTime;
//                                       diaryModel.image = image;
//                                       diaryModel.title =
//                                           UsertitleController.text;
//                                       diaryModel.writings =
//                                           UserwitingController.text;
//                                       await updateuser(diaryModel.key, context,
//                                           formkey, diaryModel);
//                                     },
//                                     icon: const Icon(Icons.check),
//                                     label: const Text(
//                                       'Save',
//                                       style: TextStyle(
//                                           height: 2,
//                                           fontSize: 20,
//                                           color: Colors.black),
//                                     ),
//                                     style: ElevatedButton.styleFrom(
//                                         backgroundColor: Colors.amber),
//                                   ),
//                                   const SizedBox(
//                                     width: 15,
//                                   ),
//                                   GestureDetector(
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) => PhotoView(
//                                                 imageProvider:
//                                                     FileImage(File(image)))
//                                             // FullScreenImage(imagepath: image),
//                                             ),
//                                       );
//                                       // setState(() {
//                                       //   _isImageEnlarged = !_isImageEnlarged;
//                                       // });
//                                     },
//                                     child: AnimatedContainer(
//                                       duration:
//                                           const Duration(milliseconds: 300),
//                                       width: _isImageEnlarged ? 200 : 60,
//                                       height: _isImageEnlarged ? 200 : 60,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(20),
//                                         color: Colors.amber,
//                                         image: image.isNotEmpty
//                                             ? DecorationImage(
//                                                 image: FileImage(File(image)),
//                                                 fit: BoxFit.cover,
//                                               )
//                                             : null,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ));
//         });
//   }

//   Future<void> _getImage() async {
//     final XFile? pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery, imageQuality: 40);

//     if (pickedFile != null) {
//       setState(() {});
//     }
//     image = pickedFile!.path;
//   }

//   saving() async {
//     if (UsertitleController.text.isEmpty) {
//     } else {
//       final title = UsertitleController.text.trim();
//       final writings = UserwitingController.text.trim();
//       await DiaryDbFunctions().addtitle(DiaryModel(
//         title: title,
//         writings: writings,
//         date: _dateTime,
//         image: image,
//       ));
//       // print(writings);

//       // ignore: use_build_context_synchronously
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//             builder: (context) => DiaryViewPage(
//                   index: diaryModel,
//                 )),
//       );
//     }
//   }

//   void updateDate(DateTime value) {}
// }

// updateuser(int key, BuildContext context, GlobalKey<FormState> formkey,
//     DiaryModel diaryModel) async {
//   // ignore: prefer_typing_uninitialized_variables
//   if (formkey.currentState!.validate()) {
//     // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables

//     await DiaryDbFunctions()
//         .editdiary(key, diaryModel)
//         .then((value) => Navigator.pop(context, diaryModel));
//   }
// }

















// updateuser() async {
//     if (formkey.currentState!.validate()) {
//       userModel.name = usernameController.text;

//       userModel.gender = usergenderController.text;
//     }
//   }
// }

// UsertitleController.text = widget.diaryModel.title;

// import 'dart:io';
// import 'package:diary/bottom/bootom_navigation.dart';
// import 'package:diary/bottom/fullscreen_image.dart';
// import 'package:diary/db/db_diary.dart';
// import 'package:diary/db/user_db_functions.dart';
// import 'package:diary/model/diarymodel.dart';
// import 'package:diary/model/user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'full_screen_image_page.dart'; // Import the FullScreenImagePage

// class DiaryEditPage extends StatefulWidget {
//   DiaryModel diaryModel;

//   DiaryEditPage({required this.diaryModel, Key? key}) : super(key: key);

//   @override
//   State<DiaryEditPage> createState() => DiaryEditPageState();
// }

// class DiaryEditPageState extends State<DiaryEditPage> {
//   File? _image;
//   final ImagePicker _picker = ImagePicker();
//   bool _isImageEnlarged = false;
//   final UsertitleController = TextEditingController();
//   final UserwitingController = TextEditingController();
//   late String image;
//   late DiaryModel diaryModel;

//   DateTime _dateTime = DateTime.now();
//   void datePicker() {
//     showDatePicker(
//       context: context,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2025),
//       initialDate: DateTime.now(),
//     ).then((value) {
//       setState(() {
//         _dateTime = value!;
//       });
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState

//     UsertitleController.text = widget.diaryModel.title;
//     UserwitingController.text = widget.diaryModel.writings;
//     image = widget.diaryModel.image ?? '';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<List<UserModel>>(
//         valueListenable: userListnotifier,
//         builder: (context, value, _) {
//           var user = value.first;
//           return Scaffold(
//               backgroundColor: Colors.white,
//               appBar: AppBar(
//                 toolbarHeight: 100,
//                 centerTitle: true,
//                 backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
//                 title: Padding(
//                   padding: const EdgeInsets.only(bottom: 50),
//                   child: Text(
//                     "${user.name}'S JOURNEY",
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               body: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(9.0),
//                   child: Center(
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                         color: Colors.amberAccent,
//                       ),
//                       // height: 670,
//                       width: 1000,
//                       child: Center(
//                         child: Column(
//                           children: [
//                             Text(
//                               DateFormat('dd-MM-yyy').format(_dateTime),
//                               style: const TextStyle(fontSize: 20),
//                             ),
//                             MaterialButton(
//                               onPressed: () {
//                                 datePicker();
//                               },
//                               color: Colors.amber,
//                               child: const Icon(Icons.calendar_view_month),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(15.0),
//                               child: TextFormField(
//                                 controller: UsertitleController,
//                                 autovalidateMode:
//                                     AutovalidateMode.onUserInteraction,
//                               ),
//                             ),
//                             SingleChildScrollView(
//                               child: TextFormField(
//                                 controller: UserwitingController,
//                                 autovalidateMode:
//                                     AutovalidateMode.onUserInteraction,
//                                 // Set maxLines to null to allow unlimited lines
//                                 keyboardType: TextInputType
//                                     .multiline, // Set keyboardType to allow multiline input
//                                 decoration: InputDecoration(),
//                               ),
//                             ),
//                             const SizedBox(height: 300),
//                             IconButton(
//                                 onPressed: _viewImage, // Change this line
//                                 icon: const Icon(Icons.image)),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Spacer(),
//                                 const Spacer(),
//                                 ElevatedButton.icon(
//                                   onPressed: () async {
//                                     saving();
//                                   },
//                                   icon: const Icon(Icons.check),
//                                   label: const Text(
//                                     'Save',
//                                     style: TextStyle(
//                                         height: 2,
//                                         fontSize: 20,
//                                         color: Colors.black),
//                                   ),
//                                   style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.amber),
//                                 ),
//                                 const SizedBox(
//                                   width: 15,
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       _isImageEnlarged = !_isImageEnlarged;
//                                     });
//                                   },
//                                   child: AnimatedContainer(
//                                     duration: const Duration(milliseconds: 300),
//                                     width: _isImageEnlarged ? 200 : 60,
//                                     height: _isImageEnlarged ? 200 : 60,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       color: Colors.amber,
//                                       image: image.isNotEmpty
//                                           ? DecorationImage(
//                                               image: FileImage(File(image)),
//                                               fit: BoxFit.cover,
//                                             )
//                                           : null,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ));
//         });
//   }

//   Future<void> _getImage() async {
//     final XFile? pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery, imageQuality: 40);

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//     image = pickedFile!.path;
//   }

//   void _viewImage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => FileImage(File(image)),
//       ),
//     );
//   }

//   saving() async {
//     if (UsertitleController.text.isEmpty) {
//     } else {
//       final title = UsertitleController.text.trim();
//       final writings = UserwitingController.text.trim();
//       await DiaryDbFunctions().addtitle(DiaryModel(
//           title: title, writings: writings, date: _dateTime, image: image));
//       // print(writings);

//       // ignore: use_build_context_synchronously
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const BottomNavigation()),
//       );
//     }
//   }
// }
