import 'package:firebaseconnations/Componet/sideBar.dart';
import 'package:flutter/material.dart';

class Appstart_Menu extends StatelessWidget {
  const Appstart_Menu({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    late List<Widget> childrens = children ?? [];
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage(
              'images/homeK.jpg'), // Provide the path to your image asset
          fit: BoxFit.cover, // You can adjust the fit as needed
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: DrawerSideBar(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(23),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: childrens,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}