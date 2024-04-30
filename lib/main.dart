import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseconnations/screen/AllSubjects.dart';
import 'package:firebaseconnations/screen/Profile/CreateSubject.dart';
import 'package:firebaseconnations/screen/Profile/ProfilePrivet.dart';
import 'package:firebaseconnations/screen/Profile/ProfilePublic.dart';
import 'package:firebaseconnations/screen/Profile/ProfilePublicStudent.dart';
import 'package:firebaseconnations/screen/Seach.dart';
import 'package:firebaseconnations/screen/SubjecktDetalis.dart';
import 'package:firebaseconnations/screen/auth/login.dart';
import 'package:firebaseconnations/screen/auth/signup_screen.dart';
import 'package:firebaseconnations/screen/booking.dart';
import 'package:firebaseconnations/screen/homeScreen.dart';
import 'package:flutter/material.dart';

void main() async {
  // Ensure Flutter bindings are initialized before Firebase
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => Login(),
        "/Login": (context) => Login(), //TODO change a class to auth()
        "/signupScreen": (context) => SignUpScreen(),
        "/home": (context) => Home(),
        "/ProfilePublicStudent": (context) => ProfilePublicStudent(),
        "/ProfilePublic": (context) => ProfilePublic(),
        "/ProfilePrivet": (context) => ProfilePrivet(),
        "/booking": (context) => Booking(),
        "/bookingSuccessful ": (context) =>
            Login(), //TODO : text alert ? or pages
        "/bookingError": (context) => Login(), //TODO : text alert ? or pages
        "/SubjecktDetalis": (context) => SubjecktDetalis(),
        "/Search": (context) => Search(),
        "/CreateSubject": (context) => CreateSubject(),
        "/AllSubjects": (context) => AllSubjects(),
      },
      title: 'Flutter Demo',
      theme: ThemeData.light(),
    );
  }
}
