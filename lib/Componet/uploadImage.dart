import 'package:flutter/material.dart';

class UploadImage extends StatefulWidget {
  UploadImage(this.createData);
  final Function createData;

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  var image = 'images/nour.png';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => widget.createData(),
          child: const Stack(
            children: [
              Positioned(
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/nour.png'),
                  ),
                ),
              ),
              Positioned(
                top: 88,
                left: 70,
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon(
                    Icons.upload_file,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
              Positioned(
                top: 155,
                left: 25,
                child: Text(
                  "click to upload",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
