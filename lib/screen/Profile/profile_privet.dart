import 'package:firebaseconnations/LayoutAppMenu/app_start_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebaseconnations/Componet/snackbar.dart';
import 'package:flutter/widgets.dart';

class ProfilePrivate extends StatefulWidget {
  const ProfilePrivate({super.key});

  @override
  State<ProfilePrivate> createState() => _ProfilePrivateState();
}

class Subject {
  final String name;

  Subject({required this.name});
}

class _ProfilePrivateState extends State<ProfilePrivate> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _numController = TextEditingController();
  final _qualificationController = TextEditingController();
  final _prisePerHourController = TextEditingController();
  List<Subject> selectedSubjects = [];
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _numController.dispose();
    _qualificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppStartMenu(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("images/nour.png"),
          radius: 70.0,
        ),
        const SizedBox(height: 25),
        GestureDetector(
          onTap: () {
            // ToDo
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Personal Information",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
          width: 150.0,
          child: Divider(
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: [
            buildTextField(
              controller: _firstNameController,
              hintText: "First Name",
            ),
            const SizedBox(height: 10),
            buildTextField(
              controller: _lastNameController,
              hintText: "Last Name",
            ),
            const SizedBox(height: 10),
            buildTextField(
              controller: _ageController,
              hintText: "Age",
            ),
            const SizedBox(height: 10),
            buildTextField(
              controller: _numController,
              hintText: "Enter Your Phone Number",
            ),
            const SizedBox(height: 10),
            buildTextField(
              controller: _qualificationController,
              //ToDo
              hintText: "Enter Your Qualifications",
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // ToDo
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Select Subjects",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Wrap(
              spacing: 10,
              runSpacing: 20,
              children: [
                for (var subject in allSubjects)
                  FilterChip(
                    label: Text(subject.name),
                    selected: selectedSubjects.contains(subject),
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedSubjects.add(subject);
                        } else {
                          selectedSubjects.remove(subject);
                        }
                      });
                    },
                    labelStyle: const TextStyle(
                      fontFamily: "Source Sans 3",
                      fontSize: 16,
                      color: Colors.black, // Adjust text color
                    ),
                    selectedColor:
                        Colors.blue, // Adjust selected background color
                    backgroundColor:
                        Colors.grey[300], // Adjust unselected background color
                    selectedShadowColor: Colors.blue
                        .withOpacity(0.5), // Adjust selected shadow color
                    shadowColor: Colors.grey.withOpacity(0.5),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement the functionality to save the selected subjects
              },
              child: const Text('Save'),
            ),
          ],
        )
      ],
    );
  }

  final List<Subject> allSubjects = [
    Subject(name: 'Math'),
    Subject(name: 'Science'),
    Subject(name: 'History'),
    Subject(name: 'English'),
    Subject(name: 'Religion'),
    // Add more subjects as needed
  ];
}
