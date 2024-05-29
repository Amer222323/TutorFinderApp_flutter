import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerSideBar extends StatelessWidget {
  DrawerSideBar({
    super.key,
  });

  final User? _currentUser = FirebaseAuth.instance.currentUser;

  Future<bool> getUserData() async {
    var _email = _currentUser?.email;
    final _fireStore = FirebaseFirestore.instance;

    var _data = await _fireStore
        .collection('users')
        .where('email', isEqualTo: _email)
        .get();
    var role = _data.docs.first.data()['role'];
    var check = role == 'Tutor';
    return check;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While the future is loading, show a loading indicator
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // If the future encountered an error, show an error message
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          // When the future completes successfully, show the drawer based on the data
          if (snapshot.data!) {
            return Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child:
                        Text('Bild'), // TODO: add Profile image and user name
                  ),
                  ListTile(
                    title: const Text('signupScreen'),
                    onTap: () {
                      Navigator.pushNamed(context, "/signupScreen");
                    },
                  ),
                  ListTile(
                    title: const Text('Login'),
                    onTap: () {
                      Navigator.pushNamed(context, "/Login");
                    },
                  ),
                  ListTile(
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pushNamed(context, "/");
                    },
                  ),
                  ListTile(
                    title: const Text('ProfilePublicStudent'),
                    onTap: () {
                      Navigator.pushNamed(context, "/ProfilePublicStudent");
                    },
                  ),
                  ListTile(
                    title: const Text('ProfilePublic'),
                    onTap: () {
                      Navigator.pushNamed(context, "/ProfilePublic");
                    },
                  ),
                  ListTile(
                    title: const Text('ProfilePrivet'),
                    onTap: () {
                      Navigator.pushNamed(context, "/ProfilePrivet");
                    },
                  ),
                  ListTile(
                    title: const Text('booking'),
                    onTap: () {
                      Navigator.pushNamed(context, "/booking");
                    },
                  ),
                  ListTile(
                    title: const Text('bookingSuccessful'),
                    onTap: () {
                      Navigator.pushNamed(context, "/bookingSuccessful");
                    },
                  ),
                  ListTile(
                    title: const Text('bookingError'),
                    onTap: () {
                      Navigator.pushNamed(context, "/bookingError");
                    },
                  ),
                  ListTile(
                    title: const Text('SubjecktDetalis'),
                    onTap: () {
                      Navigator.pushNamed(context, "/SubjecktDetalis");
                    },
                  ),
                  ListTile(
                    title: const Text('Search'),
                    onTap: () {
                      Navigator.pushNamed(context, "/Search");
                    },
                  ),
                  ListTile(
                    title: const Text('Create Subject'),
                    onTap: () {
                      Navigator.pushNamed(context, "/CreateSubject");
                    },
                  ),
                  ListTile(
                    title: const Text('All-Subjects'),
                    onTap: () {
                      Navigator.pushNamed(context, "/AllSubjects");
                    },
                  ),
                  ListTile(
                    title: const Text('Change Password'),
                    onTap: () {
                      Navigator.pushNamed(context, "/ChangePassword");
                    },
                  ),
                ],
              ),
            );
          } else {
            return Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child:
                        Text('Bild'), // TODO: add Profile image and user name
                  ),
                  ListTile(
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pushNamed(context, "/");
                    },
                  ),
                  ListTile(
                    title: const Text('ProfilePrivet'),
                    onTap: () {
                      Navigator.pushNamed(context, "/ProfilePrivet");
                    },
                  ),
                  ListTile(
                    title: const Text('booking'),
                    onTap: () {
                      Navigator.pushNamed(context, "/booking");
                    },
                  ),
                  ListTile(
                    title: const Text('Search'),
                    onTap: () {
                      Navigator.pushNamed(context, "/Search");
                    },
                  ),
                  ListTile(
                    title: const Text('All-Subjects'),
                    onTap: () {
                      Navigator.pushNamed(context, "/AllSubjects");
                    },
                  ),
                ],
              ),
            );
          }
        } else {
          // If the future doesn't have data (shouldn't normally happen)
          return Center(child: Text('No data available'));
        }
      },
    );
  }
}
