import 'package:diary/notess/add_btmsht.dart';

import 'package:flutter/material.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const AddNotBottomSheet();
              });
        },
        child: const Icon(Icons.add),
      ),
    );
    //body: NotesViewBody(
  }
}


















// import 'package:diary/db/user_db_functions.dart';
// import 'package:diary/model/user_model.dart';
// import 'package:flutter/material.dart';

// class Notes extends StatefulWidget {
//   const Notes({super.key});

//   @override
//   State<Notes> createState() => _NotesState();
// }

// class _NotesState extends State<Notes> {
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<List<UserModel>>(
//         valueListenable: userListnotifier,
//         builder: (context, value, _) {
//           var user = value.first;

//           return Scaffold(
            
//               backgroundColor: Colors.white,
//               appBar: AppBar(
//                 centerTitle: true,
//                 backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
//                 title: Text(
//                   "${user.name}'S JOURNEY",
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ),
//               body: const SingleChildScrollView(
//                   child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                       ))));
//         });
//   }
// }
