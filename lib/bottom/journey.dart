import 'package:diary/db/db_diary.dart';
import 'package:diary/model/diarymodel.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Journey extends StatefulWidget {
  final DiaryModel diaryModel;
  final String title;
  final String writings;
  final String date;
  final VoidCallback ontap;
  final VoidCallback ontap2;
  final bool isEmpty;
  final int keey;

  const Journey({
    super.key,
    required this.title,
    required this.writings,
    required this.ontap,
    required this.date,
    required this.ontap2,
    required this.isEmpty,
    required this.diaryModel,
    required this.keey,
  });

  @override
  // ignore: library_private_types_in_public_api
  _JourneyState createState() => _JourneyState();
}

class _JourneyState extends State<Journey> {
  bool? _isFavorite;
  ValueNotifier<bool> fav = ValueNotifier(false);
  @override
  void initState() {
    super.initState();
    _isFavorite = widget.diaryModel.favourite;
    print('jjd');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: widget.diaryModel.isInBox == false
              ? LottieBuilder.asset(
                  'lib/assets/images/Animation - 1711077004129.json')
              : GestureDetector(
                  onTap: widget.ontap,
                  child: Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.orange,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ListTile(
                          subtitle:
                              SizedBox(height: 20, child: Text(widget.date)),
                          onTap: widget.ontap,
                          title: SizedBox(
                            child: Text(
                              widget.title,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Confirm Deletion'),
                                              content: const Text(
                                                  'Are you sure you want to delete this item?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    // Perform delete action here
                                                    widget
                                                        .ontap2(); // Call the delete function after confirmation
                                                  },
                                                  child: const Text('Delete'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: const Icon(Icons.delete)
                                      //   // onPressed: widget.ontap2,
                                      //   icon: const Icon(
                                      //     Icons.delete,
                                      //     size: 25,
                                      //   ),
                                      ),
                                  IconButton(
                                    onPressed: () async {
                                      await favouritbutton(widget.diaryModel,
                                          !_isFavorite!, widget.diaryModel.key);
                                      setState(() {
                                        fav.value = !fav.value;
                                        _isFavorite = fav.value;
                                      });
                                      // print(_isFavorite);
                                    },
                                    icon: Icon(
                                      _isFavorite == true
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      // color: _isFavorite ? Colors.red : null,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        )
      ],
    );
  }

  Future favouritbutton(DiaryModel diaryModel, bool favourit, int key) async {
    DiaryModel diaryModel1 = DiaryModel(
        title: diaryModel.title,
        writings: diaryModel.writings,
        date: diaryModel.date,
        favourite: favourit,
        image: diaryModel.image);
    await DiaryDbFunctions().editdiary(key, diaryModel1);
  }
}





















































































// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class Journey extends StatelessWidget {
//   String title;
//   String writings;
//   String date;
//   VoidCallback ontap;
//   VoidCallback ontap2;
//   bool isEmpty;

//   Journey({
//     required this.title,
//     required this.writings,
//     required this.ontap,
//     required this.date,
//     required this.ontap2,
//     required this.isEmpty,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(9.0),
//           child: title.isEmpty
//               ? LottieBuilder.asset(
//                   'lib/assets/images/Animation - 1711077004129.json')
//               : GestureDetector(
//                   onTap: ontap,
//                   child: Container(
//                     height: 100,
//                     decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                       color: Colors.orange,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         ListTile(
//                           subtitle: SizedBox(height: 20, child: Text(date)),
//                           onTap: ontap,
//                           title: SizedBox(
//                             child: Text(
//                               title,
//                               style: const TextStyle(fontSize: 20),
//                             ),
//                           ),
//                           trailing: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   GestureDetector(
//                                     onTap: ontap,
//                                     child: IconButton(
//                                       onPressed: ontap2,
//                                       icon: const Icon(
//                                         Icons.delete,
//                                         size: 25,
//                                       ),
//                                     ),
//                                   ),
//                                    IconButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       _isFavorite = !_isFavorite;
//                                     });
//                                   },
//                                   icon: Icon(
//                                     Icons.favorite_border,
//                                     color: _isFavorite ? Colors.red : null,
//                                   ),
//                                 ),
//                                   // IconButton(
//                                   //     onPressed: () {},
//                                   //     icon: const Icon(Icons.favorite))
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//         )
//       ],
//     );
//   }
// }



