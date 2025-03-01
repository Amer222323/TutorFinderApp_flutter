import 'package:firebaseconnations/Componet/subject_card.dart';
import 'package:firebaseconnations/LayoutAppMenu/app_start_menu.dart';
import 'package:firebaseconnations/Model/FirebaseService.dart';
import 'package:firebaseconnations/screen/subjekt_detalis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../widgets/title/section_title.dart';

class ProfileTutor extends StatefulWidget {
  const ProfileTutor({super.key});

  @override
  State<ProfileTutor> createState() => _ProfileTutorState();
}

class _ProfileTutorState extends State<ProfileTutor> {
  double? rating;
  String? subjects, phoneNumber, biography, fname, lname;
  String email = "";
  final _model = FirebaseService();
  var _userData;
  String? profileImageUrl;
  bool isLoading = true; // Add a loading state

  getData() async {
    try {
      var test = await _model.getUserData();
      setState(() {
        _userData = test;
        fname = _userData['first name'];
        lname = _userData['last name'];
        profileImageUrl = _userData['profileImageUrl'];
        // Handle subjects as a list
        if (_userData['subjects'] is List) {
          subjects = (_userData['subjects'] as List).join(', ');
        } else {
          subjects = _userData['subjects'];
        }
        biography = _userData['bio'];
        phoneNumber = _userData['phoneNumber'];
        email = _userData['email'];
        isLoading = false; // Update the loading state
      });
    } catch (err) {
      print(err);
      setState(() {
        isLoading = false; // Update the loading state even on error
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData(); // Call getData in initState
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return AppStartMenu(
      children: [
        if (isLoading)
          Center(child: CircularProgressIndicator()) // Show a loading indicator
        else
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: profileImageUrl != null
                          ? NetworkImage(profileImageUrl!)
                          : const AssetImage("images/nour.png")
                              as ImageProvider,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "$fname $lname",
                            style: textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.inverseSurface),
                          ),
                          Text(
                            "$subjects",
                            style: textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.inverseSurface),
                          ),
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            ignoreGestures: true,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 0.7),
                            itemSize: 20.0,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    height: 24.0,
                    color: colorScheme.inverseSurface,
                  ),
                  const SectionTitle(
                    title: "Phone Number",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$phoneNumber",
                          style: textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.inverseSurface),
                        ),
                        const Icon(
                          Icons.phone,
                          size: 40,
                        ),
                      ],
                    ),
                  ),

                  Divider(
                    height: 24.0,
                    color: colorScheme.inverseSurface,
                  ),
                  const SectionTitle(
                    title: "Biography",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "$biography",
                    style: textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.inverseSurface),
                  ),
                  Divider(
                    height: 24.0,
                    color: colorScheme.inverseSurface,
                  ),
                  // subjekts
                  const SectionTitle(
                    title: "Subjects",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: StreamBuilder(
                      stream: _model.getSubjectById(email),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.lightBlueAccent,
                            ),
                          );
                        }
                        final subjects = snapshot.data;
                        List<SubjectCard> subjectsCard = [];
                        subjects?.docs.forEach((doc) {
                          final sub = SubjectCard(
                              doc['subjectsName'],
                              doc['hourlyWage'],
                              doc['imgPath'],
                              4,
                              () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SubjectDetails(doc.data()))));
                          // print(doc.data());
                          subjectsCard.add(sub);
                        });
                        return Column(
                          children: subjectsCard,
                        );
                      },
                    ),
                  ),
                  Divider(
                    height: 24.0,
                    color: colorScheme.inverseSurface,
                  ),
                  // subjekts
                ],
              ),
            ],
          ),
      ],
    );
  }
}
