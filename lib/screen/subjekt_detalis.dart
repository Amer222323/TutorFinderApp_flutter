import 'package:firebaseconnations/LayoutAppMenu/app_start_menu.dart';
import 'package:flutter/material.dart';

class SubjecktDetalis extends StatefulWidget {
  const SubjecktDetalis({super.key});

  @override
  State<SubjecktDetalis> createState() => _SubjecktDetalisState();
}

class _SubjecktDetalisState extends State<SubjecktDetalis> {
  void onPress() {}

  @override
  Widget build(BuildContext context) {
    return AppStartMenu(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          color: Colors.white70,
          padding: const EdgeInsets.all(23),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage("images/nour.png"),
              ),
              const Text(
                "Name/Vorname",
                style: TextStyle(fontFamily: 'MontserratBold', fontSize: 24),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage("images/starOn.png")),
                  Image(image: AssetImage("images/starOn.png")),
                  Image(image: AssetImage("images/starOn.png")),
                  Image(image: AssetImage("images/star.png")),
                  Image(image: AssetImage("images/star.png")),
                ],
              ),
              const Text(
                "@User",
                style: TextStyle(
                    fontFamily: 'MontserratBold',
                    fontSize: 24,
                    color: Colors.black26),
              ),
              const SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.black12,
                ),
              ),
              const Padding(
                  padding: EdgeInsets.all(32),
                  child: Text(
                      style: TextStyle(
                          fontFamily: 'Montserratitalic',
                          fontSize: 17,
                          color: Colors.black),
                      "sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor ")),
              SizedBox(
                width: 200, // Set your desired width
                height: 50, //
                child: FloatingActionButton(
                  onPressed: onPress,
                  backgroundColor: Colors.blueAccent,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bookin neu",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
