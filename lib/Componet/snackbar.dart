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
            style: const TextStyle(color: Colors.white, fontSize: 20),
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
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
