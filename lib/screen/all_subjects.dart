import 'package:firebaseconnations/LayoutAppMenu/app_start_menu.dart';
import 'package:flutter/material.dart';

class AllSubjects extends StatelessWidget {
  const AllSubjects({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStartMenu(
      children: [
        const SizedBox(
          height: 30,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                print("object");
              },
              child: Card(
                borderOnForeground: true,
                shadowColor: Colors.black,
                surfaceTintColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Card(
                          shape: CircleBorder(),
                          child: Image(
                            image: AssetImage("images/nour.png"),
                          ),
                        ),
                        const Column(
                          children: [
                            Text(
                              "Name / Vorname",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                            Row(
                              children: [
                                Text(
                                  "10€",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 18),
                                ),
                                Text(
                                  "/Hour",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          child: const Center(
                              child: Text(
                            "2",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          )),
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: AssetImage(
                                  'images/star.png'), // Provide the path to your image asset
                              fit: BoxFit
                                  .cover, // You can adjust the fit as needed
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print("object");
              },
              child: Card(
                borderOnForeground: true,
                shadowColor: Colors.black,
                surfaceTintColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Card(
                          shape: CircleBorder(),
                          child: Image(
                            image: AssetImage("images/nour.png"),
                          ),
                        ),
                        const Column(
                          children: [
                            Text(
                              "Name / Vorname",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                            Row(
                              children: [
                                Text(
                                  "45€",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 18),
                                ),
                                Text(
                                  "/Hour",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          child: const Center(
                              child: Text(
                            "5",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          )),
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: AssetImage(
                                  'images/starOn.png'), // Provide the path to your image asset
                              fit: BoxFit
                                  .cover, // You can adjust the fit as needed
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print("object");
              },
              child: Card(
                borderOnForeground: true,
                shadowColor: Colors.black,
                surfaceTintColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Card(
                          shape: CircleBorder(),
                          child: Image(
                            image: AssetImage("images/nour.png"),
                          ),
                        ),
                        const Column(
                          children: [
                            Text(
                              "Name / Vorname",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                            Row(
                              children: [
                                Text(
                                  "30€",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 18),
                                ),
                                Text(
                                  "/Hour",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          child: const Center(
                              child: Text(
                            "5",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          )),
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: AssetImage(
                                  'images/starOn.png'), // Provide the path to your image asset
                              fit: BoxFit
                                  .cover, // You can adjust the fit as needed
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
