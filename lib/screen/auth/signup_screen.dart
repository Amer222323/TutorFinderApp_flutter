import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseconnations/Componet/snackbar.dart';
import 'package:firebaseconnations/LayoutAppMenu/app_start_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final List<String> genderItems = ['Male', 'Female'];
  String? selectedGender;

  Future<void> signUp() async {
    if (passwordConfirmed()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        await addUserDetails(
          _firstNameController.text.trim(),
          _lastNameController.text.trim(),
          _emailController.text.trim(),
          int.parse(_ageController.text.trim()),
          selectedGender,
        );
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed("/");
      } catch (e) {
        showCustomSnackBar(context, "error signing Up");
      }
    }
  }

  Future<void> addUserDetails(
    String firstName,
    String lastName,
    String email,
    int age,
    String? gender,
  ) async {
    await FirebaseFirestore.instance.collection("users").add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'age': age,
      'gender': gender,
    });
  }

  bool passwordConfirmed() {
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();
    if (password == confirmPassword) {
      return passwordMeetsCriteria(password);
    } else {
      showCustomSnackBar(context, "The passwords didn't match");
      return false;
    }
  }

  bool passwordMeetsCriteria(String password) {
    String pattern =
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&\(\)])[A-Za-z\d@\(\)$!%*?&+**,&%#*!#@]{8,}$";
    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(password)) {
      return true;
    } else {
      showCustomSnackBar(context, "Your password is not strong enough");
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void openLoginScreen() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppStartMenu(children: [
      Text(
        'SIGN UP',
        style: GoogleFonts.robotoCondensed(
          fontSize: 60,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          letterSpacing: .5,
        ),
      ),
      const SizedBox(height: 25),
      Text(
        'Welcome! Here you can sign up :-)',
        style: GoogleFonts.robotoCondensed(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 25),
      buildTextField(
        controller: _firstNameController,
        hintText: "First Name",
      ),
      const SizedBox(height: 15),
      buildTextField(
        controller: _lastNameController,
        hintText: "Last Name",
      ),
      const SizedBox(height: 15),
      buildTextField(
        controller: _ageController,
        hintText: "Age",
      ),
      const SizedBox(height: 15),
      Container(
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
        child: DropdownButtonFormField2<String>(
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          isExpanded: true,
          hint: const Text(
            'Select Your Gender',
            style: TextStyle(fontSize: 16, color: Color(0xFF595959)),
          ),
          items: genderItems
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF595959),
                      ),
                    ),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return 'Please select gender.';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              selectedGender = value;
            });
          },
          onSaved: (value) {
            selectedGender = value;
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              color: const Color(0xFFDEDEDE),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ),
      const SizedBox(height: 15),
      buildTextField(
        controller: _emailController,
        hintText: "Email",
      ),
      const SizedBox(height: 15),
      buildTextField(
        controller: _passwordController,
        hintText: "Password",
        obscureText: true,
      ),
      const SizedBox(height: 15),
      buildTextField(
        controller: _confirmPasswordController,
        hintText: "Confirm Password",
        obscureText: true,
      ),
      const SizedBox(height: 25),
      GestureDetector(
        onTap: signUp,
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent[700],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              "Sign up",
              style: GoogleFonts.robotoCondensed(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already a member? ",
            style: GoogleFonts.robotoCondensed(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          GestureDetector(
            onTap: openLoginScreen,
            child: Text(
              "Sign in here",
              style: GoogleFonts.robotoCondensed(
                color: Colors.blue[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 40)
    ]);
  }
}
