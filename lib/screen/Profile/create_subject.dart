import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseconnations/Componet/ActionBtn.dart';
import 'package:firebaseconnations/Componet/constants.dart';
import 'package:firebaseconnations/Componet/snackbar.dart';
import 'package:firebaseconnations/Componet/uploadImage.dart';
import 'package:firebaseconnations/LayoutAppMenu/app_start_menu.dart';
import 'package:firebaseconnations/Model/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateSubject extends StatefulWidget {
  const CreateSubject({super.key});

  @override
  State<CreateSubject> createState() => _CreateSubjectState();
}

class _CreateSubjectState extends State<CreateSubject> {
  final nameController = TextEditingController();
  final hourlyController = TextEditingController();
  final textController = TextEditingController();
  final Subjects _subjects = Subjects();

  final _storage = FirebaseStorage.instance;
  File? _photo;
  final ImagePicker _picker = ImagePicker();
  late var destination;
  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    destination = await DateTime.now().millisecond.toString();
    try {
      final ref = _storage.ref().child('images');
      final refImg = ref.child(destination);
      await refImg.putFile(_photo!);
      destination = await refImg.getDownloadURL();
      print(destination);
    } catch (e) {
      print('error occured');
    }
  }

  late String SubjectsName;
  late String hourlyWage;
  late String description = "";

  @override
  Widget build(BuildContext context) {
    return AppStartMenu(
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              UploadImage(() {
                imgFromGallery();
              }),
              SizedBox(
                  height: 100,
                  child: TextField(
                      controller: nameController,
                      onChanged: (val) => {
                            setState(() {
                              SubjectsName = val;
                            })
                          },
                      decoration: kTextFildDecoration.copyWith(
                          hintText: "Enter your SubjectsName",
                          icon: Icon(Icons.subject)))),
              SizedBox(
                  height: 100,
                  child: TextField(
                      controller: hourlyController,
                      keyboardType: TextInputType.number,
                      onChanged: (val) => {
                            setState(() {
                              hourlyWage = val;
                            })
                          },
                      decoration: kTextFildDecoration.copyWith(
                          hintText: "Enter your hourly Wage",
                          icon: Icon(Icons.euro)))),
              SizedBox(
                height: 100,
                child: TextField(
                  controller: textController,
                  onChanged: (val) => {
                    setState(() {
                      description = val;
                    })
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: const InputDecoration(
                      hintText: "Subject description",
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.redAccent))),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ActionBtn(() {
                  if (description == "" ||
                      hourlyWage == "" ||
                      SubjectsName == "") {
                    print("object");
                    showCustomSnackBar(
                        context, "Please fill in all the text fields.");
                  } else {
                    uploadFile();

                    _subjects.createSubject(
                        SubjectsName, hourlyWage, description, destination);
                    textController.clear();
                    hourlyController.clear();
                    nameController.clear();
                  }
                }, "Create", Icons.arrow_right, null),
              )
            ],
          ),
        )
      ],
    );
  }
}
