// import 'package:flutter/material.dart';

// class EditNewViewBody extends StatelessWidget {
//   const EditNewViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//     );
//   }
// }import 'package:diary/db/user_db_functions.dart';
import 'package:diary/db/user_db_functions.dart';
import 'package:diary/model/user_model.dart';
import 'package:flutter/material.dart';

class EditNewViewBody extends StatefulWidget {
  const EditNewViewBody({super.key});

  @override
  State<EditNewViewBody> createState() => _EditNewViewBodyState();
}

class _EditNewViewBodyState extends State<EditNewViewBody> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<UserModel>>(
        valueListenable: userListnotifier,
        builder: (context, value, _) {
          var user = value.first;

          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
                title: Text(
                  "${user.name}'S JOURNEY",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              body: const SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ))));
        });
  }
}
