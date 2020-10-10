import 'package:flutter/material.dart';
import 'package:gridview_demo/album.dart';

class GridDetails extends StatefulWidget {
  final Album curAlbum;
  GridDetails({this.curAlbum});
  @override
  _GridDetailsState createState() => _GridDetailsState();
}

class _GridDetailsState extends State<GridDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.curAlbum.title),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeInImage.assetNetwork(
                placeholder: "images/no_image.png", image: widget.curAlbum.url),
            SizedBox(
              height: 30.0,
            ),
            OutlineButton(
                child: Icon(Icons.close),
                color: Colors.red,
                onPressed: () => Navigator.of(context).pop())
          ],
        ),
      ),
    );
  }
}
