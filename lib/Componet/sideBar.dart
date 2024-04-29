import 'package:flutter/material.dart';

class DrawerSideBar extends StatelessWidget {
  const DrawerSideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            child: Text('Bild'), // TODO :add  Profile image and user name
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
              Navigator.pushNamed(context, "/home");
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
        ],
      ),
    );
  }
}
