import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseconnations/Model/subject_model.dart';
import 'package:flutter/material.dart';

class DrawerSideBar extends StatelessWidget {
  DrawerSideBar({
    super.key,
  });
  final _model = Subjects();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _model.checkRolle(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          if (snapshot.data!) {
            return Drawer(
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
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pushNamed(context, "/");
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
                    title: const Text('All-Subjects'),
                    onTap: () {
                      Navigator.pushNamed(context, "/AllSubjects");
                    },
                  ),
                  ListTile(
                    title: ElevatedButton(
                      onPressed: () {
                        _auth.signOut();
                        Navigator.pushNamed(context, "/");
                      },
                      child: const Text('Logout'),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/ChangePassword");
                    },
                  ),
                ],
              ),
            );
          } else {
            return Drawer(
              child: ListView(
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
                    title: const Text('All-Subjects'),
                    onTap: () {
                      Navigator.pushNamed(context, "/AllSubjects");
                    },
                  ),
                  ListTile(
                    title: ElevatedButton(
                      onPressed: () {
                        _auth.signOut();
                        Navigator.pushNamed(context, "/");
                      },
                      child: const Text('Logout'),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/ChangePassword");
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
