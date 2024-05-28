import 'package:diary/bottom/diary_viewpage.dart';
import 'package:diary/bottom/journey.dart';
import 'package:diary/db/db_diary.dart';
import 'package:diary/db/db_notes.dart';
import 'package:diary/db/user_db_functions.dart';
import 'package:diary/menue%20button/app_info.dart';
import 'package:diary/menue%20button/privacy_policy.dart';
import 'package:diary/menue%20button/profile_page.dart';
import 'package:diary/model/diarymodel.dart';
import 'package:diary/model/notesmodel.dart';
import 'package:diary/model/user_model.dart';
import 'package:diary/notess/custom.item.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../notess/add_btmsht.dart';

class HomePage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    searchtitle('');
    super.initState();
    noteDbFunctions().getnote();
  }

  // ignore: non_constant_identifier_names
  final TextEditingController SearchController = TextEditingController();
  late List<DiaryModel> diarylist = [];
  late List<NoteModel> notelist = [];
  String reg = '';

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<UserModel>>(
      valueListenable: userListnotifier,
      builder: (context, value, _) {
        var user = value.first;
        final height = MediaQuery.of(context).size.height;
        final width = MediaQuery.of(context).size.width;

        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 80,
              bottom: const TabBar(tabs: [
                Tab(
                  child: Text(
                    'journey',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Tab(
                  child: Text(
                    'notes',
                    style: (TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ]),
              actions: [
                PopupMenuButton<int>(
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: Colors.white,
                  ),
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                        value: 1,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Profile()),
                            );
                          },
                          leading: const Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 224, 158, 16),
                          ),
                          title: const Text('profile'),
                        )),
                    PopupMenuItem(
                        value: 2,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AppInfo()),
                            );
                          },
                          leading: const Icon(
                            Icons.info,
                            color: Color.fromARGB(255, 224, 158, 16),
                          ),
                          title: const Text('Appinfo'),
                        )),
                    PopupMenuItem(
                        value: 3,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PrivacyPolicy()),
                            );
                          },
                          leading: const Icon(
                            Icons.privacy_tip,
                            color: Color.fromARGB(255, 224, 158, 16),
                          ),
                          title: const Text('Privacy and policy'),
                        )),
                  ],
                  onSelected: (int value) {},
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
              backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
              title: Center(
                child: Column(
                  children: [
                    Text(
                      "${user.name}'S JOURNEY",
                      style: const TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 500,
                      height: 34,
                      child: TextFormField(
                        controller: SearchController,
                        onChanged: (value) {
                          setState(() {
                            searchtitle(value);
                            reg = SearchController.text;
                          });
                        },
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none),
                          hintText: 'search',
                          suffixIcon: const Icon(Icons.search),
                          prefixIconColor: Colors.deepOrangeAccent,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: TabBarView(children: [
              diaryNotifierList.value.isNotEmpty
                  ? ValueListenableBuilder(
                      valueListenable: diaryNotifierList,
                      builder: (BuildContext context, List<DiaryModel> value,
                          Widget? child) {
                        if (value.isNotEmpty) {
                          return ListView.builder(
                            itemCount: diarylist.length,
                            itemBuilder: (BuildContext context, int index) {
                              DateTime? date = diarylist[index].date;
                              bool isEmpty2 = false;
                              return Journey(
                                diaryModel: diarylist[index],
                                keey: diarylist[index].key,
                                ontap2: () async {
                                  await DiaryDbFunctions()
                                      .deletediary(diarylist[index].key);
                                },
                                title: diarylist[index].title,
                                writings: diarylist[index].writings,
                                date:
                                    '${date?.year}/${date?.month}/${date?.day}',
                                ontap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DiaryViewPage(
                                            index: diarylist[index],
                                          )));
                                },
                                isEmpty: isEmpty2,
                              );
                            },
                          );
                        } else {
                          return Lottie.asset(
                              'assets/animations/Animation - 1711080414933.json');
                        }
                      })
                  : Lottie.asset(
                      'assets/animations/Animation - 1711080414933.json'),
              Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const AddNotBottomSheet();
                        });
                  },
                  child: const Icon(Icons.add),
                ),
                body: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ValueListenableBuilder(
                    valueListenable: noteNotifierList,
                    builder: (context, value, child) {
                      return value.isEmpty
                          ? Center(
                              child: Lottie.asset(
                                  'assets/animations/Animation - 1711080414933.json',
                                  height: height * 0.5,
                                  // width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.fill),
                            )
                          : ListView.builder(
                              itemCount: notelist.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: NoteItems(
                                    note: notelist[index],
                                  ),
                                );
                              });
                    },
                  ),
                ),
              )
            ]),
          ),
        );
      },
    );
  }

  void searchtitle(String datas) {
    List<DiaryModel> searchDiaryResults = [];
    List<NoteModel> searchNoteResults = [];
    if (datas.isEmpty) {
      searchDiaryResults = diaryNotifierList.value;
      searchNoteResults = noteNotifierList.value;
    } else {
      searchDiaryResults = diaryNotifierList.value
          .where(
              (user) => user.title.toLowerCase().contains(datas.toLowerCase()))
          .toList();
      searchNoteResults = noteNotifierList.value
          .where((note) =>
              note.heading.toLowerCase().contains(datas.toLowerCase()))
          .toList();
    }
    setState(() {
      diarylist = searchDiaryResults;
      notelist = searchNoteResults;
    });
  }
}





































