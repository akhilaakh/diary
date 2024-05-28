import 'dart:io';

import 'package:diary/db/db_gallery.dart';

import 'package:diary/model/gallerymodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class EditGallery extends StatefulWidget {
  GalleryModel galleryedit;
  final int id;
  EditGallery({super.key, required this.galleryedit, required this.id});

  @override
  State<EditGallery> createState() => _EditGalleryState();
}

class _EditGalleryState extends State<EditGallery> {
  final _formkey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  final NameMemoryController = TextEditingController();
  // ignore: non_constant_identifier_names
  final DateMemoryController = TextEditingController();
  List<String> imagePath = [];
  bool selectedimg = false;

  String? memoryphoto;
  DateTime? memorydate;

  @override
  void initState() {
    super.initState();
    NameMemoryController.text = widget.galleryedit.name;
    DateMemoryController.text = widget.galleryedit.date;
    imagePath = List<String>.from(widget.galleryedit.memoryimage ?? []);
  }

  @override
  void dispose() {
    NameMemoryController.dispose();
    DateMemoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: const Text('Edit Gallery'),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      imagePath.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: FileImage(File(imagePath[index])),
                        ),
                      ),
                    ),
                    IconButton.filled(
                      onPressed: () {
                        addMemoryImage(context);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Name'),
                    TextFormField(
                      controller: NameMemoryController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Memory name is required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Date'),
                    TextFormField(
                      controller: DateMemoryController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Memory date is required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () async {
                            memorydate = await pickDate(true, context);
                          },
                          icon: const Icon(Icons.calendar_month),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    final galleryfolder = GalleryModel(
                      date: DateMemoryController.text,
                      memoryimage: imagePath,
                      name: NameMemoryController.text,
                      id: widget.galleryedit.id,
                    );
                    await updategallery(
                        widget.id, context, _formkey, galleryfolder);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addMemoryImage(BuildContext context) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickMultiImage();
    setState(() {
      // imagePath.clear();
      for (final multiImg in pickedImage) {
        imagePath.add(File(multiImg.path).path);
      }
      selectedimg = imagePath.isNotEmpty;
    });
  }

  Future<DateTime?> pickDate(bool startDate, BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        if (startDate) {
          DateMemoryController.text = picked.toString().split(" ")[0];
        }
      });
      return picked;
    }
    return null;
  }
}

updategallery(int key, BuildContext context, GlobalKey<FormState> formkey,
    GalleryModel galleryModel) async {
  if ((formkey.currentState!.validate())) {
    await GalleryDbFunctions()
        .editgary(galleryModel, key)
        .then((value) => Navigator.of(context).pop(galleryModel));
  }
}









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

























// import 'dart:io';

// import 'package:diary/db/db_gallery.dart';
// import 'package:diary/gallery/add_photo.dart';
// import 'package:diary/model/gallerymodel.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class EditGallery extends StatefulWidget {
//   GalleryModel galleryedit;
//   final int id;
//   EditGallery({super.key, required this.galleryedit, required this.id});

//   @override
//   State<EditGallery> createState() => _EditGalleryState();
// }

// class _EditGalleryState extends State<EditGallery> {
//   final _formkey = GlobalKey<FormState>();
//   final NameMemoryController = TextEditingController();
//   final DateMemoryController = TextEditingController();
//   List<String> imagePath = [];
//   bool selectedimg = false;

//   String? memoryphoto;
//   DateTime? memorydate;
//   @override
//   void initState() {
//     super.initState();
//     // TODO: implement initState

//     NameMemoryController.text = widget.galleryedit.name ?? '';
//     DateMemoryController.text = widget.galleryedit.date ?? '';
//     imagePath = List<String>.from(widget.galleryedit.memoryimage ?? []);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black45,
//       ),
//       body: Form(
//         key: _formkey,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     ...List.generate(
//                       imagePath.length,
//                       (index) => CircleAvatar(
//                         radius: 40,
//                         backgroundImage: imagePath.isNotEmpty
//                             ? FileImage(File(imagePath[index]))
//                             : const AssetImage("") as ImageProvider,
//                       ),
//                     ),
//                     IconButton.filled(
//                         onPressed: () {
//                           addMemoryImage(context);
//                         },
//                         icon: Icon(Icons.add)),
//                   ],
//                 ),
//               ),
//               const Text('name'),
//               TextFormField(
//                 controller: NameMemoryController,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "memoryname is required";
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                 ),
//               ),
//               Text('date'),
//               TextFormField(
//                 controller: DateMemoryController,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "memoryname is required";
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   prefixIcon: IconButton(
//                       onPressed: () async {
//                         memorydate = await pickDate(true);
//                       },
//                       icon: Icon(Icons.calendar_month)),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     //       borderSide: BorderSide(color: Colors.white),
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     if (_formkey.currentState!.validate()) {
//                       final galleryfolder = GalleryModel(
//                           date: DateMemoryController.text,
//                           memoryimage: imagePath,
//                           name: NameMemoryController.text,
//                           id: widget.galleryedit.id);
//                       GalleryDbFunctions()
//                           .editgary(galleryfolder)
//                           .then((value) {
//                         Navigator.of(context).pop(galleryfolder);
//                       });
//                     }
//                   },
//                   child: Text('save'))
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // saving() async {
//   //   print('save called');
//   //   final memoryname = NameMemoryController.text.trim();
//   //   final memorydate = DateMemoryController.text.trim();
//   //   final gallery = GalleryModel(
//   //       date: memorydate, memoryimage: imagePath, name: memoryname);
//   //   await GalleryDbFunctions().addgallery(gallery);
//   //   ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
//   //     content: Text('memory added'),
//   //   )));
//   //   Navigator.of(context).pop(gallery);
//   // }

//   Future<void> addMemoryImage(BuildContext context) async {
//     final imagePicker = ImagePicker();
//     final pickedImage = await imagePicker.pickMultiImage();
//     if (pickedImage != null) {
//       setState(() {
//         imagePath.clear();
//         for (final multiImg in pickedImage) {
//           if (multiImg != null) {
//             imagePath.add(File(multiImg.path).path);
//           }
//         }
//         selectedimg = imagePath.isNotEmpty;
//       });
//     }
//   }

//   Future<DateTime?> pickDate(bool startDate) async {
//     DateTime? _picked = await showDatePicker(
//         context: context,
//         firstDate: DateTime(2020),
//         lastDate: DateTime(2050),
//         initialDate: DateTime.now());
//     if (_picked != null) {
//       setState(() {
//         if (startDate) {
//           DateMemoryController.text = _picked.toString().split(" ")[0];
//         }
//       });
//       return _picked;
//     }
//     return null;
//   }
// }
