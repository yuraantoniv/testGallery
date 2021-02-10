import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_taks/screens/img_screen.dart';

String photoUrl;

class GalleryScreen extends StatefulWidget {
  static const String id = 'gallery_screen';

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List data = [];
  List<String> imgUrl = [];
  List<String> firstName = [];
  List<String> lastName = [];
  List<String> description = [];
  bool contenShow = false;

  getData() async {
    String url =
        'https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0';
    http.Response response = await http.get(url);
    data = json.decode(response.body);
    _assign();
    setState(() {
      contenShow = true;
    });
  }

  _assign() {
    for (var i = 0; i < data.length; i++) {
      imgUrl.add(data.elementAt(i)["urls"]["regular"]);
      description.add(data.elementAt(i)["description"]);
      firstName.add(data.elementAt(i)["user"]["first_name"]);
      lastName.add(data.elementAt(i)["user"]["last_name"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: !contenShow
          ? Center(
              child: CircularProgressIndicator(
                strokeWidth: 4,
                backgroundColor: Color(0xFF6D49D8),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: ListView.separated(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.pushNamed(context, ImgScreen.id);
                            photoUrl = imgUrl.elementAt(index);
                          },
                          child: Image(
                            image: NetworkImage(imgUrl.elementAt(index)),
                            width: 100,
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 120),
                          child: Text(
                            "${description.elementAt(index) == null ? '' : description.elementAt(index)}",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Text(
                          "${firstName.elementAt(index)} ${lastName.elementAt(index) == null ? '' : lastName.elementAt(index)}",
                          style: TextStyle(fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Divider(
                      color: Color(0xFF6D49D8),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
