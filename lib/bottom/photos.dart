// // import 'dart:io';

// import 'package:diary/db/db_gallery.dart';
// import 'package:diary/db/user_db_functions.dart';
// import 'package:diary/gallery/add_photo.dart';
// import 'package:diary/gallery/galleryyy.dart';
// import 'package:diary/model/gallerymodel.dart';
// import 'package:diary/model/user_model.dart';
// import 'package:flutter/material.dart';

// class Photos extends StatefulWidget {
//   const Photos({super.key});

//   @override
//   State<Photos> createState() => _PhotosState();
// }

// class _PhotosState extends State<Photos> {
//   @override
//   void initState() {

//     super.initState();

//     GalleryDbFunctions().updategallery();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<List<UserModel>>(
//       valueListenable: userListnotifier,
//       builder: (context, value, _) {
//         if (value.isEmpty) {
//           return Scaffold(
//             appBar: AppBar(
//               centerTitle: true,
//               backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
//               title: const Text(
//                 "JOURNEY",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             body: const Center(
//               child: Text("No user found."),
//             ),
//             floatingActionButton: FloatingActionButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const AddPhoto(),
//                   ),
//                 );
//               },
//               child: const Icon(Icons.add),
//             ),
//           );
//         }

//         var user = value.first;

//         return Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             centerTitle: true,
//             backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
//             title: Text(
//               "${user.name}'S JOURNEY",
//               style: const TextStyle(color: Colors.white),
//             ),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: ValueListenableBuilder<List<GalleryModel>>(
//                     valueListenable: galleryNotifierList,
//                     builder: (context, value, child) => GridView.builder(
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 5,
//                         mainAxisSpacing: 5,
//                       ),
//                       itemCount:
//                           value.length, // Adjust this according to your data
//                       itemBuilder: (context, index) {
//                         return Card(
//                           color: Colors.blueAccent,
//                           child: InkWell(
//                             onTap: () {
//                               // Add your onTap functionality here
//                             },
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 IconButton(
//                                     onPressed: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => GalleryPage(
//                                                     photoview: value[index],
//                                                   )));
//                                     },
//                                     icon: Icon(Icons.folder)),
//                                 SizedBox(height: 10),
//                                 Text(value[index].name ?? 'unnamed'),
//                                 IconButton(
//                                     onPressed: () {
//                                       showAboutDialog(context: context);
//                                     },
//                                     icon: Icon(
//                                       Icons.delete,
//                                     ))
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const AddPhoto(),
//                 ),
//               );
//             },
//             child: const Icon(Icons.add),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:diary/db/db_gallery.dart';
import 'package:diary/db/user_db_functions.dart';
import 'package:diary/gallery/add_photo.dart';
import 'package:diary/gallery/galleryyy.dart';
import 'package:diary/model/gallerymodel.dart';
import 'package:diary/model/user_model.dart';
import 'package:flutter/material.dart';

class Photos extends StatefulWidget {
  const Photos({Key? key}) : super(key: key);

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  @override
  void initState() {
    super.initState();
    GalleryDbFunctions().updategallery();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<UserModel>>(
      valueListenable: userListnotifier,
      builder: (context, value, _) {
        if (value.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
              title: const Text(
                "JOURNEY",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: const Center(
              child: Text("No user found."),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddPhoto(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
          );
        }

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
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ValueListenableBuilder<List<GalleryModel>>(
                    valueListenable: galleryNotifierList,
                    builder: (context, value, child) => GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.yellow,
                          child: InkWell(
                            onTap: () {
                              // Add your onTap functionality here
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => GalleryPage(
                                          photoview: value[index],
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.folder),
                                ),
                                const SizedBox(height: 10),
                                Text(value[index].name),
                                IconButton(
                                  onPressed: () {
                                    _showDeleteConfirmationDialog(
                                      context,
                                      value[index].key,
                                    );
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddPhoto(),
                ),
              );
            },
            child: const Icon(
              Icons.add,
              color: Colors.yellow,
            ),
          ),
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Folder"),
          content: const Text("Are you sure you want to delete this folder?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Perform delete operation here
                GalleryDbFunctions().deleteGallery(id);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
