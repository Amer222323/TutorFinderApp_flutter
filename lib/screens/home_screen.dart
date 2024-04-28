import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseconnations/snackbar_util.dart';
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
          AppBarmenu(),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Hello , you are signed in",
                      style: TextStyle(fontSize: 22)),
                  Text(user.email!,
                      style: const TextStyle(
                          fontFamily: 'Source Sans 3',
                          fontSize: 22,
                          letterSpacing: 2.5,
                          fontWeight: FontWeight.bold)),
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
