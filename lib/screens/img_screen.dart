import 'package:flutter/material.dart';
import 'gallery_list_screen.dart';

class ImgScreen extends StatefulWidget {
  static const String id = 'img_screen';
  final String photoUrl;

  ImgScreen({Key key, this.photoUrl}) : super(key: key);

  @override
  _ImgScreenState createState() => _ImgScreenState();
}

class _ImgScreenState extends State<ImgScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: NetworkImage(photoUrl),
        ),
      ),
    );
  }
}
