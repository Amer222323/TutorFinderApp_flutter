import 'package:firebaseconnations/LayoutAppMenu/app_start_menu.dart';
import 'package:flutter/material.dart';

import '../auth/login.dart';

class ProfilePublic extends StatelessWidget {
  const ProfilePublic({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStartMenu(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("images/nour.png"),
          radius: 65.0,
        ),
        const SizedBox(height: 25),
        ExpansionTile(
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
                buildReadOnlyField("First Name", "John"),
                buildReadOnlyField("Last Name", "Doe"),
                buildReadOnlyField("Age", "30"),
                buildReadOnlyField("Phone Number", "+1234567890"),
                buildReadOnlyField("Price", "\$50"),
              ],
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

  Widget buildReadOnlyField(String label, String value) {
    return ListTile(
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
