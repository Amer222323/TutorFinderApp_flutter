import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(
            Icons.error,
            color: Colors.white,
          ),
          const SizedBox(
              width: 8), // Add some space between the icon and the text
          Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Colors.red,
      elevation: 6.0,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

Widget buildTextField({
  required TextEditingController controller,
  required String hintText,
  bool obscureText = false,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.indigo.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
      border: Border.all(
        color: Colors.black12,
        width: 2,
      ),
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    ),
  );
}

class AppBarmenu extends StatefulWidget {
  final User user = FirebaseAuth.instance.currentUser!;

  @override
  State<AppBarmenu> createState() => _AppBarmenuState();
}

class _AppBarmenuState extends State<AppBarmenu> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      backgroundColor: Colors.transparent,
      leadingWidth: 90,
      title: Center(
          child: Text(widget.user.email!,
              style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
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
    );
  }
}