// import 'package:diary/bottom/diary_viewpage.dart';
// import 'package:diary/bottom/journey.dart';

// import 'package:diary/db/db_diary.dart';
// import 'package:diary/db/db_notes.dart';
// import 'package:diary/db/user_db_functions.dart';
// import 'package:diary/menue%20button/app_info.dart';
// import 'package:diary/menue%20button/privacy_policy.dart';
// import 'package:diary/menue%20button/profile_page.dart';
// import 'package:diary/model/diarymodel.dart';
// import 'package:diary/model/user_model.dart';
// import 'package:diary/notess/custom.item.dart';
// import 'package:diary/notess/notes_list.dart';
// import 'package:diary/notess/notes_view.dart';
// import 'package:diary/notess/notes_view_body.dart';

// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// import '../notess/add_btmsht.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     searchtitle('');
//     super.initState();
//     noteDbFunctions().getnote();
//   }

//   // ignore: non_constant_identifier_names
//   final TextEditingController SearchController = TextEditingController();
//   late List<DiaryModel> diarylist = [];
//   String reg = '';
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<List<UserModel>>(
//         valueListenable: userListnotifier,
//         builder: (context, value, _) {
//           var user = value.first;

//           return DefaultTabController(
//             length: 2,
//             child: Scaffold(
//                 appBar: AppBar(
//                   toolbarHeight: 80,
//                   bottom: const TabBar(tabs: [
//                     Tab(
//                       child: Text(
//                         'journey',
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                     ),
//                     Tab(
//                       child: Text(
//                         'notes',
//                         style: (TextStyle(color: Colors.white, fontSize: 20)),
//                       ),
//                     ),
//                   ]),
//                   actions: [
//                     PopupMenuButton<int>(
//                       // Add PopupMenuButton
//                       icon: const Icon(
//                         Icons.menu_rounded,
//                         color: Colors.white,
//                       ),
//                       itemBuilder: (BuildContext context) => [
//                         PopupMenuItem(
//                             value: 1,
//                             child: ListTile(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => const Profile()),
//                                 );
//                               },
//                               leading: const Icon(
//                                 Icons.person,
//                                 color: Color.fromARGB(255, 224, 158, 16),
//                               ),
//                               title: const Text('profile'),
//                             )),
//                         PopupMenuItem(
//                             value: 2,
//                             child: ListTile(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => const AppInfo()),
//                                 );
//                               },
//                               leading: const Icon(
//                                 Icons.info,
//                                 color: Color.fromARGB(255, 224, 158, 16),
//                               ),
//                               title: const Text('Appinfo'),
//                             )),
//                         PopupMenuItem(
//                             value: 3,
//                             child: ListTile(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const PrivacyPolicy()),
//                                 );
//                               },
//                               leading: const Icon(
//                                 Icons.privacy_tip,
//                                 color: Color.fromARGB(255, 224, 158, 16),
//                               ),
//                               title: const Text('Privacy and policy'),
//                             )),
//                         // PopupMenuItem(
//                         //     value: 4,
//                         //     child: ListTile(
//                         //       onTap: () {
//                         //         Navigator.push(
//                         //           context,
//                         //           MaterialPageRoute(
//                         //               builder: (context) => const Profile()),
//                         //         );
//                         //       },
//                         //       leading: const Icon(
//                         //         Icons.pin,
//                         //         color: Color.fromARGB(255, 224, 158, 16),
//                         //       ),
//                         //       title: const Text('change pin'),
//                         //     )),
//                       ],
//                       onSelected: (int value) {
//                         // Handle menu item selection here
//                         // print('Selected option: $value');
//                       },
//                     ),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                   ],
//                   backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
//                   title: Center(
//                     child: Column(
//                       children: [
//                         Text(
//                           "${user.name}'S JOURNEY",
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                         SizedBox(
//                           width: 500,
//                           height: 34,
//                           child: TextFormField(
//                             controller: SearchController,
//                             onChanged: (value) {
//                               setState(() {
//                                 searchtitle(value);
//                                 reg = SearchController.text;
//                               });
//                             },
//                             style: const TextStyle(color: Colors.black),
//                             decoration: InputDecoration(
//                               filled: true,
//                               fillColor: Colors.white,
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                   borderSide: BorderSide.none),
//                               hintText: 'search',
//                               suffixIcon: const Icon(Icons.search),
//                               prefixIconColor: Colors.deepOrangeAccent,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 backgroundColor: Colors.white,
//                 body: TabBarView(children: [
//                   diaryNotifierList.value.isNotEmpty
//                       ? ValueListenableBuilder(
//                           valueListenable: diaryNotifierList,
//                           builder: (BuildContext context,
//                               List<DiaryModel> value, Widget? child) {
//                             if (value.isNotEmpty) {
//                               return ListView.builder(
//                                 itemCount: diarylist.length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   DateTime? date = diarylist[index].date;
//                                   bool isEmpty2 = false;
//                                   return Journey(
//                                     diaryModel: diarylist[index],
//                                     keey: diarylist[index].key,
//                                     ontap2: () async {
//                                       await DiaryDbFunctions()
//                                           .deletediary(diarylist[index].key);
//                                     },
//                                     title: diarylist[index].title,
//                                     writings: diarylist[index].writings,
//                                     date:
//                                         '${date?.year}/${date?.month}/${date?.day}',
//                                     ontap: () {
//                                       Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   DiaryViewPage(
//                                                     index: diarylist[index],
//                                                   )));
//                                     },
//                                     isEmpty: isEmpty2,
//                                   );
//                                 },
//                               );
//                             } else {
//                               return Lottie.asset(
//                                   'lib/assets/images/Animation - 1711080414933.json');
//                             }
//                           })
//                       : Lottie.asset(
//                           'lib/assets/images/Animation - 1711080414933.json'),
//                   Scaffold(
//                     floatingActionButton: FloatingActionButton(
//                       onPressed: () {
//                         showModalBottomSheet(
//                             context: context,
//                             builder: (context) {
//                               return AddNotBottomSheet();
//                             });
//                       },
//                       child: const Icon(Icons.add),
//                     ),
//                     body: SizedBox(
//                       height: MediaQuery.of(context).size.height,
//                       child: ValueListenableBuilder(
//                         valueListenable: noteNotifierList,
//                         builder: (context, value, child) {
//                           return ListView.builder(
//                               itemCount: value.length,
//                               itemBuilder: (context, index) {
//                                 return Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: NoteItems(
//                                     note: value[index],
//                                   ),
//                                 );
//                               });
//                         },
//                       ),
//                     ),
//                   )
//                 ])),
//           );
//         });
//   }

//   void searchtitle(String datas) {
//     List<DiaryModel> searchResults = [];
//     if (datas.isEmpty) {
//       searchResults = diaryNotifierList.value;
//     } else {
//       searchResults = diaryNotifierList.value
//           .where(
//               (user) => user.title.toLowerCase().contains(datas.toLowerCase()))
//           .toList();
//     }
//     setState(() {
//       diarylist = searchResults;
//     });
//   }
// }
