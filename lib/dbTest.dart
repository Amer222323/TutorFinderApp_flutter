import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseconnations/LayoutAppMenu/app_start_menu.dart';
import 'package:flutter/cupertino.dart';

class DBtest extends StatefulWidget {
  DBtest({super.key});

  @override
  State<DBtest> createState() => _DBtestState();
}

class _DBtestState extends State<DBtest> {
  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<bool> getUserData() async {
    var _email = currentUser?.email;
    final _fireStore = await FirebaseFirestore.instance;

    var _data = await _fireStore
        .collection('users')
        .where('email', isEqualTo: _email)
        .get();
    var role = _data.docs.first.data()['role'];
    var check = role == 'Tutor';
    return await check;
    // print(role);
    // print(currentUser?.email);
  }

  @override
  void initState() {
    super.initState();

    getUserData().then((result) {
      if (result) {
        print("der ist tutor");
      } else {
        print("der ist user");
      }
    }).catchError((error) {
      print("Error: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppStartMenu(children: [
      Container(
        child: Text('$getUserData()'),
      )
    ]);
  }
}
