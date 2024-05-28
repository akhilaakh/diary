import 'dart:io';

import 'package:diary/model/diarymodel.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

class FullScreenImage extends StatefulWidget {
  final String imagepath;
  const FullScreenImage({
    super.key,
    required this.imagepath,
    required String imagePath,
  });

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  late DiaryModel diaryModel;

  // final ImagePicker _picker = ImagePicker();

  late String image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.file(
          File(widget.imagepath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
