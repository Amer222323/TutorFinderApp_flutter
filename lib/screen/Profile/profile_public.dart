import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseconnations/LayoutAppMenu/app_start_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../widgets/title/section_title.dart';

class ProfilePublic extends StatefulWidget {
  final String tutorId;
  const ProfilePublic({super.key, required this.tutorId});

  @override
  State<ProfilePublic> createState() => _ProfilePublicState();
}

class _ProfilePublicState extends State<ProfilePublic> {
  double? rating;
  String? name;
  String? subjects;
  String? phoneNumber;
  String? biography;
  @override
  void initState() {
    super.initState();
    fetchRating();
  }

  Future<void> fetchRating() async {
    try {
      // Replace 'tutorId' with the specific document ID
      DocumentSnapshot tutorDoc = await FirebaseFirestore.instance
          .collection('sampleTutors')
          .doc(widget.tutorId) // Use the actual document ID here
          .get();
      if (tutorDoc.exists) {
        setState(() {
          rating = (tutorDoc['rating'] ?? 0).toDouble();
        });
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error fetching rating: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return AppStartMenu(
      children: [
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
                  const CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage("images/nour.png"),
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
                          "Tutor Name",
                          style: textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.inverseSurface),
                        ),
                        Text(
                          "Subjects",
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
                        "+490159067110",
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
                  "Born into a family of educators, I discovered my love for mathematics at a young age. With a desire to inspire and innovate, I embarked on a mission to teach math in a way that sparks curiosity and fosters understanding. Through creativity and dedication, I strive to empower my students to embrace math as both a tool for problem-solving and a source of endless fascination.",
                  style: textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.inverseSurface),
                ),
                Divider(
                  height: 24.0,
                  color: colorScheme.inverseSurface,
                ),
                const SectionTitle(
                  title: "Working Time",
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "from Monday To Friday 12:00-17:00",
                  style: textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.inverseSurface),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/booking');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue, // Text color
                backgroundColor:
                    Colors.grey.withOpacity(0.2), // Background color
                padding: const EdgeInsets.symmetric(
                    horizontal: 50, vertical: 12), // Padding
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text("Book Now"),
            ),
          ],
        ),
      ],
    );
  }
}
