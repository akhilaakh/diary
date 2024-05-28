import 'dart:io';

import 'package:diary/db/db_gallery.dart';
import 'package:diary/gallery/edit_gallery.dart';
import 'package:diary/gallery/singlephotoview.dart';
import 'package:diary/model/gallerymodel.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  final GalleryModel photoview;
  const GalleryPage({super.key, required this.photoview});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  late GalleryModel gallerylist;

  @override
  void initState() {
    super.initState();
    gallerylist = widget.photoview;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditGallery(
                            galleryedit: gallerylist,
                            id: gallerylist.key))).then((value) {
                  if (value != null) {
                    setState(() {
                      gallerylist = value;
                    });
                  }
                });
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ))
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: galleryNotifierList,
        builder: (context, value, child) {
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Name:',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        gallerylist.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Date:',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            gallerylist.date,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemCount: gallerylist.memoryimage?.length ?? 0,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SinglePhotoView(
                                imagepath: gallerylist.memoryimage![index]),
                          ),
                        );
                      },
                      onLongPress: () {
                        _showDeleteDialog(context, index);
                      },
                      child: Image.file(File(gallerylist.memoryimage![index])),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Image'),
          content: const Text('Are you sure you want to delete this image?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  gallerylist.memoryimage!.removeAt(index);
                });
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}




























// import 'dart:io';

// import 'package:diary/db/db_gallery.dart';
// import 'package:diary/gallery/edit_gallery.dart';
// import 'package:diary/gallery/singlephotoview.dart';
// import 'package:diary/model/gallerymodel.dart';
// import 'package:flutter/material.dart';
// import 'package:photo_view/photo_view.dart';

// class GalleryPage extends StatefulWidget {
//   final GalleryModel photoview;
//   const GalleryPage({super.key, required this.photoview});

//   @override
//   State<GalleryPage> createState() => _GalleryPageState();
// }

// class _GalleryPageState extends State<GalleryPage> {
//   late GalleryModel gallerylist;
//   @override
//   void initState() {
//     super.initState();
//     // TODO: implement initState

//     gallerylist = widget.photoview;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => EditGallery(
//                             galleryedit: gallerylist,
//                             id: gallerylist.key))).then((value) {
//                   gallerylist = value;
//                   setState(() {});
//                 });
//               },
//               icon: const Icon(
//                 Icons.edit,
//                 color: Colors.white,
//               ))
//         ],
//       ),
//       body: ValueListenableBuilder(
//         valueListenable: galleryNotifierList,
//         builder: (context, value, child) {
//           return Column(
//             children: [
//               SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Container(
//                   padding:
//                       const EdgeInsets.all(20), // Adds padding inside the box
//                   decoration: BoxDecoration(
//                     // Background color of the box
//                     border: Border.all(color: Colors.black), // Border color
//                     borderRadius: BorderRadius.circular(8), // Rounded corners
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment
//                         .start, // Align children to the start (top) of the row
//                     children: [
//                       const Text(
//                         'name  :',
//                         style: TextStyle(fontSize: 20),
//                       ),
//                       const SizedBox(
//                         width: 16, // Space between the label and the text
//                       ),
//                       Text(
//                         gallerylist.name,
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // Row(
//               //   children: [
//               //     const Text('name'),
//               //     const SizedBox(
//               //       width: 16,
//               //     ),
//               //     Text(
//               //       gallerylist.name,
//               //     )
//               //   ],
//               // ),

//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Container(
//                   padding:
//                       const EdgeInsets.all(20), // Adds padding inside the box
//                   decoration: BoxDecoration(
//                     // Background color of the box
//                     border: Border.all(color: Colors.black), // Border color
//                     borderRadius: BorderRadius.circular(8), // Rounded corners
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment
//                         .start, // Align children to the start (left) of the column
//                     children: [
//                       Row(
//                         children: [
//                           const Text(
//                             'date   :',
//                             style: TextStyle(fontSize: 20),
//                           ),
//                           const SizedBox(
//                             width: 16, // Space between the label and the text
//                           ),
//                           Text(
//                             gallerylist.date,
//                             style: TextStyle(fontSize: 20),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 8), // Space between the rows
//                       // Row(
//                       //   children: [
//                       //     const Text('date'),
//                       //     const SizedBox(
//                       //       width: 16, // Space between the label and the text
//                       //     ),
//                       //     Text(
//                       //       gallerylist.date,
//                       //     ),
//                       //   ],
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),

//               // Row(
//               //   children: [
//               //     const Text('date'),
//               //     const SizedBox(
//               //       width: 16,
//               //     ),
//               //     Text(
//               //       gallerylist.date,
//               //     ),
//               //   ],
//               // ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Expanded(
//                   child: GridView.builder(
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 4,
//                         mainAxisSpacing: 4,
//                         crossAxisSpacing: 4,
//                       ),
//                       itemCount: gallerylist.memoryimage?.length,
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => SinglePhotoView(
//                                         imagepath:
//                                             gallerylist.memoryimage![index])));
//                           },
//                           child:
//                               Image.file(File(gallerylist.memoryimage![index])),
//                         );
//                       }))
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
