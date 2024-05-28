import 'dart:io';
import 'package:diary/bottom/diary_editpage.dart';
import 'package:diary/db/db_diary.dart';
import 'package:diary/db/user_db_functions.dart';
import 'package:diary/model/diarymodel.dart';
import 'package:diary/model/user_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DiaryViewPage extends StatefulWidget {
  DiaryModel index;

  DiaryViewPage({super.key, required this.index});

  @override
  State<DiaryViewPage> createState() => _DiaryViewPageState();
}

class _DiaryViewPageState extends State<DiaryViewPage> {
  late DiaryModel diaryModel;

  @override
  void initState() {
    diaryModel = widget.index;

    super.initState();
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
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DiaryEditPage(diaryModel: diaryModel)),
                    ).then((value) {
                      setState(() {
                        diaryModel = value;
                      });
                    });
                  },
                  icon: const Icon(Icons.edit),
                  color: Colors.white,
                )
              ],
            ),
            body: ValueListenableBuilder(
              valueListenable: diaryNotifierList,
              builder: (context, value, child) {
                // print(diaryModel.key);
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        color: Colors.orange,
                      ),
                      // height: 500,
                      width: 2000,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${diaryModel.date?.year}/${diaryModel.date?.month}/${diaryModel.date?.day}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            Text(
                              diaryModel.title,
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(
                              diaryModel.writings,
                            ),
                            Container(
                                height: 100,
                                color: Colors.blue,
                                child: diaryModel.image != null
                                    ? Image.file(
                                        File(diaryModel.image!),
                                        height: 200,
                                        width: 200,
                                        fit: BoxFit.cover,
                                      )
                                    : const SizedBox())
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}








































// // ignore: must_be_immutable
// class DiaryViewPage extends StatefulWidget {
//   DiaryModel index;

//   DiaryViewPage({super.key, required this.index});

//   @override
//   State<DiaryViewPage> createState() => _DiaryViewPageState();
// }

// class _DiaryViewPageState extends State<DiaryViewPage> {
//   late DiaryModel diaryModel;

//   @override
//   void initState() {
//     diaryModel = widget.index;
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<List<UserModel>>(
//         valueListenable: userListnotifier,
//         builder: (context, value, _) {
//           var user = value.first;

//           return Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               toolbarHeight: 100,
//               centerTitle: true,
//               backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
//               title: Padding(
//                 padding: const EdgeInsets.only(bottom: 50),
//                 child: Text(
//                   "${user.name}'S JOURNEY",
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ),
//               actions: [
//                 IconButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               DiaryEditPage(diaryModel: diaryModel)),
//                     ).then((value) {
//                       setState(() {
//                         diaryModel = value;
//                       });
//                     });
//                   },
//                   icon: const Icon(Icons.edit),
//                   color: Colors.white,
//                 )
//               ],
//             ),
//             body: ValueListenableBuilder(
//               valueListenable: diaryNotifierList,
//               builder: (context, value, child) {
//                 print(diaryModel.key);
//                 return Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: SingleChildScrollView(
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(30.0)),
//                         color: Colors.orange,
//                       ),
//                       // height: 500,
//                       width: 2000,
//                       child: Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 '${diaryModel.date?.year}/${diaryModel.date?.month}/${diaryModel.date?.day}',
//                                 style: const TextStyle(fontSize: 20),
//                               ),
//                             ),
//                             Text(
//                               diaryModel.title,
//                               style: const TextStyle(fontSize: 20),
//                             ),
//                             Text(
//                               diaryModel.writings,
//                             ),
//                             Container(
//                                 height: 100,
//                                 color: Colors.blue,
//                                 child: diaryModel.image != null
//                                     ? Image.file(
//                                         File(diaryModel.image!),
//                                         height: 200,
//                                         width: 200,
//                                         fit: BoxFit.cover,
//                                       )
//                                     : const SizedBox())
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         });
//   }
// }
