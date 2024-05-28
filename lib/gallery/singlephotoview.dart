import 'dart:io';

import 'package:flutter/material.dart';

class SinglePhotoView extends StatefulWidget {
  final String imagepath;
  const SinglePhotoView({super.key, required this.imagepath});

  @override
  State<SinglePhotoView> createState() => _SinglePhotoViewState();
}

class _SinglePhotoViewState extends State<SinglePhotoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black38),
      body: Center(
        child: SizedBox(
          width: 350,
          height: 500,
          child: InteractiveViewer(
            maxScale: 15,
            child: Image.file(
              File(widget.imagepath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
