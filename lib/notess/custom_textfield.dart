// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   CustomTextField({super.key, required String hint});

//   @override
//   Widget build(BuildContext context) {
//     return  TextField(
//       decoration: InputDecoration(
//           hintText: 'title',
//           hintStyle: TextStyle(color: Colors.black),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: Colors.white),
//           )),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hint1;
  final String? hint2;
  final int? maxlines;
  final TextEditingController controller;

  const CustomTextField(
      {Key? key,
      this.hint1,
      this.hint2,
      this.maxlines = 1,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          // minLines: 2,
          // maxLines: maxlines,
          decoration: InputDecoration(
            hintText: hint1,
            hintStyle: const TextStyle(color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 8), // Add some spacing between the text fields
        // TextField(
        //   decoration: InputDecoration(
        //     hintText: hint2,
        //     hintStyle: TextStyle(color: Colors.black),
        //     border: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(8),
        //       borderSide: BorderSide(color: Colors.white),
        //     ),
        //   ),
        //   maxLines: 8,
        // ),
      ],
    );
  }
}
