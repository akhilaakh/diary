import 'package:diary/db/db_notes.dart';
import 'package:diary/model/notesmodel.dart';
import 'package:diary/notess/custom_textfield.dart';
import 'package:flutter/material.dart';

class AddNotBottomSheet extends StatefulWidget {
  const AddNotBottomSheet({super.key});

  @override
  State<AddNotBottomSheet> createState() => _AddNotBottomSheetState();
}

DateTime? memorydate;

class _AddNotBottomSheetState extends State<AddNotBottomSheet> {
  final formkey = GlobalKey<FormState>();

  final TextEditingController controller1 = TextEditingController();

  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              CustomTextField(
                controller: controller1,
                hint1: 'title',
              ),
              CustomTextField(
                controller: controller2,
                hint1: 'content',
                maxlines: 8,
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: controller3,
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
              CustomButton(
                onPressed: () async {
                  await saving().then((value) {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future saving() async {
    if (formkey.currentState!.validate()) {
      NoteModel model = NoteModel(
          heading: controller1.text.trim(),
          subtitle: controller2.text.trim(),
          date: controller3.text.trim(),
          title: '');
      await noteDbFunctions().addnote(model);
    }
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
          controller3.text = picked.toString().split(" ")[0];
        }
      });
      return picked;
    }
    return null;
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(16)),
          child: const Center(
            child: Text(
              'add',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}















 









// import 'package:diary/notess/custom_textfield.dart';
// import 'package:flutter/material.dart';

// class AddNotBottomSheet extends StatelessWidget {
//   const AddNotBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         children: [
//           SizedBox(
//             height: 32,
//           ),
//           CustomTextField(
//             hint1: 'title',
//           ),
//           CustomTextField(
//             hint1: 'content',
//             maxlines: 2,
//           )
//         ],
//       ),
//     );
//   }
// }














// import 'package:diary/notess/custom_textfield.dart';
// import 'package:flutter/material.dart';

// class AddNotBottomSheet extends StatelessWidget {
//   const AddNotBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         children: [
//           SizedBox(
//             height: 32,
//           ),
//           CustomTextField(
//             hint:'title',
            
//           )
//         ],
//       ),
//     );
//   }
// }
