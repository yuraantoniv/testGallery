import 'package:flutter/material.dart';
import 'screens/gallery_list_screen.dart';
import 'screens/img_screen.dart';

void main() {
  runApp(Gallery());
}

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF6D49D8),
        accentColor: Color(0xFF000000),
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: GalleryScreen.id,
      routes: {
        GalleryScreen.id: (context) => GalleryScreen(),
        ImgScreen.id: (context) => ImgScreen()
      },
    );
  }
}
