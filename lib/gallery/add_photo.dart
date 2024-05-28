import 'dart:io';

import 'package:diary/model/gallerymodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:diary/db/db_gallery.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({super.key});

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

// ignore: non_constant_identifier_names
final NameMemoryController = TextEditingController();
// ignore: non_constant_identifier_names
final DateMemoryController = TextEditingController();
List<String> imagePath = [];
bool selectedimg = false;
final _formkey = GlobalKey<FormState>();
String? memoryphoto;
DateTime? memorydate;

class _AddPhotoState extends State<AddPhoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
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
                      (index) => CircleAvatar(
                        radius: 40,
                        backgroundImage: imagePath.isNotEmpty
                            ? FileImage(File(imagePath[index]))
                            : const AssetImage("") as ImageProvider,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(77, 75, 72, 1.0),
                        // Set the desired filled color here
                        shape: BoxShape
                            .circle, // Ensures the container is circular
                      ),
                      child: IconButton(
                        onPressed: () {
                          addMemoryImage(context);
                        },
                        icon: const Icon(
                          Icons.image,
                          color:
                              Colors.orange, // Set the color of the icon itself
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              // const Text(
              //   'name',
              // ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: NameMemoryController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "memoryname is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Memory Name', // Add this line
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // const Text('name',),
              // TextFormField(
              //   controller: NameMemoryController,

              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return "memoryname is required";
              //     }
              //     return null;
              //   },
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(8),
              //       borderSide: BorderSide(color: Colors.white),
              //     ),
              //   ),
              // ),
              // Text('date'),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: DateMemoryController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "memoryname is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Memory Date', // This is the label text
                    prefixIcon: IconButton(
                      onPressed: () async {
                        memorydate = await pickDate(true);
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      // borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              // Text('date'),
              // TextFormField(
              //   controller: DateMemoryController,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return "memoryname is required";
              //     }
              //     return null;
              //   },
              //   decoration: InputDecoration(
              //     prefixIcon: IconButton(
              //         onPressed: () async {
              //           memorydate = await pickDate(true);
              //         },
              //         icon: Icon(Icons.calendar_month)),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(8),
              //       //       borderSide: BorderSide(color: Colors.white),
              //     ),
              //   ),
              // ),

              ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {}
                    saving();
                  },
                  child: const Text(
                    'save',
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  saving() async {
    // print('save called');
    final memoryname = NameMemoryController.text.trim();
    final memorydate = DateMemoryController.text.trim();
    final gallery = GalleryModel(
        date: memorydate, memoryimage: imagePath, name: memoryname);
    await GalleryDbFunctions().addgallery(gallery);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
      content: Text('memory added'),
    )));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop(gallery);
  }

  Future<void> addMemoryImage(BuildContext context) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickMultiImage();
    setState(() {
      imagePath.clear();
      for (final multiImg in pickedImage) {
        imagePath.add(File(multiImg.path).path);
      }
      selectedimg = imagePath.isNotEmpty;
    });
  }

  Future<DateTime?> pickDate(bool startDate) async {
    DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2020),
        lastDate: DateTime(2050),
        initialDate: DateTime.now());
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
