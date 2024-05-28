import 'package:flutter/material.dart';

class UploadImage extends StatefulWidget {
  const UploadImage(this.createData, this.imgPath, {super.key});
  final Function createData;
  final imgPath;
  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () async {
            widget.createData();
            // Update the selected image after it's chosen
            setState(() {
              print(widget.imgPath);
            });
          },
          child: Stack(
            children: [
              Positioned(
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: widget.imgPath != null
                      ? CircleAvatar(
                          backgroundImage: FileImage(widget.imgPath),
                        )
                      : const CircleAvatar(
                          backgroundImage: AssetImage('images/nour.png'),
                        ),
                ),
              ),
              const Positioned(
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
              const Positioned(
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
