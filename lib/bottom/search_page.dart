// import 'package:diary/db/user_db_functions.dart';
// import 'package:diary/model/user_model.dart';
// import 'package:flutter/material.dart';

// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   void updatelist(String value) {}
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
//               body: Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
                      
//                       TextFormField(
//                         style: TextStyle(color: Colors.black),
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.amberAccent,
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8.0),
//                               borderSide: BorderSide.none),
//                           hintText: 'search',
//                           suffixIcon: Icon(Icons.search),
//                           prefixIconColor: Colors.deepOrangeAccent,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Expanded(
//                         child: ListView(),
//                       )
//                     ],
//                   )));
//         });
//   }
// }
