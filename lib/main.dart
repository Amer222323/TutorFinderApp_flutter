import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseconnations/screen/Profile/create_subject.dart';
import 'package:firebaseconnations/screen/Profile/profile_privet.dart';
import 'package:firebaseconnations/screen/Profile/profile_public.dart';
import 'package:firebaseconnations/screen/Profile/profile_public_student.dart';
import 'package:firebaseconnations/screen/all_subjects.dart';
import 'package:firebaseconnations/screen/auth/auth.dart';
import 'package:firebaseconnations/screen/auth/login.dart';
import 'package:firebaseconnations/screen/auth/signup_screen.dart';
import 'package:firebaseconnations/screen/booking.dart';
import 'package:firebaseconnations/screen/home_screen.dart';
import 'package:firebaseconnations/screen/search.dart';
import 'package:flutter/material.dart';

void main() async {
  // Ensure Flutter bindings are initialized before Firebase
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const Auth(),
        "/Login": (context) => const Login(), //TODO change a class to auth()
        "/signupScreen": (context) => const SignUpScreen(),
        "/home": (context) => const Home(),
        "/ProfilePublicStudent": (context) => const ProfilePublicStudent(),
        "/ProfilePublic": (context) => const ProfilePublic(),
        "/ProfilePrivet": (context) => const ProfilePrivate(),
        "/booking": (context) => const Booking(),
        "/bookingSuccessful ": (context) =>
            const Login(), //TODO : text alert ? or pages
        "/bookingError": (context) =>
            const Login(), //TODO : text alert ? or pages
        "/Search": (context) => const Search(),
        "/CreateSubject": (context) => const CreateSubject(),
        "/AllSubjects": (context) => const AllSubjects(),
      },
      title: 'Flutter Demo',
      theme: ThemeData.light(),
    );
  }
}
