import 'package:diary/bottom/diary_viewpage.dart';
import 'package:diary/db/db_diary.dart';
import 'package:diary/db/user_db_functions.dart';
import 'package:diary/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  void initState() {
    super.initState();

    DiaryDbFunctions().favourit();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<UserModel>>(
      valueListenable: userListnotifier,
      builder: (context, value, _) {
        // Check if there are any user models
        if (value.isEmpty) {
          // If no user models, show empty handle
          return Scaffold(
            appBar: AppBar(
              title: const Text("Empty Page"),
            ),
            body: const Center(
              child: Text("No diary entries found."),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: 100,
              centerTitle: true,
              backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
              title: const Text(
                // ""${user.name}'S JOURNEY","
                "FAVOURIT",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: ValueListenableBuilder(
              valueListenable: favouriteNotifierList,
              builder: (context, value, _) {
                // Check if there are any favorite entries
                if (value.isEmpty) {
                  // If no favorite entries, show empty handle
                  return const Center(
                    child: Text(
                      "No Favorite Diary Entries Found.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                } else {
                  // If favorite entries exist, display them
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DiaryViewPage(index: value[index])));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.orange,
                            ),
                            height: 100,
                            child: ListTile(
                              title: SizedBox(
                                height: 20,
                                child: Text(
                                  value[index].title,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              subtitle: SizedBox(
                                height: 20,
                                child: Text(
                                  DateFormat('yyyy-MM-dd')
                                      .format(value[index].date!),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          );
        }
      },
    );
  }
}
















// class Favourite extends StatefulWidget {
//   const Favourite({super.key});

//   @override
//   State<Favourite> createState() => _FavouriteState();
// }

// class _FavouriteState extends State<Favourite> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     DiaryDbFunctions().favourit();
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
//                 title: Text(
//                   "${user.name}'S JOURNEY",
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ),
//               body: ValueListenableBuilder(
//                   valueListenable: favouriteNotifierList,
//                   builder: (context, value, _) {
//                     print('hggggggg${value.length}');
//                     return ListView.builder(
//                         itemCount: value.length,
//                         itemBuilder: (context, index) {
//                           return Container(
//                             decoration: BoxDecoration(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20)),
//                               color: Colors.orange,
//                             ),
//                             height: 100,
//                             child: ListTile(
//                               title: SizedBox(
//                                 height: 20,
//                                 child: Text(
//                                   value[index].title,
//                                   style: const TextStyle(fontSize: 20),
//                                 ),
//                               ),
//                               // title:
//                               subtitle: SizedBox(
//                                   height: 20,
//                                   child: Text(DateFormat('yyyy-MM-dd')
//                                       .format(value[index].date!))),
//                             ),
//                           );
//                         });
//                   }));
//         });
//   }
// }
