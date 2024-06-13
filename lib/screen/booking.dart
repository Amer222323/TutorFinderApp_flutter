import 'package:firebaseconnations/LayoutAppMenu/app_start_menu.dart';
import 'package:flutter/cupertino.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStartMenu(children: [Text('booking')]);
  }
}
