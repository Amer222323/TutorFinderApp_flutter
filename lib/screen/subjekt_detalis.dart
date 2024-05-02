import 'package:firebaseconnations/Componet/ActionBtn.dart';
import 'package:firebaseconnations/LayoutAppMenu/app_start_menu.dart';
import 'package:firebaseconnations/screen/booking.dart';
import 'package:flutter/material.dart';

class SubjecktDetalis extends StatefulWidget {
  // final _fireStore = FirebaseFirestore.instance;
  SubjecktDetalis(this.subId);
  final subId;

  @override
  State<SubjecktDetalis> createState() => _SubjecktDetalisState();
}

class _SubjecktDetalisState extends State<SubjecktDetalis> {
  late var dataSub;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataSub = widget.subId;
    print(widget.subId);
  }

  late String imgPath = widget.subId['imgPath'];
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
              CircleAvatar(radius: 100, backgroundImage: NetworkImage(imgPath)),
              Text(
                widget.subId['subjectsName'],
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
              Text(
                "${widget.subId['Tutor']}",
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
              Padding(
                  padding: EdgeInsets.all(32),
                  child: Text(
                      style: TextStyle(
                          fontFamily: 'Montserratitalic',
                          fontSize: 17,
                          color: Colors.black),
                      '${widget.subId['description']}')),
              ActionBtn(() {
                // TODO Booking neu Page with id
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Booking()));
              }, "Booking neu", Icons.arrow_right, null),
            ],
          ),
        )
      ],
    );
  }
}
