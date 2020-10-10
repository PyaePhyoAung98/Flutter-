import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gridview_demo/album.dart';
import 'package:gridview_demo/gridCell.dart';
import 'package:gridview_demo/services.dart';
import 'details.dart';

void main() => (runApp(MaterialApp(
      home: GridViewDemo(),
      title: "GridViewDemo",
    )));

class GridViewDemo extends StatefulWidget {
  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title:StreamBuilder(
        //   initialData: 0,
        //   stream:streamController.stream,
        //   builder: (BuildContext context, AsyncSnapshot snapshot{
        //     return Text('${widget.title} ${snapshot.data}');
        // }
        // ),
        // )
        title: Text("GridViewDemo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: FutureBuilder<List<Album>>(
              future: Services.getPhotos(),
              builder: (context, snapshot) {
                //not setstate here
                if (snapshot.hasError) {
                  return Text('Error ${snapshot.error}');
                }
                if (snapshot.hasData) {
                  streamController.sink.add(snapshot.data.length);
                  //gridview
                  return gridView(snapshot);
                }
                return circularProgress();
              },
            ),
          )
        ],
      ),
    );
  }

  StreamController<int> streamController = new StreamController<int>();
  gridView(AsyncSnapshot<List<Album>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: snapshot.data.map(
          (album) {
            return GestureDetector(
              child: GridTile(
                child: AlbumCell(context, album),
              ),
              onTap: () {
                goToDetailsPage(context, album);
              },
            );
          },
        ).toList(),
      ),
    );
  }

  goToDetailsPage(BuildContext context, Album album) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => GridDetails(
          curAlbum: album,
        ),
      ),
    );
  }

  circularProgress() {
    return Center(
      child: const CircularProgressIndicator(),
    );
  }
}
