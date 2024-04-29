import 'package:firebaseconnations/LayoutAppMenu/Appstart_Menu.dart';
import 'package:flutter/material.dart';

class CreateSubject extends StatefulWidget {
  const CreateSubject({super.key});

  @override
  State<CreateSubject> createState() => _CreateSubjectState();
}

class _CreateSubjectState extends State<CreateSubject> {
  void onPress() {}
  @override
  Widget build(BuildContext context) {
    return Appstart_Menu(
      children: [
        SizedBox(
          height: 110,
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Hourly fees',
                        icon: Icon(Icons.euro))),
              ),
              SizedBox(
                height: 100,
                child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Hourly fees',
                        icon: Icon(Icons.euro))),
              ),
              SizedBox(
                height: 100,
                child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Hourly fees',
                        icon: Icon(Icons.image))),
              ),
              SizedBox(
                height: 100,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
                      hintText: "Subject description",
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.redAccent))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: FloatingActionButton(
                  onPressed: onPress,
                  backgroundColor: Colors.blue,
                  child: Row(
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
