import 'package:flutter/material.dart';

class SubjectCard extends StatefulWidget {
  final String SubjectsName;
  final String hourlyWage;
  final String imgPath;
  final int rate;
  final Function onpress;

  SubjectCard(this.SubjectsName, this.hourlyWage, this.imgPath, this.rate,
      this.onpress);

  @override
  State<SubjectCard> createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onpress(),
      child: Card(
        elevation: 5,
        borderOnForeground: true,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(
                      image: NetworkImage(widget.imgPath),
                      fit: BoxFit.cover,
                    ), // Use null if imageURL is not available
                  ),
                ),
                Column(
                  children: [
                    Text(
                      widget.SubjectsName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    Row(
                      children: [
                        Text(
                          "${widget.hourlyWage}€",
                          style: TextStyle(color: Colors.green, fontSize: 18),
                        ),
                        Text(
                          "/Hour",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  width: 70,
                  height: 70,
                  child: Center(
                      child: Text(
                    "${widget.rate}",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  )),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage(
                          'images/${widget.rate < 4 ? 'star' : 'starOn'}.png'), // Provide the path to your image asset
                      fit: BoxFit.cover, // You can adjust the fit as needed
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
