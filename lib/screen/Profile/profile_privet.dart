import 'package:firebaseconnations/LayoutAppMenu/app_start_menu.dart';
import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import '../auth/login.dart';
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
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _numController = TextEditingController();
  final _prisePerHourController = TextEditingController();
  List<Subject> selectedSubjects = [];
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
                  onPressed: () {
                    // Quai ?????????????????????????????????????
                    // For example, you can print the entered data
                    print("First Name: ${_firstNameController.text}");
                    print("Last Name: ${_lastNameController.text}");
                    print("Age: ${_ageController.text}");
                    print("Phone Number: ${_numController.text}");
                    print("Price: ${_prisePerHourController.text}");
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
              onPressed: () {
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
                List<DateTime>? dateTimeList =
                    await showOmniDateTimeRangePicker(
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
                  constraints: const BoxConstraints(
                    maxWidth: 350,
                    maxHeight: 650,
                  ),
                  transitionBuilder: (context, anim1, anim2, child) {
                    return FadeTransition(
                      opacity: anim1.drive(
                        Tween(
                          begin: 0,
                          end: 1,
                        ),
                      ),
                      child: child,
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 200),
                  barrierDismissible: true,
                  selectableDayPredicate: (dateTime) {
                    // Disable 25th Feb 2023
                    if (dateTime == DateTime(2023, 2, 25)) {
                      return false;
                    } else {
                      return true;
                    }
                  },
                );
                // Amer ????????????????????
                print(dateTimeList);
              },
              child: const Text('Öffnen Sie den Kalender'),
            ),
          ],
        ),
        const SizedBox(height: 150),
        ElevatedButton(
          onPressed: () {
            // Navigate to the login page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            );
          },
          child: const Text('Logout'),
        ),
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
