import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "images/homeK.png", // Replace "background.jpg" with your image asset
              fit: BoxFit.cover,
            ),
          ),
          AppBar(
            toolbarHeight: 90,
            backgroundColor: Colors.transparent,
            leadingWidth: 90,
            title: Center(
                child: Text(user.email!,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold))),
            leading: IconButton(
              icon: Image.asset(
                "images/menuIcon.png",
                width: 80, // Adjust the width of the image
                height: 80, // Adjust the height of the image
                fit: BoxFit.fill, // Adjust the fit of the image
              ),
              onPressed: () {
                // Add your navigation logic here
                // For example, Navigator.pop(context) to pop the current route
              },
            ),
            actions: [
              IconButton(
                icon: Image.asset("images/profileIcon.png"), // Menu button icon
                onPressed: () {
                  // Add your menu button logic here to open the menu
                },
              ),
            ],
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Hello , you are signed in",
                      style: TextStyle(fontSize: 22)),
                  Text(user.email!, style: const TextStyle(fontSize: 22)),
                  MaterialButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      color: Colors.lightBlueAccent,
                      child: const Text("sign out"))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
