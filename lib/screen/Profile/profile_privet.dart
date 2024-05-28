import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseconnations/LayoutAppMenu/app_start_menu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:models/models.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import '../../repositories/tutor_repository.dart';
import 'create_subject.dart';

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
  final _auth = FirebaseAuth.instance;
  void getInfos() async {
    final _email = _auth.currentUser!.email;
    final _infosUser = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: _email)
        .get();
    // TODO  qusai -------------------- set a value for controller
    _firstNameController.text = _infosUser.docs.first.data()['first name'];
    _lastNameController.text = _infosUser.docs.first.data()['last name'];
    _ageController.text = _infosUser.docs.first.data()['age'];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      print(_auth.currentUser!.email);
      getInfos();
    });
  }

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _numController = TextEditingController();
  final _prisePerHourController = TextEditingController();

  List<String> selectedSubjects = [];
  bool _personalInfoExpanded = false;
  bool _selectSubjectsExpanded = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _numController.dispose();
    _prisePerHourController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppStartMenu(
      children: [
        GestureDetector(
          onTap: () {
            //Qusaiiii ?????????????????????????????????????????????????
            // Example: Show image picker
          },
          child: const Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("images/nour.png"),
                radius: 65.0,
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 18.0,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.grey,
                    size: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        ExpansionTile(
          initiallyExpanded: _personalInfoExpanded,
          onExpansionChanged: (expanded) {
            setState(() {
              _personalInfoExpanded = expanded;
            });
          },
          title: const Row(
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
            ],
          ),
          children: [
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
                  controller: _prisePerHourController,
                  hintText: "Enter Your Price",
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    // Create a new Tutor object with the entered data
                    final tutor = Tutor(
                      id: '', // This will be generated automatically by Firestore
                      name: _firstNameController.text +
                          ' ' +
                          _lastNameController.text,
                      bio: '', // You can add a bio here if you want
                      profileImageUrl:
                          '', // You can add an image URL here if needed
                      category: '', // You can specify the tutor's category here
                      subjects: [], // You can add the selected subjects here
                      rating: 0.0, // Rating will be initialized as 0
                      reviewCount: 0, // Review count will be initialized as 0
                      studentCount: 0, // Student count will be initialized as 0
                    );

                    try {
                      // Create a new instance of TutorRepository
                      final tutorRepository = TutorRepository();

                      // Call the createTutor method with the tutor object
                      await tutorRepository.createTutor(tutor);

                      // Print a success message
                      print('Tutor created successfully!');
                    } catch (error) {
                      // Print an error message if something goes wrong
                      print('Failed to create tutor: $error');
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        ExpansionTile(
          initiallyExpanded: _selectSubjectsExpanded,
          onExpansionChanged: (expanded) {
            setState(() {
              _selectSubjectsExpanded = expanded;
            });
          },
          title: const Row(
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
            ],
          ),
          children: [
            Wrap(
              spacing: 10,
              runSpacing: 20,
              children: [
                for (var subject in allSubjects)
                  FilterChip(
                    label: Text(subject),
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
                      color: Colors.black,
                    ),
                    selectedColor: Colors.blue,
                    backgroundColor: Colors.grey[300],
                    selectedShadowColor: Colors.blue.withOpacity(0.5),
                    shadowColor: Colors.grey.withOpacity(0.5),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                print('Selected Subjects: $selectedSubjects');
                try {
                  // Create a new instance of TutorRepository
                  final tutorRepository = TutorRepository();

                  // Call the createTutor method with the tutor object
                  await tutorRepository.updateSubject(selectedSubjects);

                  // Print a success message
                  print('Tutor subjects updated successfully!');
                } catch (error) {
                  // Print an error message if something goes wrong
                  print('Failed to update tutor subjects: $error');
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateSubject()),
                );
              },
              child: const Text('Create Subject'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ExpansionTile(
          initiallyExpanded: _selectSubjectsExpanded,
          onExpansionChanged: (expanded) {
            setState(() {
              _selectSubjectsExpanded = expanded;
            });
          },
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Kalender",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          children: [
            ElevatedButton(
              onPressed: () async {
                final dateTimeList = await showOmniDateTimeRangePicker(
                  context: context,
                  startInitialDate: DateTime.now(),
                  startFirstDate:
                      DateTime(1600).subtract(const Duration(days: 3652)),
                  startLastDate: DateTime.now().add(const Duration(days: 3652)),
                  endInitialDate: DateTime.now(),
                  endFirstDate:
                      DateTime(1600).subtract(const Duration(days: 3652)),
                  endLastDate: DateTime.now().add(const Duration(days: 3652)),
                  is24HourMode: false,
                  isShowSeconds: false,
                  minutesInterval: 1,
                  secondsInterval: 1,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  constraints:
                      const BoxConstraints(maxWidth: 350, maxHeight: 650),
                  transitionDuration: const Duration(milliseconds: 200),
                  barrierDismissible: true,
                  selectableDayPredicate: (dateTime) =>
                      dateTime != DateTime(2023, 2, 25),
                  transitionBuilder: (context, anim1, anim2, child) =>
                      FadeTransition(
                    opacity: anim1,
                    child: child,
                  ),
                );
                try {
                  // Create a new instance of TutorRepository
                  final tutorRepository = TutorRepository();

                  // Call the createTutor method with the tutor object
                  await tutorRepository.updateWorkingHours(dateTimeList!);

                  // Print a success message
                  print('Tutor subjects updated successfully!');
                } catch (error) {
                  // Print an error message if something goes wrong
                  print('Failed to update tutor subjects: $error');
                }
              },
              child: const Text('Öffnen Sie den Kalender'),
            ),
          ],
        ),
        const SizedBox(height: 150),
        ElevatedButton(
          onPressed: () {
            _auth.signOut();
            Navigator.pushNamed(context, "/");
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }

  final List<String> allSubjects = [
    'Math',
    'Science',
    'History',
    'English',
    'Religion',
    // Add more subjects as needed
  ];

  Widget buildTextField(
      {required TextEditingController controller, required String hintText}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class WorkingHoursWidget extends StatelessWidget {
  final List<DateTime> workingHours;

  const WorkingHoursWidget({super.key, required this.workingHours});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Working Hours:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          itemCount: workingHours.length,
          itemBuilder: (context, index) {
            final formattedTime =
                DateFormat('HH:mm').format(workingHours[index]);
            return Text(
              '${index + 1}. $formattedTime',
              style: const TextStyle(fontSize: 16),
            );
          },
        ),
      ],
    );
  }
}
